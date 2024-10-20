import 'dart:math';

import 'package:c2_haryo_191_userlist/controllers/animationC.dart';
import 'package:c2_haryo_191_userlist/widgets/route-button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;

    final animateC = Get.put(AnimationC());

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(children: [
          Positioned(
            top: 30,
            left: -150,
            child: Hero(
              tag: "bola-red",
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red[900],
                ),
                height: 300,
                width: 300,
              ),
            ),
          ),
          Positioned(
            top: -250,
            left: -250,
            child: Hero(
              tag: "bola-orange",
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange[900],
                ),
                height: 500,
                width: 500,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                width: double.infinity,
                height: maxHeight / 3,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Aplikasi Daftar Mahasiswa UBG",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Text(
                      "Haryo Darma Putra",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Text(
                      "2301010191",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Container(
                height: maxHeight / 3,
                width: maxWidth,
                alignment: Alignment.center,
                child: AnimatedBuilder(
                  animation: animateC.flutterLogo!,
                  child: Transform.rotate(
                    angle: -pi / 10,
                    child: Hero(
                      tag: "flutter-logo",
                      child: FlutterLogo(
                        style: FlutterLogoStyle.stacked,
                        size: 200,
                      ),
                    ),
                  ),
                  builder: (context, child) => Transform.rotate(
                    angle: animateC.flutterLogo!.value * pi / 5,
                    child: child,
                  ),
                ),
              ),
              Container(
                height: maxHeight / 3,
                width: maxWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RouteButton(
                      tittle: "Login",
                      nameRoute: "/login",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RouteButton(
                      tittle: "Register",
                      nameRoute: "/register",
                    )
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
