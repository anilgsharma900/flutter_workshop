import 'package:flutter/material.dart';
import 'package:flutter_workshopt/dashboard_view.dart';
import 'package:flutter_workshopt/login_view.dart';
import 'package:flutter_workshopt/storage/app_store.dart';
import 'package:flutter_workshopt/storage/app_store.dart';
import 'package:flutter_workshopt/storage/app_store.dart';

/// Created by Anil Sharma on 11/02/23.
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      if ((AppStore.getAuth() ?? false)) {
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (_) => const DashboardView()), (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (_) => const LoginView()), (route) => false);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.indigo[900],
          child: const Center(
              child: Text(
                "Flutter Workshop",
                style: TextStyle(color: Colors.white, fontSize: 32),
              )),
        ),
      ),
    );
  }
}
