import 'package:flutter/material.dart';
import 'dart:async';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String _currentTime = '';
  // Static list of anomalies as placeholders
  final List<Map<String, dynamic>> anomalies = [
    {'message': 'Phone Usage Detected', 'timestamp': '2025-03-17 10:30:00'},
    {'message': 'Fight Detected', 'timestamp': '2025-03-17 09:15:00'},
    {'message': 'Phone Usage Detected', 'timestamp': '2025-03-17 08:45:00'},
  ];

  @override
  void initState() {
    super.initState();
    _updateTime(); // Initial update
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        _updateTime();
      }
    });
  }

  void _updateTime() {
    final now = DateTime.now();
    setState(() {
      _currentTime = "${now.toLocal()}".split('.')[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Text(
            'Recent Anomalies',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Live Date & Time: $_currentTime',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
          
          Expanded(
            child: ListView.builder(
              itemCount: anomalies.length,
              itemBuilder: (context, index) {
                final anomaly = anomalies[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          anomaly['message'] ?? 'Unknown anomaly',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          anomaly['timestamp'] ?? 'No timestamp',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
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