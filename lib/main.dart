import 'package:flutter/material.dart';
import 'package:ui_face/ui/home_screen.dart';
// import 'package:dotted_border/dotted_border.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// class AbsentScreen extends StatelessWidget {
//   const AbsentScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         elevation: 4,
//         backgroundColor: Colors.indigo,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           "Permission Request",
//           style: TextStyle(
//               fontSize: 20, 
//               fontWeight: FontWeight.w600,
//               color: Colors.white),
//         ),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(15),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Card(
//             elevation: 8,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             shadowColor: Colors.indigo.withOpacity(0.2),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
//                   decoration: BoxDecoration(
//                     color: Colors.indigo,
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.indigo.withOpacity(0.1),
//                         blurRadius: 10,
//                       )
//                     ],
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(Icons.assignment_outlined, 
//                           color: Colors.amber[100], size: 28),
//                       const SizedBox(width: 15),
//                       Text(
//                         "Request Form",
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.amber[100]),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildInputField(
//                         label: "Full Name",
//                         hint: "Enter your full name",
//                         icon: Icons.person_outline_rounded,
//                       ),
//                       const SizedBox(height: 25),
//                       const Text(
//                         "Permission Type",
//                         style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.indigo),
//                       ),
//                       const SizedBox(height: 10),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 12),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           border: Border.all(color: Colors.indigo.withOpacity(0.4)),
//                         ),
//                         child: DropdownButton(
//                           value: "Sick",
//                           items: const [
//                             DropdownMenuItem(
//                               value: "Sick",
//                               child: Text("Sick Leave", 
//                                   style: TextStyle(fontSize: 15)),
//                             ),
//                           ],
//                           onChanged: null,
//                           icon: Icon(Icons.arrow_drop_down_circle_rounded,
//                               color: Colors.indigo[400]),
//                           isExpanded: true,
//                           underline: const SizedBox(),
//                           dropdownColor: Colors.grey[100],
//                           borderRadius: BorderRadius.circular(12),
//                           style: TextStyle(
//                               color: Colors.grey[800],
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                       const SizedBox(height: 25),
//                       _buildDateInputs(),
//                       const SizedBox(height: 30),
//                       Container(
//                         height: 55,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [Colors.indigo[400]!, Colors.indigo[600]!],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                           borderRadius: BorderRadius.circular(15),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.indigo.withOpacity(0.3),
//                               blurRadius: 12,
//                               offset: const Offset(0, 4),
//                             )
//                           ],
//                         ),
//                         child: Material(
//                           color: Colors.transparent,
//                           child: InkWell(
//                             borderRadius: BorderRadius.circular(15),
//                             onTap: () {},
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(Icons.send_to_mobile_rounded, 
//                                     color: Colors.amber[100]),
//                                 const SizedBox(width: 12),
//                                 Text(
//                                   "SUBMIT REQUEST",
//                                   style: TextStyle(
//                                       color: Colors.amber[100],
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w700,
//                                       letterSpacing: 0.8),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInputField({
//     required String label,
//     required String hint,
//     required IconData icon,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               color: Colors.indigo),
//         ),
//         const SizedBox(height: 8),
//         TextField(
//           decoration: InputDecoration(
//             prefixIcon: Icon(icon, color: Colors.indigo[400]),
//             contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
//             hintText: hint,
//             hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
//             filled: true,
//             fillColor: Colors.grey[100],
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide.none,
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Colors.indigo[300]!, width: 1.5),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDateInputs() {
//     return Row(
//       children: [
//         Expanded(
//           child: _buildDateField(label: "Start Date", hint: "DD/MM/YYYY"),
//         ),
//         const SizedBox(width: 20),
//         Expanded(
//           child: _buildDateField(label: "End Date", hint: "DD/MM/YYYY"),
//         ),
//       ],
//     );
//   }

//   Widget _buildDateField({required String label, required String hint}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               color: Colors.grey[700]),
//         ),
//         const SizedBox(height: 6),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           decoration: BoxDecoration(
//             color: Colors.grey[100],
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: Colors.grey[300]!),
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: hint,
//                     hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               Icon(Icons.calendar_today_rounded, 
//                   color: Colors.indigo[400], size: 20),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class AbsentScreen extends StatelessWidget {
//   const AbsentScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.blueAccent,
//         leading: const IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: null,
//         ),
//         title: const Text(
//           "Request Permission Menu",
//           style: TextStyle(
//               fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Card(
//           color: Colors.white,
//           margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           elevation: 5,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 50,
//                 decoration: const BoxDecoration(
//                   color: Colors.blueAccent,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10),
//                   ),
//                 ),
//                 child: const Row(
//                   children: [
//                     SizedBox(width: 12),
//                     Icon(Icons.maps_home_work_outlined, color: Colors.white),
//                     SizedBox(width: 12),
//                     Text(
//                       "Please Fill out the form",
//                       style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(horizontal: 10),
//                     labelText: "Your Name",
//                     labelStyle: TextStyle(color: Colors.black, fontSize: 14),
//                     hintText: "John Doe",
//                     hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(color: Colors.blueAccent),
//                     ),
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(10),
//                 child: Text(
//                   "Description",
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.blueAccent, width: 1.0),
//                   ),
//                   child: DropdownButton(
//                     value: "Sick",
//                     items: [
//                       DropdownMenuItem(
//                         value: "Sick",
//                         child: Text("Sick", style: TextStyle(fontSize: 14)),
//                       ),
//                     ],
//                     onChanged: null,
//                     icon: Icon(Icons.arrow_drop_down),
//                     isExpanded: true,
//                     underline: SizedBox(),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Row(
//                         children: [
//                           const Text(
//                             "From: ",
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black),
//                           ),
//                           const Expanded(
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 hintText: "01/08/2023",
//                                 contentPadding: EdgeInsets.all(8),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Row(
//                         children: [
//                           const Text(
//                             "Until: ",
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black),
//                           ),
//                           const Expanded(
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 hintText: "05/08/2023",
//                                 contentPadding: EdgeInsets.all(8),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 margin: const EdgeInsets.all(30),
//                 child: Material(
//                   elevation: 3,
//                   borderRadius: BorderRadius.circular(20),
//                   child: Container(
//                     height: 50,
//                     width: size.width,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.blueAccent,
//                     ),
//                     child: const Center(
//                       child: Text(
//                         "Submit",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AttendanceHistoryScreen extends StatelessWidget {
//   const AttendanceHistoryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.blueAccent,
//         elevation: 0,
//         leading: const IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: null,
//         ),
//         title: const Text("Attendance History",
//             style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white)),
//       ),
//       body: ListView(
//         children: [
//           Card(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10)),
//             elevation: 5,
//             margin: const EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: CircleAvatar(
//                     backgroundColor: Colors.blue,
//                     radius: 25,
//                     child: Text(
//                       "J",
//                       style: TextStyle(color: Colors.white, fontSize: 14),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             const Text('Name     : ',
//                                 style: TextStyle(fontSize: 14)),
//                             Text('John Doe',
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey[700])),
//                           ],
//                         ),
//                         const SizedBox(height: 4),
//                         Row(
//                           children: [
//                             const Text('Address  : ',
//                                 style: TextStyle(fontSize: 14)),
//                             Text('New York',
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey[700])),
//                           ],
//                         ),
//                         const SizedBox(height: 4),
//                         Row(
//                           children: [
//                             const Text('Status    : ',
//                                 style: TextStyle(fontSize: 14)),
//                             Text('Present',
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey[700])),
//                           ],
//                         ),
//                         const SizedBox(height: 4),
//                         Row(
//                           children: [
//                             const Text('Date       : ',
//                                 style: TextStyle(fontSize: 14)),
//                             Text('2023-08-01',
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.grey[700])),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Duplicate Card untuk contoh data lainnya
//           Card(
//             /* ... (isi sama seperti card pertama) ... */
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AttendScreen extends StatelessWidget {
//   const AttendScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
    
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.blueAccent,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: () {},
//         ),
//         title: const Text(
//           "Attendance Menu",
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Card(
//           color: Colors.white,
//           margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           elevation: 5,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 50,
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10),
//                   ),
//                   color: Colors.blueAccent,
//                 ),
//                 child: const Row(
//                   children: [
//                     SizedBox(width: 12),
//                     Icon(Icons.face_retouching_natural_outlined, color: Colors.white),
//                     SizedBox(width: 12),
//                     Text(
//                       "Please make a selfie photo!",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
//                 child: Text(
//                   "Capture Photo",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
//                 width: size.width,
//                 height: 150,
//                 child: DottedBorder(
//                   radius: const Radius.circular(10),
//                   borderType: BorderType.RRect,
//                   color: Colors.blueAccent,
//                   strokeWidth: 1,
//                   dashPattern: const [5, 5],
//                   child: const SizedBox.expand(
//                     child: FittedBox(
//                       child: Icon(
//                         Icons.camera_enhance_outlined,
//                         color: Colors.blueAccent,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(horizontal: 10),
//                     labelText: "Your Name",
//                     hintText: "Please enter your name",
//                     hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
//                     labelStyle: TextStyle(fontSize: 14, color: Colors.black),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(color: Colors.blueAccent),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(color: Colors.blueAccent),
//                     ),
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                 child: Text(
//                   "Your Location",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: SizedBox(
//                   height: 120,
//                   child: TextField(
//                     enabled: false,
//                     maxLines: 5,
//                     decoration: InputDecoration(
//                       alignLabelWithHint: true,
//                       disabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: const BorderSide(color: Colors.blueAccent),
//                       ),
//                       hintText: 'Loading location...',
//                       hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
//                       fillColor: Colors.transparent,
//                       filled: true,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 margin: const EdgeInsets.all(30),
//                 child: Material(
//                   elevation: 3,
//                   borderRadius: BorderRadius.circular(20),
//                   child: Container(
//                     width: size.width,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.white,
//                     ),
//                     child: Material(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.blueAccent,
//                       child: const Center(
//                         child: Text(
//                           "Report Now",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               InkWell(
//                 onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const Placeholder()),
//                 ),
//                 child: Container(
//                   margin: const EdgeInsets.all(10),
//                   child: const Column(
//                     children: [
//                       Image(
//                         image: AssetImage('assets/images/ic_absen.png'),
//                         width: 100,
//                         height: 100,
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         'Absen Kehadiran',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const Placeholder()),
//                 ),
//                 child: Container(
//                   margin: const EdgeInsets.all(10),
//                   child: const Column(
//                     children: [
//                       Image(
//                         image: AssetImage('assets/images/ic_leave.png'),
//                         width: 100,
//                         height: 100,
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         'Cuti / Izin',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const Placeholder(),
//                   ),
//                 ),
//                 child: Container(
//                   margin: const EdgeInsets.all(10),
//                   child: const Column(
//                     children: [
//                       Image(
//                         image: AssetImage('assets/images/ic_history.png'),
//                         width: 100,
//                         height: 100,
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         'Attendance History',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }