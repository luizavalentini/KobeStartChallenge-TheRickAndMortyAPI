class DetailedEpisode {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<Character> characters;
  final String url;
  final String created;

  DetailedEpisode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    this.characters = const [],
    required this.url,
    required this.created,
  });

  factory DetailedEpisode.fromJson(Map<String, dynamic> json) {
    return DetailedEpisode(
      id: json['id'],
      name: json['name'],
      airDate: json['air_date'],
      episode: json['episode'],
      characters: List.from(json['characters']).map((e) => 
      Character.fromJson(e)).toList(),
      url: json['url'],
      created: json['created'],
    );
  }
}
class Character {
    final int id;
    final String name;

  Character({
    required this.id,
    required this.name,
  });

  factory Character.fromJson(Map<String, dynamic> map) {
    return Character(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }
}
