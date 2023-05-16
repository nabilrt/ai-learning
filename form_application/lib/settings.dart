import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String name = "";
  int age = 0;
  String cgpa = "";
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          width: 500,
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Name',
            ),
            onChanged: (text) {
              // Handle the text input changes here
              setState(() {
                name = text;
              });
            },
          ),
        ),
        SizedBox(
          height: 50,
          width: 500,
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Age',
            ),
            onChanged: (text) {
              // Handle the text input changes here
              setState(() {
                age = int.parse(text);
              });
            },
          ),
        ),
        SizedBox(
          height: 50,
          width: 500,
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'CGPA',
            ),
            onChanged: (text) {
              // Handle the text input changes here
              setState(() {
                cgpa = text;
              });
            },
          ),
        ),
        const SizedBox(height: 100),
        ElevatedButton(
            onPressed: () {
              setState(() {
                isClicked = true;
              });
            },
            child: const Text("Show")),
        getOutputs(),
        const SizedBox(height: 100),
        const Icon(Icons.person),
        const Text("Developed by Nabil"),
      ],
    ));
  }

  Widget getOutputs() {
    if (isClicked) {
      return Column(
        children: [
          Text("Name: $name"),
          Text("Age: $age"),
          Text("CGPA: $cgpa"),
        ],
      );
    } else {
      return const Text("");
    }
  }
}
