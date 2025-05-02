// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FlavorTextEntries {
  String flavorText;
  String language;
  String version;

  FlavorTextEntries({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  FlavorTextEntries copyWith({
    String? flavorText,
    String? language,
    String? version,
  }) {
    return FlavorTextEntries(
      flavorText: flavorText ?? this.flavorText,
      language: language ?? this.language,
      version: version ?? this.version,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'flavor_text': flavorText,
      'language': language,
      'version': version,
    };
  }

  factory FlavorTextEntries.fromMap(Map<String, dynamic> map) {
    return FlavorTextEntries(
      flavorText: map['flavor_text'] as String,
      language: map['language']['name'] as String,
      version: map['version']['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FlavorTextEntries.fromJson(String source) =>
      FlavorTextEntries.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FlavorTextEntries(flavorText: $flavorText, language: $language, version: $version)';

  @override
  bool operator ==(covariant FlavorTextEntries other) {
    if (identical(this, other)) return true;

    return other.flavorText == flavorText &&
        other.language == language &&
        other.version == version;
  }

  @override
  int get hashCode =>
      flavorText.hashCode ^ language.hashCode ^ version.hashCode;
}
