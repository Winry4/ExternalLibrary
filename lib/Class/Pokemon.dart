class Pokemon {
  final int id;
  final String name;
  final int base_experience;
  final int height;
  final bool is_default;
  final int order;
  final int weight;

  //final int abilities;
  Pokemon(
      {this.id,
      this.name,
      this.base_experience,
      this.height,
      this.is_default,
      this.order,
      this.weight});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
        id: json['id'],
        name: json['name'],
        base_experience: json['base_experience'],
        height: json['height'],
        is_default: json['is_default'],
        order: json['order'],
        weight: json['weight']);
  }

  String get _name => name;
}
