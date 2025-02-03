import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:ui_face/ui/home_screen.dart';

class AbsentScreen extends StatefulWidget {
  const AbsentScreen({super.key});

  @override
  State<AbsentScreen> createState() => _AbsentScreenState();
}

class _AbsentScreenState extends State<AbsentScreen> {
  final CollectionReference dataCollection =
      FirebaseFirestore.instance.collection('attendance_app');
  final controllerName = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  String dropValueCategories = "Please Choose:";
  var categoriesList = <String>[
    "Please Choose:",
    "Sick",
    "Permission",
    "Others"
  ];
  double dLat = 0, dLong = 0;
  String strAddress = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Permission Request",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.indigo[400]!, Colors.indigo[600]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
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
                          color: Colors.amber[100],
                        ),
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
                        controller: controllerName,
                        label: "Full Name",
                        hint: "Enter your full name",
                        icon: Icons.person_outline_rounded,
                      ),
                      const SizedBox(height: 25),
                      _buildCategoryDropdown(),
                      const SizedBox(height: 25),
                      _buildDatePickers(),
                      const SizedBox(height: 30),
                      _buildSubmitButton(size),
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
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.indigo[800],
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.indigo[400]),
            filled: true,
            fillColor: Colors.grey[100],
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
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

  Widget _buildCategoryDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Permission Type",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.indigo[800],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.indigo[100]!, width: 1.5),
          ),
          child: DropdownButton<String>(
            value: dropValueCategories,
            items: categoriesList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    color: value == "Please Choose:"
                        ? Colors.grey[500]
                        : Colors.grey[800],
                    fontSize: 14,
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                dropValueCategories = value!;
              });
            },
            isExpanded: true,
            underline: const SizedBox(),
            icon: Icon(Icons.arrow_drop_down_circle_rounded,
                color: Colors.indigo[400]),
            dropdownColor: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }

  Widget _buildDatePickers() {
    return Row(
      children: [
        Expanded(child: _buildDateField("From", fromController)),
        const SizedBox(width: 15),
        Expanded(child: _buildDateField("Until", toController)),
      ],
    );
  }

  Widget _buildDateField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.indigo[800],
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => _selectDate(controller),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.indigo[100]!, width: 1.5),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today_rounded,
                    color: Colors.indigo[400], size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: controller,
                    enabled: false,
                    style: TextStyle(color: Colors.grey[800], fontSize: 14),
                    decoration: InputDecoration(
                      hintText: "Select Date",
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      border: InputBorder.none,
                      isCollapsed: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(Size size) {
    return Container(
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
            // ignore: deprecated_member_use
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
          onTap: _validateForm,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.send_rounded, color: Colors.amber[100]),
              const SizedBox(width: 12),
              Text(
                "SUBMIT REQUEST",
                style: TextStyle(
                  color: Colors.amber[100],
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Colors.indigo[400]!,
            onPrimary: Colors.white,
            onSurface: Colors.grey[800]!,
          ),
        ),
        child: child!,
      ),
    );

    if (pickedDate != null) {
      controller.text =
          DateFormat('dd MMM yyyy').format(pickedDate); // Format: "05 Oct 2023"
    }
  }

  void _validateForm() {
    if (controllerName.text.isEmpty ||
        dropValueCategories == "Please Choose:" ||
        fromController.text.isEmpty ||
        toController.text.isEmpty) {
      _showSnackBar(
        icon: Icons.error_outline_rounded,
        message: "Please fill all required fields",
        color: Colors.red[400]!,
      );
    } else {
      submitAbsen(
        controllerName.text,
        dropValueCategories,
        fromController.text,
        toController.text,
      );
    }
  }

  Future<void> getGeoLocationPosition() async {
    // ignore: deprecated_member_use
    Position position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.low);
    setState(() {
      isLoading = false;
      getAddressFromLongLat(position);
    });
  }

  Future<void> getAddressFromLongLat(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    setState(() {
      dLat = position.latitude;
      dLong = position.longitude;
      strAddress =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    });
  }

  Future<void> submitAbsen(
      String name, String reason, String from, String until) async {
    showLoaderDialog(context);

    try {
      Position position = await Geolocator.getCurrentPosition(
          // ignore: deprecated_member_use
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];
      String fullAddress =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

      String formattedDateTime =
          "$from - $until"; // Contoh: "05 Oct 2023 - 10 Oct 2023"

      // Simpan data setelah alamat diperoleh
      await dataCollection.add({
        'address': fullAddress, // Pastikan address sudah terisi
        'name': name,
        'status': reason,
        'dateTime':
            formattedDateTime, // Format tanggal dan waktu yang sudah diperbaiki
      });

      Navigator.pop(context);
      _showSnackBar(
        icon: Icons.check_circle_rounded,
        message: "Request submitted successfully!",
        color: Colors.green[400]!,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } catch (e) {
      Navigator.pop(context);
      _showSnackBar(
        icon: Icons.error_outline_rounded,
        message: "Failed to submit request. Please try again.",
        color: Colors.red[400]!,
      );
    }
  }

  void _showSnackBar(
      {required IconData icon, required String message, required Color color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
        elevation: 4,
      ),
    );
  }

  void showLoaderDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo[400]!),
            ),
            const SizedBox(width: 20),
            Text(
              "Processing Request...",
              style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
