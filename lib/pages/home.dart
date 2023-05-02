import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/my_app_bar.dart';

class Home extends StatelessWidget {
  final VoidCallback onButtonPressed;

  const Home({
    super.key,
    required this.onButtonPressed,
  });

  forwardToJokes() {
    onButtonPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Home'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Welcome to Chuck Norris jokes App!",
            style: TextStyle(
              fontSize: 32,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.deepOrangeAccent),
            ),
            onPressed: () {
              forwardToJokes();
            },
            child: const Text(
              'Let\'s go!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
