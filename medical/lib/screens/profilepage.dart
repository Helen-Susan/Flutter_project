import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medical/screens/settings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showFullList = false;
  int pageIndex = 0;

  final pages = [ProfilePage(), Setting()];
  final List<Map<String, String>> carouselItems = [
    {
      'title': 'Health Tips:',
      'description': '- Stay hydrated.\n- Take medicines on time.',
    },
    {
      'title': 'App Usage Stats:',
      'description':
          '- You completed 85% of reminders this week.\n- No missed doses—keep it up!',
    },
  ];

  // Variables to store fetched Firestore data
  List<Map<String, dynamic>> details1 = [];

  @override
  void initState() {
    super.initState();
    fetchDetailsFromFirestore();
  }

  // Fetch data based on authenticated user
  Future<void> fetchDetailsFromFirestore() async {
    try {
      // Get the current user UID
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userId1 = user.uid;
        print('Current User ID: $userId1');
        final details = await FirebaseFirestore.instance
            .collection('Register')
            .where('uid', isEqualTo: userId1)
            .get();

        print('Fetched details count: ${details.docs.length}');

        // Check if documents exist
        if (details.docs.isNotEmpty) {
          // Map the Firestore documents into a list
          final doctorList = details.docs.map((doc) {
            print('Document data: ${doc.data()}');
            return {
              'name': doc['name'] ?? 'No Name',
              'pharmacy': doc['pharmacy'] ?? 'No Pharmacy',
              'medcine1': doc['med1'] ?? 'No Medicine 1',
              'medicine2': doc['med2'] ?? 'No Medicine 2',
              'doc1': doc['doctor1'] ?? 'No Doctor 1',
              'doc2': doc['doctor2'] ?? 'No Doctor 2',
            };
          }).toList();

          // Debugging output to check the doctor list
          print('Doctor List: $doctorList');

          setState(() {
            details1 = doctorList;
          });
        } else {
          print("No documents found for the user");
          // Optionally, show a user-friendly message in the UI
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No user details found')),
          );
        }
      } else {
        print("No user logged in");
        // Optionally, handle unauthenticated state
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please log in')),
        );
      }
    } catch (e) {
      print('Error fetching details from Firestore: $e');
      // Show error to user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching user details')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    // Carousel for Health Tips and App Usage Stats
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1,
                        aspectRatio: 16 / 9,
                      ),
                      items: carouselItems.map((item) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Card(
                              color: Colors.blue[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text(
                                      item['title']!,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      item['description']!,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              // Doctor Details Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Consulting Doctors',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    details1.isNotEmpty
                        ? Card(
                            child: Column(
                              children: details1.expand((details) {
                                return [
                                  ListTile(
                                    leading: const CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        'https://static.vecteezy.com/system/resources/thumbnails/028/287/555/small_2x/an-indian-young-female-doctor-isolated-on-green-ai-generated-photo.jpg',
                                      ),
                                    ),
                                    title: Text(details['doc1']),
                                    trailing: SizedBox(
                                      width: 60,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Icon(Icons.message),
                                          Icon(Icons.call),
                                        ],
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: const CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        'https://png.pngtree.com/png-vector/20230928/ourmid/pngtree-young-afro-professional-doctor-png-image_10148632.png',
                                      ),
                                    ),
                                    title: Text(details['doc2']),
                                    trailing: SizedBox(
                                      width: 60,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Icon(Icons.message),
                                          Icon(Icons.call),
                                        ],
                                      ),
                                    ),
                                  ),
                                ];
                              }).toList(),
                            ),
                          )
                        : Center(child: Text('No doctor details found')),
                  ],
                ),
              ),
              // Pharmacy Details Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Preferred Pharmacy',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    details1.isNotEmpty
                        ? Card(
                            child: Column(
                              children: details1.map((details) {
                                return ListTile(
                                  title: Text(details['pharmacy']),
                                  trailing: SizedBox(
                                    width: 60,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Icon(Icons.message),
                                        Icon(Icons.call),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        : Center(child: Text('No pharmacy details found')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
