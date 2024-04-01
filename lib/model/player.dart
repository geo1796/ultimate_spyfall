class Player {
  String name;

  Player(this.name);

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  @override
  String toString() {
    return 'Player{name=$name}';
  }
}

final defaultPlayers = <Player>[
  Player('Player 1'),
  Player('Player 2'),
  Player('Player 3'),
];
