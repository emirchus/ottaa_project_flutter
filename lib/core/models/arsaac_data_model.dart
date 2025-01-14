import 'package:json_annotation/json_annotation.dart';

part 'arsaac_data_model.g.dart';

@JsonSerializable()
class ArsaacDataModel {
  ArsaacDataModel({
    required this.id,
    required this.text,
    this.textDiacritised,
    this.description,
    required this.language,
    required this.picto,
  });

  int id;
  String text;
  @JsonKey(name: 'text_diacritised')
  String? textDiacritised;
  String? description;
  String language;
  SearchPicto picto;

  factory ArsaacDataModel.fromJson(Map<String, dynamic> json) => _$ArsaacDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArsaacDataModelToJson(this);
}

@JsonSerializable()
class SearchPicto {
  SearchPicto({
    required this.id,
    this.symbolsetId,
    required this.partOfSpeech,
    required this.imageUrl,
    required this.nativeFormat,
    required this.adaptable,
  });

  int id;
  @JsonKey(name: 'symbolset_id')
  int? symbolsetId;
  @JsonKey(name: 'part_of_speech')
  String partOfSpeech;
  @JsonKey(name: 'image_url')
  String imageUrl;
  @JsonKey(name: 'native_format')
  String nativeFormat;
  bool adaptable;

  factory SearchPicto.fromJson(Map<String, dynamic> json) => _$SearchPictoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPictoToJson(this);
}
