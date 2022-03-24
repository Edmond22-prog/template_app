import 'package:flutter/material.dart';
import 'package:speak_and_translate_app/home_page.dart';

class FirstOpen extends StatelessWidget {
  const FirstOpen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        color: Colors.white,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IconButton(
                  padding: EdgeInsets.only(left: width / 1.2),
                  onPressed: () {},
                  icon: const Icon(Icons.close)),
              Text(
                "Accorder l'accès",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: width / 12),
              ),
              const SizedBox(height: 60),
              Container(
                height: width / 3,
                width: width / 3,
                margin: EdgeInsets.only(left: width / 3, right: width / 3),
                decoration: const BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(70))),
                child: Icon(
                  Icons.keyboard_voice_outlined,
                  size: width / 6,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 60),
              Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: const Text(
                  "Pour que vous puissiez utiliser la conversation vocale, "
                  "vous devez autoriser Speak & Translate à utiliser le micro et la fonction "
                  "de reconnaissance vocale de votre appareil.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(children: const [
                  Icon(
                    Icons.keyboard_voice_outlined,
                    color: Colors.lightBlue,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Microphone",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ]),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(children: const [
                  Icon(
                    Icons.record_voice_over_outlined,
                    color: Colors.lightBlue,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Reconnaissance vocale",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                ]),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage())),
                    child: const Text(
                      "Autoriser",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
