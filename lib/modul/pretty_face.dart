class PrettyFace {
  int? lenghts;
  String? face;
  PrettyFace({this.face, this.lenghts});
  factory PrettyFace.fromJson(Map<String, dynamic> json) {
    return PrettyFace(lenghts: json['length'], face: json['fact'] as String);
  }
}
