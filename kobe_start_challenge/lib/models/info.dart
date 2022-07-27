class Info {
  final int count;
  final int pages;
  final String next;
  final String? prev;
  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> map) {
    return Info(
      count: map['count'] as int,
      pages: map['pages'] as int,
      next: map['next'] as String,
      prev: map['prev'] as String?,
    );
  }
}
