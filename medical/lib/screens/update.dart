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
  final time1 = TextEditingController();
  final time2 = TextEditingController();

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
      backgroundColor: const Color.fromRGBO(240, 248, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(240, 248, 255, 1),
        title: const Text(
          "Medical App",
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
                      child: TextFormField(
                        controller: med2controller,
                        decoration: const InputDecoration(
                          labelText: "Enter your 1st medicine name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: time1,
                        decoration: const InputDecoration(
                          labelText: "Enter your 1st medicine time",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: medcontroller,
                        decoration: const InputDecoration(
                          labelText: "Enter your 2nd medicine name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: time2,
                        decoration: const InputDecoration(
                          labelText: "Enter your 2nd medicine time",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
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
                          'med2': med2controller.text,
                          'time1': time1.text,
                          'time2': time2.text,
                          'pharmacy': pharmacy1.text,
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
