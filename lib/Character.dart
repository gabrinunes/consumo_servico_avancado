import 'package:json_annotation/json_annotation.dart';

part 'Character.g.dart';

@JsonSerializable()
class Character {
  Character(this.name, this.height, this.mass, this.films, this.species);

  String name;
  String height;
  String mass;
  List<String> films;
  List<String> species;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
