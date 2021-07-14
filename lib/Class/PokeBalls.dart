class PokeBalls {
  final int id;
  final String name;
  final int cost;

  //final int abilities;
  PokeBalls({this.id, this.name, this.cost});

  factory PokeBalls.fromJson(Map<String, dynamic> json) {
    return PokeBalls(
      id: json['id'],
      name: json['name'],
      cost: json['cost'],
    );
  }
}
