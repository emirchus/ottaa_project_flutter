import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:ottaa_project_flutter/core/abstracts/hive_type_ids.dart';

part 'shortcuts_model.g.dart';

@HiveType(typeId: HiveTypesIds.shortcutsTypeId)
class Shortcuts {
  @HiveField(0, defaultValue: false)
  bool favs;

  @HiveField(1, defaultValue: false)
  bool history;

  @HiveField(2, defaultValue: false)
  bool camera;

  @HiveField(3, defaultValue: false)
  bool share;

  @HiveField(4, defaultValue: false)
  bool games;

  @HiveField(5, defaultValue: false)
  bool yes;

  @HiveField(6, defaultValue: false)
  bool no;

  Shortcuts({
    required this.favs,
    required this.history,
    required this.camera,
    required this.share,
    required this.games,
    required this.no,
    required this.yes,
  });

  factory Shortcuts.none() => Shortcuts(
        favs: false,
        history: false,
        camera: false,
        share: false,
        games: false,
        yes: false,
        no: false,
      );

  Shortcuts copyWith({
    bool? favs,
    bool? history,
    bool? camera,
    bool? share,
    bool? games,
    bool? yes,
    bool? no,
  }) {
    return Shortcuts(
      favs: favs ?? this.favs,
      history: history ?? this.history,
      camera: camera ?? this.camera,
      share: share ?? this.share,
      games: games ?? this.games,
      yes: yes ?? this.yes,
      no: no ?? this.no,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'favs': favs,
      'history': history,
      'camera': camera,
      'share': share,
      'games': games,
      'yes': yes,
      'no': no,
    };
  }

  factory Shortcuts.fromMap(Map<String, dynamic> map) {
    print(map);
    return Shortcuts.none().copyWith(
      favs: map['favs'],
      history: map['history'],
      camera: map['camera'],
      share: map['share'],
      games: map['games'],
      yes: map['yes'],
      no: map['no'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Shortcuts.fromJson(String source) => Shortcuts.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Shortcuts(favs: $favs, history: $history, camera: $camera, share: $share, games: $games)';
  }

  @override
  bool operator ==(covariant Shortcuts other) {
    if (identical(this, other)) return true;

    return other.favs == favs && other.history == history && other.camera == camera && other.share == share && other.games == games;
  }

  @override
  int get hashCode {
    return favs.hashCode ^ history.hashCode ^ camera.hashCode ^ share.hashCode ^ games.hashCode;
  }
}