import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Icon> _iconDisplays = [
    Icon(
      CupertinoIcons.keyboard,
      color: Colors.white54,
      size: 50.0,
    ),
    Icon(
      Icons.settings_voice_outlined,
      color: Colors.white54,
      size: 50.0,
    ),
    Icon(
      Icons.camera,
      color: Colors.white54,
      size: 50.0,
    )
  ];

  static const List<Text> _textDisplays = [
    Text(
      'Appuyez sur un drapeau pour écrire',
      style: TextStyle(
          color: Colors.white54, fontWeight: FontWeight.bold),
    ),
    Text(
      'Touchez un drapeau pour parler.',
      style: TextStyle(
          color: Colors.white54, fontWeight: FontWeight.bold),
    ),
    Text(
      'Capture',
      style: TextStyle(
          color: Colors.white54, fontWeight: FontWeight.bold),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        foregroundColor: Colors.white,
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0),
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.delete,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Speak & Translate',
        ),
        actions: [
          IconButton(
              icon: const Icon(CupertinoIcons.settings), onPressed: () {})
        ],
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _iconDisplays.elementAt(_selectedIndex),
                    const SizedBox(height: 10.0),
                    _textDisplays.elementAt(_selectedIndex)
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Theme(
              //       data: Theme.of(context).copyWith(
              //           cardTheme: const CardTheme(shape: CircleBorder())),
              //       child: Card(
              //         child: Container(
              //           height: 70.0,
              //           width: 70.0,
              //           alignment: Alignment.center,
              //           child: const Text("Flag 1"),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(width: 25.0),
              //     IconButton(
              //       icon: const Icon(CupertinoIcons.arrow_up_down_circle),
              //       color: Colors.white,
              //       onPressed: () {},
              //     ),
              //     const SizedBox(width: 25.0),
              //     Theme(
              //       data: Theme.of(context).copyWith(
              //           cardTheme: const CardTheme(shape: CircleBorder())),
              //       child: Card(
              //         child: Container(
              //           height: 70.0,
              //           width: 70.0,
              //           alignment: Alignment.center,
              //           child: const Text("Flag 2"),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.textformat_alt), label: "Tapez"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_voice_outlined), label: "Énoncer"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.camera), label: "Snap"),
        ],
      ),
    );
  }
}
