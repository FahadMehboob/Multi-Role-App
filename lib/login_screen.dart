import 'package:flutter/material.dart';
import 'package:multi_role_app/admin_screen.dart';
import 'package:multi_role_app/home_screen.dart';
import 'package:multi_role_app/user_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  final items = ['Admin', 'User'];
  var currentItemSelected = 'Admin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email), hintText: 'Email'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password), hintText: 'Password'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: ageController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.add), hintText: 'Age'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: DropdownButton<String>(
                isExpanded: true,
                items: items.map((String dropDownItems) {
                  return DropdownMenuItem<String>(
                    value: dropDownItems,
                    child: Text(dropDownItems),
                  );
                }).toList(),
                onChanged: (newValueSelected) {
                  setState(() {
                    currentItemSelected = newValueSelected.toString();
                  });
                },
                value: currentItemSelected,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', emailController.text.toString());
                  sp.setString('password', passwordController.text.toString());
                  sp.setString('age', ageController.text.toString());
                  sp.setString('userType', currentItemSelected.toString());
                  sp.setBool('isLogin', true);
                  if (currentItemSelected == 'User') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Userscreen(),
                      ),
                    );
                  } else if (currentItemSelected == 'Admin') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Adminscreen(),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Homescreen(),
                      ),
                    );
                  }
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
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
