import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  late bool _switchValue;

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
    )
  ];

  static const List<Text> _textDisplays = [
    Text(
      'Appuyez sur un drapeau pour écrire',
      style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold),
    ),
    Text(
      'Touchez un drapeau pour parler.',
      style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold),
    )
  ];

  @override
  Widget build(BuildContext context) {
    _switchValue = false;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        foregroundColor: Colors.white,
        // titleTextStyle:
        //     const TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0),
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.delete,
          ),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Speak & ",
              style: TextStyle(fontWeight: FontWeight.w100),
            ),
            Text(
              "Translate",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        actions: [
          IconButton(
              icon: const Icon(CupertinoIcons.settings), onPressed: () {})
        ],
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        height: height,
        width: width,
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: height * 0.6,
                width: width,
                child: Column(
                  children: [
                    const SizedBox(height: 180.0),
                    _iconDisplays.elementAt(_selectedIndex),
                    const SizedBox(height: 10.0),
                    _textDisplays.elementAt(_selectedIndex)
                  ],
                ),
              ),
              Container(
                height: height * 0.2,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                          cardTheme: const CardTheme(shape: CircleBorder())),
                      child: Card(
                        child: Container(
                          // height: MediaQuery.of(context).size.width / 7,
                          width: width / 7,
                          alignment: Alignment.center,
                          child: const Text("Flag 1"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 25.0),
                    IconButton(
                      icon: const Icon(CupertinoIcons.arrow_up_down_circle),
                      color: Colors.white,
                      onPressed: () => showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => buildSheet()),
                    ),
                    const SizedBox(width: 25.0),
                    Theme(
                      data: Theme.of(context).copyWith(
                          cardTheme: const CardTheme(shape: CircleBorder())),
                      child: Card(
                        child: Container(
                          // height: 70.0,
                          width: width / 7,
                          alignment: Alignment.center,
                          child: const Text("Flag 2"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
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
        ],
      ),
    );
  }

  Widget buildSheet() {
    return DraggableScrollableSheet(
        initialChildSize: 0.95,
        maxChildSize: 0.95,
        minChildSize: 0.9,
        builder: (_, controller) => Container(
            // Pour rendre les bords arrondis avec un fond blanc
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.blue,
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close)),
                      hintText: "Rechercher une langue"),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.airplanemode_active,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Mode hors ligne",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 170),
                          Switch.adaptive(
                              value: _switchValue,
                              onChanged: (value) {
                                setState(() {
                                  _switchValue = value;
                                });
                              })
                        ],
                      ),
                      Container(
                        child: const Text(
                          "Toutes les langues",
                          style: TextStyle(
                            color: Colors.black54
                          ),
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 20,
                        padding: const EdgeInsets.only(left: 10),
                      ),
                      
                    ],
                  ),
                )
              ],
            )));
  }
}
