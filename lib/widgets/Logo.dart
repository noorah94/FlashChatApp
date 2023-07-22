import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  Logo({super.key});

  //DateTime.now()
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      //width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(
            fontWeight: FontWeight.w800, fontSize: 45, color: Colors.black),
        child: Row(
          children: [
            Hero(
              tag: "DemoTag",
              child: Image.asset(
                'images/logo.png',
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.width * 0.20,
              ),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Flash Chat',
                  speed: const Duration(milliseconds: 400),
                ),
              ],
              repeatForever: true,
              onTap: () {
                print("Tap Event");
              },
            ),
          ],
        ),
      ),
    );
  }
}




    // return SizedBox(
    //   height: MediaQuery.of(context).size.height * 0.15,
    //   child: Row(
    //     children: [
    //       Image.asset(
    //         'images/logo.png',
    //         height: MediaQuery.of(context).size.height * 0.10,
    //         width: MediaQuery.of(context).size.width * 0.20,
    //       ),
    //       TimerBuilder.periodic(
    //           Duration(milliseconds: 400), //updates every second
    //           builder: (context) => Text(
    //                 "${logo()}",
    //                 style: TextStyle(fontWeight: FontWeight.w800, fontSize: 45),
    //               )),
    //     ],
    //   ),
    // );

/**
 * 
 * 
 * 
 * 
 *   int index = 0;

  List<String> str = [
    "F|",
    "Fl|",
    "Fla|",
    "Flas|",
    "Flash|",
    "Flash |",
    "Flash C|",
    "Flash Ch|",
    "Flash Cha|",
    "Flash Chat|",
    "Flash Chat",
    "Flash Chat|",
    "Flash Chat",
    "Flash Chat|",
    "Flash Chat",
    "Flash Chat|",
    "Flash Chat",
    "Flash Chat|",
  ];

  String logo() {
    index++;
    if (index == str.length) index = 0;
    return str[index];
  }
 * 
 * 
 * 
 * 
 * 
 * 
 * ** */
