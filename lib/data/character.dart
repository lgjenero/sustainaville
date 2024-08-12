import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:sustainaville/data/representative.dart';
import 'package:sustainaville/utils/strings/similar_string.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class ChararcterDesign with _$ChararcterDesign {
  const factory ChararcterDesign({
    required String body,
    required String hair,
    required String hairColor,
    required String eyes,
    required String clothes,
    String? faceHair,
    String? eyewear,
    String? hat,
  }) = _ChararcterDesign;

  factory ChararcterDesign.fromJson(Map<String, dynamic> json) => _$ChararcterDesignFromJson(json);

  factory ChararcterDesign.random() {
    final random = Random();
    return ChararcterDesign(
      body: _bodyOptions.elementAt(random.nextInt(_bodyOptions.length)),
      hair: _hairOptions.elementAt(random.nextInt(_hairOptions.length)),
      hairColor: _hairColorOptions.elementAt(random.nextInt(_hairColorOptions.length)),
      eyes: _eyesOptions.elementAt(random.nextInt(_eyesOptions.length)),
      clothes: _clothesOptions.elementAt(random.nextInt(_clothesOptions.length)),
      faceHair: random.nextBool() ? _faceHairOptions.elementAt(random.nextInt(_faceHairOptions.length)) : null,
      eyewear: random.nextBool() ? _eyewearOptions.elementAt(random.nextInt(_eyewearOptions.length)) : null,
      hat: random.nextBool() ? _hatOptions.elementAt(random.nextInt(_hatOptions.length)) : null,
    );
  }

  static Schema schema = Schema.object(
    properties: {
      'body': Schema.enumString(enumValues: _bodyOptions.toList(), nullable: false),
      'hair': Schema.enumString(enumValues: _hairOptions.toList(), nullable: false),
      'hairColor': Schema.enumString(enumValues: _hairColorOptions.toList(), nullable: false),
      'eyes': Schema.enumString(enumValues: _eyesOptions.toList(), nullable: false),
      'clothes': Schema.enumString(enumValues: _clothesOptions.toList(), nullable: false),
      'faceHair': Schema.enumString(enumValues: _faceHairOptions.toList(), nullable: true),
      'eyewear': Schema.enumString(enumValues: _eyewearOptions.toList(), nullable: true),
      'hat': Schema.enumString(enumValues: _hatOptions.toList(), nullable: true),
    },
    description: 'Character design',
  );
}

@freezed
class Character with _$Character {
  const factory Character({
    required String id,
    required String name,
    // required String description,
    // required String knowledge,
    // required String motivation,
    // required String location,
    required ChararcterDesign design,
    // bool? isKilled,
    // bool? isKiller,
    // bool? isDetective,
    // String? motive,
    // @Default([]) List<String> clues,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

  factory Character.fromRepresentative(Representative representative) {
    return Character(
      id: representative.id,
      name: representative.name,
      design: representative.design,
    );
  }

  factory Character.random() {
    final random = Random();

    return Character(
      id: 'random_${random.nextInt(1000000)}',
      name: 'Random',
      design: ChararcterDesign.random(),
    );
  }

  static Schema schema = Schema.object(
    properties: {
      'id': Schema.string(description: 'unique id', nullable: false),
      'name': Schema.string(description: 'name of the character', nullable: false),
      'design': ChararcterDesign.schema..nullable = false,
    },
    description: 'Character definition',
  );
}

const _bodyOptions = {
  "cool_brown",
  "orange_pink",
  "warm_brown",
  "off_white",
  "pale_orange",
  "yellow",
  "blue_grey",
  "orange",
  "pink",
};

const _eyesOptions = {
  "eyes_amber",
  "eyes_blue",
  "eyes_brown",
  "eyes_dark",
  "eyes_green",
  "eyes_light_brown",
  "eyes_pale_blue",
};

const _hairOptions = {
  "bangs",
  "bun",
  "bun_with_forelock",
  "buzzcut",
  "choppy",
  "emo",
  "knots",
  "long_straight",
  "long_with_hairpin",
  "mid_with_wisp",
  "pigtails",
  "shaggy",
  "short",
  "short_male",
  "short_straight",
  "short_with_clip",
  "short_with_forelock",
  "short_with_hairpin",
  "short_with_midsplit",
  "short_with_sideburns",
  "short_with_swoop",
  "short_with_wisp",
  "side_bangs_left",
  "side_bangs_right",
  "topknot",
};

const _hairColorOptions = {
  "ginger",
  "blond",
  "light_brown",
  "dark_brown",
  "white",
  "grey",
  "black",
};
const _clothesOptions = {
  "business_suit_blue",
  "business_suit_brown",
  "business_suit_gery",
  "business_suit_green",
  "casual_jacket_blue",
  "casual_jacket_brown",
  "casual_jacket_green",
  "casual_jacket_purple",
  "coat_beige",
  "coat_blue",
  "coat_brown",
  "coat_red",
  "dress_blue",
  "dress_green",
  "dress_white",
  "expensive_suit_blue",
  "expensive_suit_brown",
  "expensive_suit_grey",
  "hoodie_and_pants_blue",
  "hoodie_and_pants_brown",
  "hoodie_and_pants_green",
  "hoodie_and_pants_grey",
  "hoodie_and_pants_red",
  "jacket_and_pants_blue",
  "jacket_and_pants_brown",
  "jacket_and_pants_red",
  "jacket_and_pants_yellow",
  "jersey_blue",
  "onesie_orange",
  "onesie_red",
  "onesie_yellow",
  "overalls_blue",
  "overalls_brown",
  "overalls_green",
  "overalls_purple",
  "robe_black",
  "robe_grey",
  "robe_white",
  "shirt_and_pants_brown",
  "shirt_and_pants_green",
  "shirt_and_pants_grey",
  "shirt_and_pants_purple",
  "shirt_and_skirt_green",
  "shirt_and_skirt_red",
  "shirt_and_skirt_yellow",
  "suit_and_tie_black",
  "suit_and_tie_blue",
  "suit_and_tie_navy",
  "suit_and_tie_purple",
  "suit_black",
  "suit_blue",
  "suit_brown",
  "suit_green",
  "suit_white",
  "sweater_and_pants_blue",
  "sweater_and_pants_brown",
  "sweater_and_pants_purple",
  "sweater_and_pants_red",
  "sweater_and_pants_white",
  "tshirt_and_pants_blue",
  "tshirt_and_pants_brown",
  "tshirt_and_pants_green",
  "tshirt_and_pants_light_blue",
  "tshirt_and_pants_olive_green",
  "tshirt_and_pants_orange",
  "tshirt_and_pants_pink",
  "tshirt_and_pants_purple",
  "tshirt_and_pants_red",
  "tshirt_and_pants_yellow",
};

const _faceHairOptions = {
  "beard_brown",
  "beard_white",
  "beard_blond",
  "beard_ginger",
  "beard_grey",
  "mustache_ginger",
  "mustache_blond",
  "mustache_brown",
  "mustache_grey",
  "mustache_white",
};

const _eyewearOptions = {
  "glasses_black",
  "glasses_blue",
  "glasses_green",
  "glasses_grey",
  "glasses_purple",
  "glasses_red",
  "monocle_brass",
  "monocle_gold",
  "monocle_silver",
};

const _hatOptions = {
  "beanie_blue",
  "beanie_brown",
  "beanie_grey",
  "beanie_pink",
  "beanie_yellow",
  "hat_amber",
  "hat_beige",
  "hat_brown",
  "snapback_cap_blue",
  "snapback_cap_green",
  "snapback_cap_pink",
  "snapback_cap_red",
  "snapback_cap_white",
  "snapback_cap_yellow",
};

extension ChararcterDesignX on ChararcterDesign {
  ChararcterDesign fixed() {
    String fixedBody = body;
    String fixedHair = hair;
    String fixedHairColor = hairColor;
    String fixedEyes = eyes;
    String fixedClothes = clothes;
    String? fixedFaceHair = faceHair;
    String? fixedEyewear = eyewear;
    String? fixedHat = hat;

    if (!_bodyOptions.contains(body)) {
      fixedBody = getMostSimilarString(body, _bodyOptions.toList());
    }
    if (!_hairOptions.contains(hair)) {
      fixedHair = getMostSimilarString(hair, _hairOptions.toList());
    }
    if (!_hairColorOptions.contains(hairColor)) {
      fixedHairColor = getMostSimilarString(hairColor, _hairColorOptions.toList());
    }
    if (!_eyesOptions.contains(eyes)) {
      fixedEyes = getMostSimilarString(eyes, _eyesOptions.toList());
    }
    if (!_clothesOptions.contains(clothes)) {
      fixedClothes = getMostSimilarString(clothes, _clothesOptions.toList());
    }
    if (faceHair != null && !_faceHairOptions.contains(faceHair!)) {
      fixedFaceHair = getMostSimilarString(faceHair!, _faceHairOptions.toList());
    }
    if (eyewear != null && !_eyewearOptions.contains(eyewear!)) {
      fixedEyewear = getMostSimilarString(eyewear!, _eyewearOptions.toList());
    }
    if (hat != null && !_hatOptions.contains(hat!)) {
      fixedHat = getMostSimilarString(hat!, _hatOptions.toList());
    }

    return ChararcterDesign(
      body: fixedBody,
      hair: fixedHair,
      hairColor: fixedHairColor,
      eyes: fixedEyes,
      clothes: fixedClothes,
      faceHair: fixedFaceHair,
      eyewear: fixedEyewear,
      hat: fixedHat,
    );
  }
}
