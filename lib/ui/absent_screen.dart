import 'package:flutter/material.dart';

class AbsentScreen extends StatelessWidget {
  const AbsentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Permission Request",
          style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadowColor: Colors.indigo.withOpacity(0.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.indigo.withOpacity(0.1),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.assignment_outlined, 
                          color: Colors.amber[100], size: 28),
                      const SizedBox(width: 15),
                      Text(
                        "Request Form",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.amber[100]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputField(
                        label: "Full Name",
                        hint: "Enter your full name",
                        icon: Icons.person_outline_rounded,
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        "Permission Type",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigo),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.indigo.withOpacity(0.4)),
                        ),
                        child: DropdownButton(
                          value: "Sick",
                          items: const [
                            DropdownMenuItem(
                              value: "Sick",
                              child: Text("Sick Leave", 
                                  style: TextStyle(fontSize: 15)),
                            ),
                          ],
                          onChanged: null,
                          icon: Icon(Icons.arrow_drop_down_circle_rounded,
                              color: Colors.indigo[400]),
                          isExpanded: true,
                          underline: const SizedBox(),
                          dropdownColor: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 25),
                      _buildDateInputs(),
                      const SizedBox(height: 30),
                      Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.indigo[400]!, Colors.indigo[600]!],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.indigo.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.send_to_mobile_rounded, 
                                    color: Colors.amber[100]),
                                const SizedBox(width: 12),
                                Text(
                                  "SUBMIT REQUEST",
                                  style: TextStyle(
                                      color: Colors.amber[100],
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.8),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.indigo),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.indigo[400]),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.indigo[300]!, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateInputs() {
    return Row(
      children: [
        Expanded(
          child: _buildDateField(label: "Start Date", hint: "DD/MM/YYYY"),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: _buildDateField(label: "End Date", hint: "DD/MM/YYYY"),
        ),
      ],
    );
  }

  Widget _buildDateField({required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700]),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Icon(Icons.calendar_today_rounded, 
                  color: Colors.indigo[400], size: 20),
            ],
          ),
        ),
      ],
    );
  }
}