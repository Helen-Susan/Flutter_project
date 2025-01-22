import 'package:flutter/material.dart';

class PharmacyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nearby Pharmacy"),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xE1F1F8FF), // Light blue background color
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Nearby Pharmacies Section
            Text(
              "Nearby Pharmacies",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                PharmacyTile(pharmacy: "Apollo Pharmacy", distance: "0.5 km"),
                PharmacyTile(pharmacy: "MedPlus", distance: "1.0 km"),
                PharmacyTile(pharmacy: "NetMeds", distance: "1.5 km"),
              ],
            ),
            SizedBox(height: 20),

            // Stock Level Section
            Text(
              "Stock Level",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                StockLevelItem(medicine: "Paracetamol", level: 0.8),
                StockLevelItem(medicine: "Ibuprofen", level: 0.6),
                StockLevelItem(medicine: "Cough Syrup", level: 0.7),
              ],
            ),
            SizedBox(height: 20),

            // Medicines with Pharmacies Section
            Text(
              "Medicines with Pharmacies",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                PharmacyMedicineItem(
                  pharmacy: "Apollo Pharmacy",
                  medicines: ["Paracetamol", "Ibuprofen"],
                ),
                PharmacyMedicineItem(
                  pharmacy: "MedPlus",
                  medicines: ["Amoxicillin", "Cough Syrup"],
                ),
                PharmacyMedicineItem(
                  pharmacy: "NetMeds",
                  medicines: ["Ibuprofen", "Cough Syrup"],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget to display pharmacy with large size
class PharmacyTile extends StatelessWidget {
  final String pharmacy;
  final String distance;

  const PharmacyTile({
    required this.pharmacy,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          pharmacy,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Distance: $distance"),
        leading: Icon(Icons.local_pharmacy, size: 40),
        tileColor: Colors.white,
      ),
    );
  }
}

// Widget to display stock level as a bar graph
class StockLevelItem extends StatelessWidget {
  final String medicine;
  final double level;

  const StockLevelItem({
    required this.medicine,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            medicine,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          LinearProgressIndicator(
            value: level,
            backgroundColor: Colors.grey[300],
            color: Colors.blue,
            minHeight: 10,
          ),
          SizedBox(height: 5),
          Text("${(level * 100).toInt()}% stock available"),
        ],
      ),
    );
  }
}

// Widget to display medicines with their respective pharmacies
class PharmacyMedicineItem extends StatelessWidget {
  final String pharmacy;
  final List<String> medicines;

  const PharmacyMedicineItem({
    required this.pharmacy,
    required this.medicines,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pharmacy,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "Available Medicines: ${medicines.join(", ")}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement send request logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Request sent to $pharmacy"),
                  ),
                );
              },
              child: Text("Send Request"),
            ),
          ],
        ),
      ),
    );
  }
}
