import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController =
      TextEditingController(text: "John Doe");
  final TextEditingController phoneController =
      TextEditingController(text: "1234567890");
  final TextEditingController doctorsController = TextEditingController(
      text:
          "Dr. Smith (consulted on 12/10/2024), Dr. Brown (consulted on 10/12/2024)");
  final TextEditingController medicinesController =
      TextEditingController(text: "Aspirin, Paracetamol");
  final TextEditingController pharmacyController =
      TextEditingController(text: "CVS Pharmacy, Walgreens, Rite Aid");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Color(0xFFE3F2FD), // Light blue background color
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(
                controller: nameController,
                label: "Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: phoneController,
                label: "Phone Number",
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your phone number";
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: doctorsController,
                label: "Doctors Consulting",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please list the doctors you're consulting";
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: medicinesController,
                label: "Medicines",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please list the medicines you're taking";
                  }
                  return null;
                },
              ),
              _buildTextField(
                controller: pharmacyController,
                label: "Nearest Pharmacies",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please list the nearest pharmacies";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Profile updated successfully')),
                    );
                  }
                },
                child: Text("Save Profile"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  textStyle: TextStyle(fontSize: 18),
                  backgroundColor: Colors.blueAccent, // Corrected button color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.blueAccent),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 2),
          ),
        ),
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter User Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileForm(),
    );
  }
}
