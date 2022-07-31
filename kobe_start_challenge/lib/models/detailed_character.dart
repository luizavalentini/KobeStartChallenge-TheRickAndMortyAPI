class DetailedCharacter {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final OriginName origin;
  final NameLocation location;
  final String image;
  final List<String> episode;

  DetailedCharacter({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    this.episode = const [],
  });

  factory DetailedCharacter.fromJson(Map<String, dynamic> map) {
    return DetailedCharacter(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      gender: map['gender'] as String,
      origin: OriginName.fromJson(map['origin'] as Map<String, dynamic>),
      location: NameLocation.fromJson(map['location'] as Map<String, dynamic>),
      image: map['image'] as String,
      episode: map['episode'].cast<String>(),
    );
  }
}

class NameLocation {
  final String name;
  final String url;

  NameLocation({
    required this.name,
    required this.url,
  });

  factory NameLocation.fromJson(Map<String, dynamic> map) {
    return NameLocation(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }
}

class OriginName {
  final String name;

  OriginName({
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory OriginName.fromJson(Map<String, dynamic> map) {
    return OriginName(
      name: map['name'] as String,
    );
  }
}
