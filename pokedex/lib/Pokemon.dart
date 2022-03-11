import 'dart:convert';

class Pokemon {
  final String name;
  final int id;
  final int baseXp;
  final Sprite sprite;

  const Pokemon(
      {required this.name,
      required this.id,
      required this.baseXp,
      required this.sprite});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
        name: json['name'],
        id: json['id'],
        baseXp: json['base_experience'],
        sprite: Sprite.fromJson(json['sprites']));
  }
}

class Sprite {
  final Other other;

  const Sprite({required this.other});

  factory Sprite.fromJson(Map<String, dynamic> json) {
    return Sprite(
      other: Other.fromJson(json['other']),
    );
  }
}

class Other {
  final Dream dream;

  const Other({required this.dream});

  factory Other.fromJson(Map<String, dynamic> json) {
    return Other(
      dream: Dream.fromJson(json['home']),
    );
  }
}

class Dream {
  final String url;

  const Dream({required this.url});

  factory Dream.fromJson(Map<String, dynamic> json) {
    return Dream(url: json['front_default']);
  }
}
