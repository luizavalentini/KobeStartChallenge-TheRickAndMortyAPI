

class DetailedEpisode {
  final int id;
  final String name;

  DetailedEpisode({
    required this.id,
    required this.name,
  });

  factory DetailedEpisode.fromJson(Map<String, dynamic> map) {
    return DetailedEpisode(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

}
