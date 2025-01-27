import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MedicalDosage extends StatefulWidget {
  const MedicalDosage({super.key});

  @override
  State<MedicalDosage> createState() => _MedicalDosageState();
}

class _MedicalDosageState extends State<MedicalDosage> {
  Map<String, List<Medicine>> medicineSchedule = {
    'Morning': [],
    'Afternoon': [],
    'Evening': [],
  };
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDetailsFromFirestore();
  }

  Future<void> fetchDetailsFromFirestore() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userId = user.uid;
        final details = await FirebaseFirestore.instance
            .collection('Register')
            .where('uid', isEqualTo: userId)
            .get();

        if (details.docs.isNotEmpty) {
          final doc = details.docs.first.data();

          setState(() {
            medicineSchedule = {
              'Morning': [
                Medicine(
                  name: doc['med1'] ?? 'No Medicine',
                  dosage: doc['dosm'] ?? 'No Dosage',
                ),
                Medicine(
                  name: doc['med2'] ?? 'No Medicine',
                  dosage: doc['dos2m'] ?? 'No Dosage',
                ),
              ],
              'Afternoon': [
                Medicine(
                  name: doc['med1a'] ?? 'No Medicine',
                  dosage: doc['dosaf1'] ?? 'No Dosage',
                ),
                Medicine(
                  name: doc['med2a'] ?? 'No Medicine',
                  dosage: doc['dosaf2'] ?? 'No Dosage',
                ),
              ],
              'Evening': [
                Medicine(
                  name: doc['med1even'] ?? 'No Medicine',
                  dosage: doc['dos1e'] ?? 'No Dosage',
                ),
                Medicine(
                  name: doc['med2even'] ?? 'No Medicine',
                  dosage: doc['dos2e'] ?? 'No Dosage',
                ),
              ],
            };
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No user details found')),
          );
        }
      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please log in')),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching user details: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 248, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(240, 248, 255, 1),
        title: const Text(
          "Medical_app",
          style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
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
                        color: const Color.fromRGBO(175, 219, 245, 1),
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                timeSlot,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: medicines.length,
                              itemBuilder: (context, medicineIndex) {
                                final medicine = medicines[medicineIndex];
                                return ListTile(
                                  title: Text(medicine.name),
                                  subtitle: Text(medicine.dosage),
                                  trailing: Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.green,
                                    value: medicine.isTaken,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        medicine.isTaken = value!;
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
