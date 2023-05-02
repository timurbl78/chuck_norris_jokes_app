class AddJokeAction {
  final String joke;

  AddJokeAction(this.joke);
}

List<String> reducer(List<String> state, dynamic action) {
  if (action is AddJokeAction) {
    return List.from(state)..add(action.joke);
  } else {
    return state;
  }
}

typedef OnItemAddedCallback = Function(String itemName);
