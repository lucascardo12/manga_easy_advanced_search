class MangaFilterEntity {
  final String? search;
  final int? yearAt;
  final int? yearFrom;
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
