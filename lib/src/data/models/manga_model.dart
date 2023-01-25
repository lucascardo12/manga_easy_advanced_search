class ApiResult {
  late final String status;
  late final String message;
  late final int quant;
  late final List<Map<String, dynamic>> data;

  ApiResult({
    required this.status,
    required this.message,
    required this.quant,
    required this.data,
  });

  ApiResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    quant = json['quant'];
    data = json['data']
        .map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['quant'] = quant;
    data['data'] = this.data;
    return data;
  }
}

class Mangas {
  final String name;
  final String id;
  final String uniqueid;
  final String ultimoCap;
  final int totalViews;
  final String autor;
  final String thumb;
  final String sinopse;
  final double ratio;
  final String scans;
  final int updatedAt;
  final int createdAt;
  final String generos;
  final bool isAdult;

  Mangas({
    required this.name,
    required this.id,
    required this.uniqueid,
    required this.ultimoCap,
    required this.totalViews,
    required this.autor,
    required this.thumb,
    required this.sinopse,
    required this.ratio,
    required this.scans,
    required this.updatedAt,
    required this.createdAt,
    required this.generos,
    required this.isAdult,
  });

  Mangas.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['_id'] ?? '',
        uniqueid = json['uniqueid'],
        ultimoCap = json['ultimo_cap'],
        totalViews = json['total_views'],
        autor = json['autor'],
        thumb = json['thumb'],
        sinopse = json['sinopse'],
        ratio = json['ratio'],
        scans = json['scans'],
        updatedAt = json['updated_at'],
        createdAt = json['created_at'],
        generos = json['generos'],
        isAdult = json['is_adult'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['_id'] = id;
    data['uniqueid'] = uniqueid;
    data['ultimo_cap'] = ultimoCap;
    data['total_views'] = totalViews;
    data['autor'] = autor;
    data['thumb'] = thumb;
    data['sinopse'] = sinopse;
    data['ratio'] = ratio;
    data['scans'] = scans;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['generos'] = generos;
    data['is_adult'] = isAdult;
    return data;
  }
}
