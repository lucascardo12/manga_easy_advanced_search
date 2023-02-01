class ResultModel {
  late final String status;
  late final String message;
  late final int quant;
  late final List<Map<String, dynamic>> data;

  ResultModel({
    required this.status,
    required this.message,
    required this.quant,
    required this.data,
  });

  ResultModel.fromJson(Map<String, dynamic> json) {
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
