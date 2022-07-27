class DetailedLocation {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<Resident> residents;
  final String url;
  final String created;

  DetailedLocation({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    this.residents = const [],
    required this.url,
    required this.created,
  });

factory DetailedLocation.fromJson(Map<String, dynamic> json) {
    return DetailedLocation(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      dimension: json['dimension'],
      residents: List.from(json['residents']).map((e) => 
      Resident.fromJson(e)).toList(),
      url: json['url'],
      created: json['created'],
    );
  }
}

class Resident {
  final int id;
  final String name;

  Resident({
    required this.id,
    required this.name,
  });
factory Resident.fromJson(Map<String, dynamic> map) {
    return Resident(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }
}