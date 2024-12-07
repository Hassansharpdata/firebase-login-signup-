// import 'package:flutter/material.dart';
// import 'package:todo/widgets/header.dart';

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});

//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             const Positioned(
//               top: 170, // Adjust to position half-overlap
//               left: 20,
//               right: 20,
//               child: MyWidget(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class Dashboard extends StatelessWidget {
//   const Dashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: const [
//           // Header Widget
//           DashboardHeader(),

//           // Search Bar Widget
//           DashboardSearchBar(),

//           // Placeholder for additional content
//           Expanded(
//             child: Center(
//               child: Text(
//                 "Dashboard Content",
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DashboardHeader extends StatelessWidget {
//   const DashboardHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         color: Color(0xff3D50E7), // Blue background
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(30),
//           bottomRight: Radius.circular(30),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 40), // Space for status bar
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const CircleAvatar(
//                   backgroundImage: AssetImage("assets/images/pf.png"),
//                   radius: 30,
//                 ),
//                 Row(
//                   children: const [
//                     Icon(Icons.notifications, color: Colors.white),
//                     SizedBox(width: 20),
//                     Icon(Icons.shopping_cart, color: Colors.white),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               "Hi, Shahzeb",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const Text(
//               "Welcome to Quick Medical Store",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DashboardSearchBar extends StatelessWidget {
//   const DashboardSearchBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       child: Container(
//         height: 50,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(30),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 10,
//               offset: const Offset(0, 5),
//             ),
//           ],
//         ),
//         child: Row(
//           children: const [
//             SizedBox(width: 15),
//             Icon(Icons.search, color: Colors.grey),
//             SizedBox(width: 10),
//             Expanded(
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search Medicine & Healthcare products",
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Column for Header and Body
          Column(
            children: const [
              // Header Widget
              DashboardHeader(),

              // Placeholder for dashboard content
              Expanded(
                child: Center(
                  child: Text(
                    "Dashboard Content",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),

          // Search Bar positioned to overlap header and body
          const Positioned(
            top: 230, // Adjust to position half-overlap
            left: 20,
            right: 20,
            child: DashboardSearchBar(),
          ),
        ],
      ),
    );
  }
}

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xff3D50E7), // Blue background
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40), // Space for status bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/pf.png"),
                  radius: 30,
                ),
                Row(
                  children: const [
                    Icon(Icons.notifications, color: Colors.white),
                    SizedBox(width: 20),
                    Icon(Icons.shopping_cart, color: Colors.white),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Hi, Shahzeb",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              "Welcome to Quick Medical Store",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardSearchBar extends StatelessWidget {
  const DashboardSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: const [
          SizedBox(width: 15),
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Medicine & Healthcare products",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
