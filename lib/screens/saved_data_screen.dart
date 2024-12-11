import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedDataScreen extends StatelessWidget {
  const SavedDataScreen({super.key});


  Future<String?> getFirstName() async{
    final pref = await SharedPreferences.getInstance();
    return pref.getString("firstName");
  }

  Future<String?> getLastName() async{
    final pref = await SharedPreferences.getInstance();
    return pref.getString("lastName");
  }

  Future<String?> getAge() async{
    final pref = await SharedPreferences.getInstance();
    return pref.getString("age");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(future: getFirstName(), builder: (context,snapShot) {
            return Text("First Name ${snapShot.data}");
          }),

          StreamBuilder(stream: getLastName().asStream(), builder: (context,snapShot) {
            return Text("Last Name ${snapShot.data}");
          }),

          FutureBuilder(future: getAge(), builder: (context,snapShot) {
            return Text("Age ${snapShot.data}");
          }),
        ],
      ),
    );
  }
}
