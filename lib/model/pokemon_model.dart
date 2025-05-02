// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'flavor_text_entries.dart';

class PokemonModel {
  int? id;
  String? name;
  String? url;
  List<FlavorTextEntries>? flavorTextEntries = [];

  PokemonModel({this.id, this.name, this.url, this.flavorTextEntries});

  int get idByUrl {
    return url != null ? int.parse(url!.split('/')[6]) : 0;
  }

  PokemonModel copyWith({
    int? id,
    String? name,
    String? url,
    List<FlavorTextEntries>? flavorTextEntries,
  }) {
    return PokemonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      flavorTextEntries: flavorTextEntries ?? this.flavorTextEntries,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'url': url,
      'flavor_text_entries':
          flavorTextEntries != null && flavorTextEntries!.isNotEmpty
              ? flavorTextEntries!.map((x) => x.toMap()).toList()
              : null,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    var flavorTextEntriesList =
        map['flavor_text_entries'] != null
            ? List<FlavorTextEntries>.from(
              (map['flavor_text_entries'] as List<dynamic>)
                  .map<FlavorTextEntries?>(
                    (x) => FlavorTextEntries.fromMap(x as Map<String, dynamic>),
                  ),
            )
            : null;

    flavorTextEntriesList = PokemonModel.getFlavorTextEntriesListByLanguage(
      flavorTextEntriesList,
      'fr',
    );

    return PokemonModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      flavorTextEntries: flavorTextEntriesList,
    );
  }

  static List<FlavorTextEntries>? getFlavorTextEntriesListByLanguage(
    List<FlavorTextEntries>? flavorTextEntriesList,
    String language,
  ) {
    return flavorTextEntriesList != null && flavorTextEntriesList.isNotEmpty
        ? flavorTextEntriesList.where((x) => x.language == language).toList()
        : null;
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PokemonModel(id: $id, name: $name, url: $url, flavorTextEntries: $flavorTextEntries)';
  }

  @override
  bool operator ==(covariant PokemonModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.url == url &&
        listEquals(other.flavorTextEntries, flavorTextEntries);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        url.hashCode ^
        flavorTextEntries.hashCode;
  }
}
