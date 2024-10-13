// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pretty_face.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrettyFace _$PrettyFaceFromJson(Map<String, dynamic> json) => PrettyFace(
      fact: json['fact'] as String,
      length: (json['length'] as num).toInt(),
    );

Map<String, dynamic> _$PrettyFaceToJson(PrettyFace instance) =>
    <String, dynamic>{
      'fact': instance.fact,
      'length': instance.length,
    };
