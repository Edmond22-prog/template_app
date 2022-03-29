import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'languages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variable qui change en fonction du bouton de navigation choisi
  int _selectedIndex = 1;

  // Variable permettant de changer la vue du body apres un click sur la langue
  int _onClick = 0;

  // Variables qui determinent quelles sont les langues choisies pour la traduction
  int _currentLanguageFromIndex = 0;
  int _currentLanguageToIndex = 0;

  // Variable qui determine quel bouton de langue on veut changer sur le bottomsheet
  int _buttonChange = 0;

  // Procedure qui change la valeur de la variable selon le bouton de navigation
  // choisi
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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    // Enleve le focus lorsque l'on tape n'importe ou sur l'ecran
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          foregroundColor: Colors.white,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Si on n'a pas clique sur un bouton de translation, alors on affiche
                // cette vue.
                (_onClick == 0)
                    ? Container(
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
                      )
                    // Sinon on affiche cette vue
                    : translationFromTo(_onClick),
                SizedBox(
                  height: height * 0.2,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width / 7,
                        height: width / 7,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                                bottom: Radius.circular(30))),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _onClick = 1;
                            });
                          },
                          // A remplacer par un drapeau
                          icon: Text(
                            // Fourni la clé du langage choisit en texte
                            languages[_currentLanguageFromIndex].keys.first,
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
                      Container(
                        width: width / 7,
                        height: width / 7,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                                bottom: Radius.circular(30))),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _onClick = 2;
                            });
                          },
                          // A remplacer par un drapeau
                          icon: const Text(
                            "U.S",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
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
      ),
    );
  }

  Widget buildSheet() {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: DraggableScrollableSheet(
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
                        Container(
                          child: const Text(
                            "Toutes les langues",
                            style: TextStyle(color: Colors.black54),
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 20,
                          padding: const EdgeInsets.only(left: 10),
                        ),
                        showLanguages(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.width / 9,
                              width: MediaQuery.of(context).size.width / 9,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  print("From FR language");
                                },
                                // A remplacer par un drapeau
                                icon: Text(
                                  // Fourni la clé du langage choisit en texte
                                  languages[_currentLanguageFromIndex]
                                      .keys
                                      .first,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(width: 25.0),
                            IconButton(
                                icon: const Icon(
                                    CupertinoIcons.arrow_up_down_circle),
                                color: Colors.blue,
                                onPressed: () => Navigator.pop(context)),
                            const SizedBox(width: 25.0),
                            Container(
                              height: MediaQuery.of(context).size.width / 9,
                              width: MediaQuery.of(context).size.width / 9,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  print("To U.S language");
                                },
                                // A remplacer par un drapeau
                                icon: const Text(
                                  "U.S",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
          )),
    );
  }

  Widget showLanguages() {
    // languageList.sort((a, b) => a.compareTo(b));
    languages.sort((a, b) =>
        a.values.first.toString().compareTo(b.values.first.toString()));
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: ListView.builder(
            itemCount: languages.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(languages[index].values.first,
                    style: (_currentLanguageFromIndex == index)
                        ? const TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)
                        : const TextStyle(color: Colors.black)),
                onTap: () {
                  setState(() {
                    _currentLanguageFromIndex = index;
                  });
                  Navigator.pop(context);
                },
              );
            }));
  }

  Widget translationFromTo(int onClick) => SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: (onClick == 1)
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            Container(
              // Doit s'elargir selon le texte qu'on entre
              width: MediaQuery.of(context).size.width / 3,
              height: 30,
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: TextFormField(
                style: const TextStyle(color: Colors.lightBlue),
                cursorColor: Colors.lightBlue,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: (_selectedIndex == 0)
                  ? const Text(
                      "Text traduit.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                  : const Text(
                      "Voice traduit.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
            )
          ],
        ),
      ));
}
