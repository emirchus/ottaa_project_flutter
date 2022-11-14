// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentence_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SentenceModel _$SentenceModelFromJson(Map<String, dynamic> json) =>
    SentenceModel(
      frase: json['frase'] as String,
      frecuencia: json['frecuencia'] as int,
      complejidad:
          Complex.fromJson(json['complejidad'] as Map<String, dynamic>),
      fecha: (json['fecha'] as List<dynamic>).map((e) => e as int).toList(),
      locale: json['locale'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$SentenceModelToJson(SentenceModel instance) =>
    <String, dynamic>{
      'frase': instance.frase,
      'frecuencia': instance.frecuencia,
      'complejidad': instance.complejidad,
      'fecha': instance.fecha,
      'locale': instance.locale,
      'id': instance.id,
    };

Complex _$ComplexFromJson(Map<String, dynamic> json) => Complex(
      valor: json['valor'] as int,
      pictosComponentes: (json['pictos componentes'] as List<dynamic>)
          .map((e) => PictosComponente.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComplexToJson(Complex instance) => <String, dynamic>{
      'valor': instance.valor,
      'pictos componentes': instance.pictosComponentes,
    };

PictosComponente _$PictosComponenteFromJson(Map<String, dynamic> json) =>
    PictosComponente(
      id: json['id'] as int,
      esSugerencia: json['esSugerencia'] as bool,
      hora: (json['hora'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      edad: (json['edad'] as List<dynamic>).map((e) => e as String).toList(),
      sexo: (json['sexo'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PictosComponenteToJson(PictosComponente instance) =>
    <String, dynamic>{
      'id': instance.id,
      'esSugerencia': instance.esSugerencia,
      'hora': instance.hora,
      'edad': instance.edad,
      'sexo': instance.sexo,
    };
