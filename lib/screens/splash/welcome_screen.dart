import 'package:flutter/material.dart';
import '../../theme/app_decoration.dart';
import '../home/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "Todo List App",
            style: TextStyle(color: Color(0xff5F78FC), fontSize: 20),
          ),
          Column(children: [
            Image.network("https://iili.io/HhFvSQR.webp"),
            const Text(
              "Welcome To My Todo List Application!",
              style: TextStyle(color: Color(0xffB6BFEF)),
            ),
          ]),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen())),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.05,
              alignment: Alignment.center,
              decoration: AppDecoration.groupStyleBlueWhite,
              child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
