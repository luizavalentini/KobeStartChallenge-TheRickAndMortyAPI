import 'package:kobe_start_challenge/models/info.dart';

class PaginatedCharacter {
  final List<Character> results;
  final Info info;

  PaginatedCharacter({
    required this.results,
    required this.info,
  });

  factory PaginatedCharacter.fromJson(Map<String, dynamic> map) {
    return PaginatedCharacter(
      results: List<Character>.from(
        (map['results'] as List).map<Character>(
          (x) => Character.fromJson(x as Map<String, dynamic>),
        ),
      ),
      info: Info.fromJson(map['info'] as Map<String, dynamic>),
    );
  }
}

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final Object location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Character.fromJson(Map<String, dynamic> map) {
    return Character(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      location: map['location'] as Object,
      image: map['image'] as String,
      episode: map['episode'].cast<String>(),
      url: map['url'] as String,
      created: map['created'] as String,
    );
  }
}

class Location {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final String created;

  Location({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    this.residents = const [],
    required this.url,
    required this.created,
  });

  factory Location.fromJson(Map<String, dynamic> map) {
    return Location(
      id: map['id'] as int,
      name: map['name'] as String,
      type: map['type'] as String,
      dimension: map['dimension'] as String,
      residents: (map['residents']),
      url: map['url'] as String,
      created: map['created'] as String,
    );
  }
}

class Episode {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<Character> characters;
  final String url;
  final String created;

  Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  factory Episode.fromJson(Map<String, dynamic> map) {
    return Episode(
      id: map['id'] as int,
      name: map['name'] as String,
      airDate: map['airDate'] as String,
      episode: map['episode'] as String,
      characters: List<Character>.from(
        (map['characters'] as List).map<Character>(
          (x) => Character.fromJson(x as Map<String, dynamic>),
        ),
      ),
      url: map['url'] as String,
      created: map['created'] as String,
    );
  }
}
