import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceHistoryScreen extends StatefulWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  State<AttendanceHistoryScreen> createState() =>
      _AttendanceHistoryScreenState();
}

class _AttendanceHistoryScreenState extends State<AttendanceHistoryScreen> {
  final CollectionReference dataCollection =
      FirebaseFirestore.instance.collection('attendance_app');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Attendance History",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: dataCollection.get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoadingIndicator();
          }

          if (snapshot.hasError) {
            return _buildErrorState();
          }

          final data = snapshot.data!.docs;

          return data.isEmpty ? _buildEmptyState() : _buildHistoryList(data);
        },
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo[400]!),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history_toggle_off_rounded,
              size: 60, color: Colors.indigo[400]),
          const SizedBox(height: 20),
          Text(
            "No Attendance Records Found",
            style: TextStyle(
              fontSize: 18,
              color: Colors.indigo[800],
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Your attendance history will appear here",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline_rounded, size: 60, color: Colors.red[400]),
          const SizedBox(height: 20),
          Text(
            "Failed to Load Data",
            style: TextStyle(
              fontSize: 18,
              color: Colors.indigo[800],
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Please check your internet connection",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryList(List<QueryDocumentSnapshot> data) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: data.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) => _buildHistoryCard(data[index]),
    );
  }

  Widget _buildHistoryCard(QueryDocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;
    final dateTime = _formatDateTime(data['dateTime']);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _buildAvatar(data['name']),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(
                      Icons.person_outline_rounded, "Name", data['name']),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                      Icons.location_on_outlined, "Address", data['address']),
                  const SizedBox(height: 8),
                  _buildStatusRow(data['status']),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                      Icons.calendar_month_rounded, "Date & Time", dateTime),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(String name) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo[400]!, Colors.indigo[600]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          name.isNotEmpty ? name[0].toUpperCase() : '?',
          style: TextStyle(
            color: Colors.amber[100],
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Colors.indigo[400]),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
                height: 1.4,
              ),
              children: [
                TextSpan(
                  text: "$label: ",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.indigo[800],
                  ),
                ),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusRow(String status) {
    Color statusColor = Colors.grey;
    if (status == "Present") statusColor = Colors.green[400]!;
    if (status == "Late") statusColor = Colors.orange[400]!;
    if (status == "Absent") statusColor = Colors.red[400]!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: statusColor.withValues()),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle_rounded, color: statusColor, size: 12),
          const SizedBox(width: 20),
          Text(
            status,
            style: TextStyle(
              color: statusColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(dynamic dateTime) {
    try {
      // Jika dateTime adalah String dan mengandung pemisah '-'
      if (dateTime is String && dateTime.contains('-')) {
        final parts = dateTime.split('-');
        if (parts.length == 2) {
          final fromDate = parts[0].trim();
          final toDate = parts[1].trim();
          return "$fromDate to $toDate"; // Contoh: "05 Oct 2023 to 10 Oct 2023"
        }
      } else if (dateTime is String && dateTime.contains('|')) {
        final parts = dateTime.split('|');
        if (parts.length == 2) {
          final datePart = parts[0].trim(); // Bagian tanggal: "dd MM yyyy"
          final timePart = parts[1].trim(); // Bagian waktu: "HH:mm:ss"

          // Parsing tanggal dan waktu
          final parsedDate =
              DateFormat('dd MM yyyy HH:mm:ss').parse('$datePart $timePart');

          // Format ulang ke "dd MMM yyyy • HH:mm"
          return DateFormat('dd MMM yyyy • HH:mm').format(parsedDate);
        }
      }

      // Handle format lainnya (Timestamp, DateTime, dll)
      DateTime parsedDate;
      if (dateTime is Timestamp) {
        parsedDate = dateTime.toDate();
      } else if (dateTime is DateTime) {
        parsedDate = dateTime;
      } else {
        throw FormatException('Unsupported date-time type');
      }

      // Format default jika tidak ada pemisah '-'
      return DateFormat('dd MMM yyyy • HH:mm').format(parsedDate);
    } catch (e) {
      return 'Invalid Date';
    }
  }
}
