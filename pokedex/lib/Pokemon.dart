class Pokemon {
  final String name;
  final int id;
  final int baseXp;
  //final String url;

  const Pokemon({
    required this.name,
    required this.id,
    required this.baseXp,
    //required this.url
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      id: json['id'],
      baseXp: json['base_experience'],
      //url: json['sprites']['other']['dream_world']['front-default'],
    );
  }
}