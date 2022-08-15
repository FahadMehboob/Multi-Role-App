import 'package:flutter/material.dart';
import 'package:multi_role_app/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userscreen extends StatefulWidget {
  const Userscreen({Key? key}) : super(key: key);

  @override
  State<Userscreen> createState() => _UserscreenState();
}

class _UserscreenState extends State<Userscreen> {
  String email = '', age = '', userType = '';
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    age = sp.getString('age') ?? '';
    userType = sp.getString('userType') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'User Screen',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Email : '),
                  Text(email.toString()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Age : '),
                  Text(
                    age.toString(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('User Type : '),
                  Text(userType.toString()),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Loginscreen(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 40,
                  width: double.maxFinite,
                  child: const Center(
                    child: Text(
                      "LogOut",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
