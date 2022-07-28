class DetailedCharacter {
  final int id;
  final String name;
  final String status;
  final String species;
  final Object location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  DetailedCharacter({
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

  factory DetailedCharacter.fromJson(Map<String, dynamic> map) {
    return DetailedCharacter(
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
