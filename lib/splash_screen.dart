import 'dart:async';
import 'package:flutter/material.dart';
import 'package:multi_role_app/admin_screen.dart';
import 'package:multi_role_app/login_screen.dart';
import 'package:multi_role_app/user_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';

    if (isLogin) {
      if (userType == 'User') {
        Timer(
            const Duration(
              seconds: 10,
            ), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Userscreen(),
            ),
          );
        });
      } else if (userType == 'Admin') {
        Timer(
            const Duration(
              seconds: 10,
            ), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Adminscreen(),
            ),
          );
        });
      }
    } else {
      Timer(
          const Duration(
            seconds: 10,
          ), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Loginscreen(),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Image(
          height: double.maxFinite,
          fit: BoxFit.fitHeight,
          image: NetworkImage(
              'https://images.pexels.com/photos/731217/pexels-photo-731217.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
        ),
      ),
    );
  }
}
