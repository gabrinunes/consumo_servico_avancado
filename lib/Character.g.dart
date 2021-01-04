// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) {
  return Character(
    json['name'] as String,
    json['height'] as String,
    json['mass'] as String,
    (json['films'] as List)?.map((e) => e as String)?.toList(),
    (json['species'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'name': instance.name,
      'height': instance.height,
      'mass': instance.mass,
      'films': instance.films,
      'species': instance.species,
    };
