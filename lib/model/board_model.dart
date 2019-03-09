class Board {
  String key;
  int counter;
  BoardSettings settings;

  Board(this.key, {
    this.counter: 0,
    this.settings = const BoardSettings(),
  });

  Board.reset() {}
}

class BoardSettings {
  // Dart Constant Constructors
  final String name;
  final String brandImage;

  const BoardSettings({
    this.name: 'Default Name',
    this.brandImage: "default.jpg",
  });

  BoardSettings.zero() : name= 'a', brandImage = 'b';
  BoardSettings.clone(BoardSettings another): name = another.name, brandImage =  another.brandImage;
}

