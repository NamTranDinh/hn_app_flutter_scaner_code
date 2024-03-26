class QrCodeResultModel {
  QrCodeResultModel({
    this.data,
    this.createDate,
  });

  QrCodeResultModel.fromJson(dynamic json) {
    data = json['data'];
    createDate = json['createDate'];
  }

  String? data;
  String? createDate;

  QrCodeResultModel copyWith({
    String? data,
    String? createDate,
  }) =>
      QrCodeResultModel(
        data: data ?? this.data,
        createDate: createDate ?? this.createDate,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = data;
    map['createDate'] = createDate;
    return map;
  }
}
