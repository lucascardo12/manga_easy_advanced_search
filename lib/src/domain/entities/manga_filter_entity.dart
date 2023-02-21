class MangaFilterEntity {
  final String? search;
  late final int? yearAt;
  late final int? yearFrom;
  final List<String>? genders;
  final double? rating;
  final String? author;

  MangaFilterEntity({
    this.search,
    this.yearAt,
    this.yearFrom,
    this.genders,
    this.rating,
    this.author,
  });
}
