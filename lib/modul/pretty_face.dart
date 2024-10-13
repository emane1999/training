import 'package:json_annotation/json_annotation.dart';
part 'pretty_face.g.dart';

@JsonSerializable()
class PrettyFace {
  PrettyFace({
    required this.fact,
    required this.length,
  });

  final String fact;
  final int length;

  PrettyFace copyWith({
    String? fact,
    int? length,
  }) {
    return PrettyFace(
      fact: fact ?? this.fact,
      length: length ?? this.length,
    );
  }

  factory PrettyFace.fromJson(Map<String, dynamic> json) =>
      _$PrettyFaceFromJson(json);

  Map<String, dynamic> toJson() => _$PrettyFaceToJson(this);

  @override
  String toString() {
    return "$fact, $length, ";
  }
}
