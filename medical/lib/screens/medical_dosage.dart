import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MedicalDosage extends StatefulWidget {
  MedicalDosage({super.key});

  @override
  State<MedicalDosage> createState() => _MedicalDosageState();
}

class _MedicalDosageState extends State<MedicalDosage> {
  int currentPageIndex = 0; // Variables to store fetched Firestore data

  // ariables to store fetched Firestore data
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
              'medimorning': doc['med1'] ?? 'No Medicine',
              'med2mornig': doc['med2'] ?? 'No Pharmacy',
              'med3': doc['med1'] ?? 'No Medicine 1',
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

  // Data structure to hold medicine information by time
  final Map<String, List<Medicine>> medicineSchedule = {
    'Morning': [
      Medicine(name: "Allergy", dosage: "10mg"),
      Medicine(name: "Blood Pressure Med", dosage: "5mg"),
    ],
    'Afternoon': [
      Medicine(name: "Paracetamol", dosage: "20mg"),
      Medicine(name: "Iron Supplement", dosage: "15mg"),
    ],
    'Evening': [
      Medicine(name: "Allergy Med", dosage: "30mg"),
      Medicine(name: "Calcium", dosage: "500mg"),
    ],
  }; //dictonary

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 248, 255, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 248, 255, 1),
        title: Text(
          "Medical_app",
          style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              "TODAY",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: medicineSchedule.length,
              itemBuilder: (context, index) {
                String timeSlot = medicineSchedule.keys.elementAt(index);
                List<Medicine> medicines = medicineSchedule[timeSlot]!;

                return Card(
                  color: Color.fromRGBO(175, 219, 245, 1),
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          timeSlot,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: medicines.length,
                        itemBuilder: (context, medicineIndex) {
                          return ListTile(
                            title: Text(medicines[medicineIndex].name),
                            subtitle: Text(medicines[medicineIndex].dosage),
                            trailing: Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.green,
                              value: medicines[medicineIndex].isTaken,
                              onChanged: (bool? value) {
                                setState(() {
                                  medicines[medicineIndex].isTaken = value!;
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Medicine class to hold information about each medicine
class Medicine {
  final String name;
  final String dosage;
  bool isTaken;

  Medicine({
    required this.name,
    required this.dosage,
    this.isTaken = false,
  });
}
