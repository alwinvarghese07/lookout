import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDetectionOn = true;
  int activeCameras = 24;
  int todaysAlerts = 5; // Static data
  int phoneUsage = 3;   // Static data
  int fights = 2;       // Static data

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/logo.png', height: 40),
                const SizedBox(width: 40),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Detection Status',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Transform.scale(
                    scaleX: 1.1,
                    scaleY: 1.0,
                    child: Switch(
                      value: isDetectionOn,
                      onChanged: (value) {
                        setState(() {
                          isDetectionOn = value;
                        });
                      },
                      activeColor: Colors.green,
                      activeTrackColor: Colors.white,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildCard('Active Cameras', activeCameras.toString(),
                    'All cameras operational', Colors.blue),
                _buildCard("Today's Alerts", todaysAlerts.toString(),
                    '$phoneUsage phone, $fights fights', Colors.red),
                _buildCard('Phone Usage', phoneUsage.toString(),
                    'Last 24 hours', Colors.purple),
                _buildCard('Fights', fights.toString(), 'Last 24 hours',
                    Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String value, String subtitle, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}