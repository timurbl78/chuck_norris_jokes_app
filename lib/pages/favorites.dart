import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/my_app_bar.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Favorites'),
      body: StoreConnector<List<String>, List<String>>(
        converter: (store) => store.state,
        builder: (context, state) => ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: state.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                '${index + 1}) ${state[index]}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
