import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      backgroundColor: Colors.deepOrangeAccent,
      leading: const Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        child: Image(image: AssetImage('assets/chucknorris_logo.png')),
      ),
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);
}
