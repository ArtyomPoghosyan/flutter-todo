// import 'package:flutter/material.dart';
// import 'package:tododifficult/store/firebase.dart';

// import '../screen/auth/firebase_auth_implementation/firebase_auth_services.dart';
// import 'image_bottom_sheet.dart';
// import 'show_dialog.dart';

// class DrawerWidget extends StatefulWidget {
//   const DrawerWidget({super.key});

//   @override
//   State<DrawerWidget> createState() => _DrawerWidget();
// }

// class _DrawerWidget extends State<DrawerWidget> {
//   final FirebaseAuthService auth = FirebaseAuthService();

//   String _formatUserName(String? email) {
//     if (email == null || email.isEmpty) {
//       return '';
//     }
//     int index0fAt = email.indexOf('@');
//     if (index0fAt == -1) {
//       return '';
//     }
//     String fullName = email.substring(0, index0fAt);
//     if (fullName.isEmpty) {
//       return '';
//     }
//     String splitedName = fullName.substring(1, fullName.length - 1);
//     return fullName.substring(0, 1).toUpperCase() + splitedName;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 375,
//       child: Drawer(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(24, 13, 24, 56),
//             child: Column(
//               children: [
//                 const Text(
//                   "Profile",
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Color.fromRGBO(255, 255, 255, 0.87),
//                       fontWeight: FontWeight.w400),
//                 ),
//                 SizedBox(height: 24),
//                 Builder(builder: (context) {
//                   return ClipOval(
//                     child: firebaseStore.user?.photoURL != null
//                         ? Image.network(
//                             firebaseStore.user!.photoURL!,
//                             width: 42,
//                             height: 42,
//                           )
//                         : Icon(Icons.person),
//                   );
//                 }),
//                 SizedBox(height: 10),
//                 Text(
//                   _formatUserName(firebaseStore.user?.email),
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                       color: Color.fromRGBO(255, 255, 255, 0.87)),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         width: 154,
//                         height: 58,
//                         child: ElevatedButton(
//                           style: ButtonStyle(
//                               backgroundColor: MaterialStateProperty.all<Color>(
//                                 Color.fromRGBO(54, 54, 54, 1),
//                               ),
//                               shape: MaterialStateProperty.all<
//                                       RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(4)))),
//                           onPressed: () {},
//                           child: Text("10 Tasks Left"),
//                         ),
//                       ),
//                       Container(
//                         width: 154,
//                         height: 58,
//                         child: ElevatedButton(
//                           style: ButtonStyle(
//                               backgroundColor: MaterialStateProperty.all<Color>(
//                                 Color.fromRGBO(54, 54, 54, 1),
//                               ),
//                               shape: MaterialStateProperty.all<
//                                       RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(4)))),
//                           onPressed: () {},
//                           child: Text("10 Tasks Left"),
//                         ),
//                       ),
//                     ]),
//                 SizedBox(
//                   height: 32,
//                 ),
//                 Container(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Settings",
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                             color: Color.fromRGBO(175, 175, 175, 1)),
//                       ),
//                       SizedBox(height: 16),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             width: 125,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Icon(
//                                   Icons.settings,
//                                   color: Color.fromRGBO(255, 255, 255, 0.87),
//                                 ),
//                                 Text(
//                                   "App Settings",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color.fromRGBO(255, 255, 255, 0.87),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: 24,
//                             height: 24,
//                             child: InkWell(
//                               onTap: () {
//                                 Navigator.pushNamed(context, "/settings");
//                               },
//                               child: Icon(
//                                 Icons.arrow_forward_ios_rounded,
//                                 color: Color.fromRGBO(255, 255, 255, 0.87),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 28,
//                       ),
//                       Text(
//                         "Account",
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                             color: Color.fromRGBO(175, 175, 175, 1)),
//                       ),
//                       SizedBox(
//                         height: 16,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             width: 194,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Icon(
//                                   Icons.person,
//                                   color: Color.fromRGBO(255, 255, 255, 0.87),
//                                 ),
//                                 Text(
//                                   "Change account name",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color.fromRGBO(255, 255, 255, 0.87),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: 24,
//                             height: 24,
//                             child: InkWell(
//                               onTap: () {
//                                 print("Name");
//                                 ShowDialog(
//                                   context,
//                                   "Change account name",
//                                 );
//                               },
//                               child: Icon(
//                                 Icons.arrow_forward_ios_rounded,
//                                 color: Color.fromRGBO(255, 255, 255, 0.87),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 32,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             width: 225,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Icon(
//                                   Icons.vpn_key,
//                                   color: Color.fromRGBO(255, 255, 255, 0.87),
//                                 ),
//                                 Text(
//                                   "Change account password",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color.fromRGBO(255, 255, 255, 0.87),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: 24,
//                             height: 24,
//                             child: InkWell(
//                               onTap: () {
//                                 print("password");
//                                 ShowDialog(
//                                   context,
//                                   "Change account Password",
//                                 );
//                               },
//                               child: Icon(
//                                 Icons.arrow_forward_ios_rounded,
//                                 color: Color.fromRGBO(255, 255, 255, 0.87),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 32,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             width: 199,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Icon(
//                                   Icons.photo_camera_outlined,
//                                   color: Color.fromRGBO(255, 255, 255, 0.87),
//                                 ),
//                                 Text(
//                                   "Change account image",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color.fromRGBO(255, 255, 255, 0.87),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: 24,
//                             height: 24,
//                             child: InkWell(
//                               onTap: () {
//                                 print("image");
//                                 DisplayBottomSheet(context);
//                               },
//                               child: Icon(
//                                 Icons.arrow_forward_ios_rounded,
//                                 color: Color.fromRGBO(255, 255, 255, 0.87),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 28,
//                       ),
//                       Text(
//                         "Uptodo",
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                             color: Color.fromRGBO(175, 175, 175, 1)),
//                       ),
//                       SizedBox(
//                         height: 16,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             width: 100,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Image.asset(
//                                   "images/menu.png",
//                                   color: Color.fromRGBO(255, 255, 255, 0.87),
//                                 ),
//                                 Text(
//                                   "About US",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color.fromRGBO(255, 255, 255, 0.87),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: 24,
//                             height: 24,
//                             child: Icon(
//                               Icons.arrow_forward_ios_rounded,
//                               color: Color.fromRGBO(255, 255, 255, 0.87),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 32,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             width: 60,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Icon(
//                                   Icons.info_outline,
//                                   color: Color.fromRGBO(255, 255, 255, 0.87),
//                                 ),
//                                 Text(
//                                   "FAQ",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color.fromRGBO(255, 255, 255, 0.87),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: 24,
//                             height: 24,
//                             child: Icon(
//                               Icons.arrow_forward_ios_rounded,
//                               color: Color.fromRGBO(255, 255, 255, 0.87),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 32,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             width: 154,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Icon(
//                                   Icons.bolt,
//                                   color: Color.fromRGBO(255, 255, 255, 0.87),
//                                 ),
//                                 Text(
//                                   "Help & Feedback",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color.fromRGBO(255, 255, 255, 0.87),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: 24,
//                             height: 24,
//                             child: Icon(
//                               Icons.arrow_forward_ios_rounded,
//                               color: Color.fromRGBO(255, 255, 255, 0.87),
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 32,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             width: 114,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Icon(
//                                   Icons.thumb_up_off_alt,
//                                   color: Color.fromRGBO(255, 255, 255, 0.87),
//                                 ),
//                                 Text(
//                                   "Support US",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w400,
//                                     color: Color.fromRGBO(255, 255, 255, 0.87),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             width: 24,
//                             height: 24,
//                             child: const Icon(
//                               Icons.arrow_forward_ios_rounded,
//                               color: Color.fromRGBO(255, 255, 255, 0.87),
//                             ),
//                           )
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 32,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             width: 86,
//                             child: InkWell(
//                               onTap: () {
//                                 firebaseStore.authFirebase.signOut();
//                               },
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                       child: Transform.rotate(
//                                     angle: -180 * (3.141592653589793 / 180),
//                                     child: const Icon(
//                                       Icons.logout,
//                                       color: Colors.red,
//                                     ),
//                                   )),
//                                   const Text(
//                                     "Log out",
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                       color: Colors.red,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),

//                 // ElevatedButton(
//                 //     onPressed: () {
//                 //       firebaseStore.authFirebase.signOut();
//                 //     },
//                 //     child: Text("Sigh Out"))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
