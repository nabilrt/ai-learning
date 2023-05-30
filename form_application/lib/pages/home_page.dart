import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_application/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:form_application/counter_page.dart';
import 'package:form_application/settings.dart';
import '../navigation_provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text("Home Page");
  }

  Widget _userUID() {
    return Text(user?.email ?? 'User Email');
  }

  int pageNumber = 0;
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final currentPage = navigationProvider.currentPage;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Application"),
      ),
      body: getBody(),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.lock_clock_rounded), label: "Counter"),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
        ],
        onDestinationSelected: (int index) {
          navigationProvider.currentPage = index;
          pageNumber = navigationProvider.currentPage;
        },
        selectedIndex: pageNumber,
      ),
    );
  }

  Widget getBody() {
    switch (pageNumber) {
      case 0:
        return const Counter();
      case 1:
        return const Settings();
      default:
        return const Counter();
    }
  }
}
