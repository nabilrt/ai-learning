import 'package:flutter/material.dart';

import 'package:form_application/all_wids.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'navigation_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBqM26-ERVSg-KfnCGnBwy9Fpco4KGJEK4",
      appId: "1:1015004591362:android:4d75b84ff6f3ac105d7e1b",
      messagingSenderId: "1015004591362",
      projectId: "form-application-d99c6",
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: const MyForm(),
    ),
  );
}

class MyForm extends StatelessWidget {
  const MyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const AllWidgets(),
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int currentPage = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Form Application"),
//       ),
//       body: getBody(),
//       bottomNavigationBar: NavigationBar(
//         destinations: const [
//           NavigationDestination(
//               icon: Icon(Icons.lock_clock_rounded), label: "Counter"),
//           NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
//           NavigationDestination(icon: Icon(Icons.login), label: "Login")
//         ],
//         onDestinationSelected: (int index) {
//           setState(() {
//             currentPage = index;
//           });
//         },
//         selectedIndex: currentPage,
//       ),
//     );
//   }

//   Widget getBody() {
//     switch (currentPage) {
//       case 0:
//         return const Counter();
//       case 1:
//         return const Settings();
//       default:
//         return const Counter();
//     }
//   }
// }
