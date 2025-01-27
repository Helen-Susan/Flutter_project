import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:flutter/material.dart';
import 'package:medical/screens/navigation.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final namController = TextEditingController();
  final phoneController = TextEditingController();
  final medcontroller = TextEditingController();
  final med2controller = TextEditingController();
  final doctor1 = TextEditingController();
  final doctor2 = TextEditingController();
  final pharmacy1 = TextEditingController();
  final pharmacy2 = TextEditingController();
  //final time1 = TextEditingController();
  //final time2 = TextEditingController();
  final dosm = TextEditingController();
  final dosm2 = TextEditingController();
  final med1a = TextEditingController();
  final med2a = TextEditingController();
  final dosaf1 = TextEditingController();
  final dosaf2 = TextEditingController();
  final med1even = TextEditingController();
  final med2even = TextEditingController();
  final dos1e = TextEditingController();
  final dos2e = TextEditingController();

  // Get the current user UID
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? currentUser;

  @override
  void initState() {
    super.initState();
    // Get the current user
    currentUser = _auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.alice,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Medicare",
          style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Update your profile ",
                    style: TextStyle(color: Color.fromRGBO(175, 219, 245, 6))),
                const SizedBox(height: 20),
                TextFormField(
                  controller: namController,
                  decoration: const InputDecoration(
                    labelText: "Enter your Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30.0),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: "Enter your phone number",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30.0),
                TextFormField(
                  controller: doctor1,
                  decoration: const InputDecoration(
                    labelText: "Enter your doctor's name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30.0),
                TextFormField(
                  controller: doctor2,
                  decoration: const InputDecoration(
                    labelText: "Enter your 2nd doctor's name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(children: [
                          Text(" Enter Morning  Medicine"),
                          TextFormField(
                            controller: medcontroller,
                            decoration: const InputDecoration(
                              labelText: "Enter your 1st medicine name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: dosm,
                            decoration: const InputDecoration(
                              labelText: "Enter your 1st medicine dosage",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          TextFormField(
                            controller: med2controller,
                            decoration: const InputDecoration(
                              labelText: "Enter your 2nd medicine name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          TextFormField(
                            controller: dosm2,
                            decoration: const InputDecoration(
                              labelText: "Enter your 2nd medicine dosage",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          Text(" Enter Afternoon  Medicine"),
                          TextFormField(
                            controller: med1a,
                            decoration: const InputDecoration(
                              labelText: "Enter your 1st medicine name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: dosaf1,
                            decoration: const InputDecoration(
                              labelText: "Enter your 1st medicine dosage",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          TextFormField(
                            controller: med2a,
                            decoration: const InputDecoration(
                              labelText: "Enter your 2nd medicine name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          TextFormField(
                            controller: dosaf2,
                            decoration: const InputDecoration(
                              labelText: "Enter your 2nd medicine dosage",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          Text(" Enter Evening  Medicine"),
                          TextFormField(
                            controller: med1even,
                            decoration: const InputDecoration(
                              labelText: "Enter your 1st medicine name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: dos1e,
                            decoration: const InputDecoration(
                              labelText: "Enter your 1st medicine dosage",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          TextFormField(
                            controller: med2even,
                            decoration: const InputDecoration(
                              labelText: "Enter your 2nd medicine name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          TextFormField(
                            controller: dos2e,
                            decoration: const InputDecoration(
                              labelText: "Enter your 2nd medicine dosage",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          Text(" Enter Pharmaacy details"),
                          TextFormField(
                            controller: pharmacy1,
                            decoration: const InputDecoration(
                              labelText: "Enter your 1st pharamacy name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: pharmacy2,
                            decoration: const InputDecoration(
                              labelText: "Enter your 2nd pharamcy name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ]),
                      ),
                      const SizedBox(width: 10),
                    ]),
                /*  Expanded(
                      child: TextFormField(
                        controller: time1,
                        decoration: const InputDecoration(
                          labelText: "Enter your 1st medicine time",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],*/

                const SizedBox(height: 30.0),
                const SizedBox(height: 30.0),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      // Ensure the current user is logged in
                      if (currentUser != null) {
                        final uid =
                            currentUser!.uid; // Get the current user's UID

                        final CollectionReference colRef =
                            FirebaseFirestore.instance.collection('Register');

                        // Store the data in Firestore under the user's UID
                        await colRef.doc(uid).set({
                          'uid': uid,
                          'name': namController.text,
                          'phone': phoneController.text,
                          'doctor1': doctor1.text,
                          'doctor2': doctor2.text,
                          'med1': medcontroller.text,
                          'dosm': dosm.text,
                          'med2': med2controller.text,
                          'dosm2': dosm2.text,
                          'med1a': med1a.text,
                          'dosaf1': dosaf1.text,
                          'med2a': med2a.text,
                          'dosaf2': dosaf2.text,
                          'med1even': med1even.text,
                          'dos1e': dos1e.text,
                          'med2even': med2even.text,
                          'dosaf2': dos2e.text,
                          //'time1': time1.text,
                          //'time2': time2.text,
                          'pharmacy': pharmacy1.text,
                          'pharamacy2': pharmacy2.text,
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Data submitted successfully')),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNav()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('User not authenticated')),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e')),
                      );
                    }
                  },
                  child: const Text('Register'),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
