import 'package:flutter/material.dart';

import 'package:flutter_app/pages/favorites.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/jokes.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _currentIndex = 0;

  void onTabPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void openJokes() {
    onTabPressed(1);
  }

  getPage() {
    if (_currentIndex == 0) {
      return Home(
        onButtonPressed: openJokes,
      );
    }
    if (_currentIndex == 1) {
      return const Jokes();
    }
    if (_currentIndex == 2) {
      return const Favorites();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.deepOrangeAccent,
        selectedFontSize: 12,
        iconSize: 36,
        selectedItemColor: Colors.white,
        onTap: onTabPressed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mark_unread_chat_alt_outlined),
            label: 'Jokes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
