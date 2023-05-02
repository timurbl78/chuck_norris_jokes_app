import 'package:flutter/material.dart';
import 'package:flutter_app/models/joke.dart';
import 'package:flutter_app/services/chuck_norris_service.dart';
import 'package:flutter_app/widgets/my_app_bar.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../store/store.dart';

class Jokes extends StatefulWidget {
  const Jokes({super.key});

  @override
  JokesState createState() => JokesState();
}

class JokesState extends State<Jokes> {
  var _isJokeLoaded = false;
  var _isCategoriesLoaded = false;
  Joke? _joke;
  List<String>? _categories = [];
  String? _category = '';

  @override
  void initState() {
    super.initState();

    getRandomJoke();
    getCategories();
  }

  getRandomJoke() async {
    _isJokeLoaded = false;
    Joke? joke;

    if (_category != '' && _category != null) {
      joke = await ChuckNorrisService().getRandomJoke(category: _category);
    } else {
      joke = await ChuckNorrisService().getRandomJoke();
    }

    if (joke != null) {
      setState(() {
        _joke = joke;
        _isJokeLoaded = true;
      });
    }
  }

  getCategories() async {
    _isCategoriesLoaded = false;

    var cat = await ChuckNorrisService().getCategories();

    setState(() {
      _categories = cat;
      _isCategoriesLoaded = true;
    });
  }

  resetCategory() {
    setState(() {
      _category = '';
    });
  }

  void onCategoryChanged(String? value) {
    setState(() {
      _category = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Jokes'),
      body: Visibility(
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        visible: _isJokeLoaded && _isCategoriesLoaded,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${_joke?.text}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Filter jokes by category:",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Flexible(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.all(20),
                          itemCount: _categories?.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: const EdgeInsets.all(0),
                              child: ListTile(
                                title: Text(_categories![index]),
                                leading: Radio<String>(
                                  value: _categories![index],
                                  groupValue: _category,
                                  onChanged: onCategoryChanged,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StoreConnector<List<String>, OnItemAddedCallback>(
                    converter: (store) {
                      return (text) {
                        return store.dispatch(AddJokeAction(text));
                      };
                    },
                    builder: (_, callback) {
                      return TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amberAccent),
                        ),
                        onPressed: () {
                          callback(_joke?.text != null ? "${_joke?.text}" : "");
                        },
                        child: const Text(
                          'Add to favorites',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                    ),
                    onPressed: resetCategory,
                    child: const Text(
                      'Reset filters',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlueAccent),
                    ),
                    onPressed: getRandomJoke,
                    child: const Text(
                      'See another joke',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
