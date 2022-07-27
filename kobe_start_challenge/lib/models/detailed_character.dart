class DetailedCharacter {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Object origin;
  final Object location;
  final String image;
  final List<Episode> episodes;
  final String url;
  final String created;

  DetailedCharacter({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    this.episodes = const [],
    required this.url,
    required this.created,
  });

  factory DetailedCharacter.fromJson(Map<String, dynamic> json) {
    return DetailedCharacter(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: json['origin'],
      location: json['location'],
      image: json['image'],
      episodes: List.from(json['episodes']).map((e) => 
      Episode.fromJson(e)).toList(),
      url: json['url'],
      created: json['created'],
    );
  }
}

class Episode {
    final int id;
    final int name;

  Episode({
    required this.id,
    required this.name,
  });

  factory Episode.fromJson(Map<String, dynamic> map) {
    return Episode(
      id: map['id'] as int,
      name: map['name'] as int,
    );
  }
}
