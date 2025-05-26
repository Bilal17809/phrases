// class PhrasesCategoryModel {
//   final int? id;
//   final String? Afrikaans;
//   final String? Albanian;
//
//   PhrasesCategoryModel({
//     this.id,
//     this.Afrikaans,
//     this.Albanian,
//   });
//
//   factory PhrasesCategoryModel.fromMap(Map<String, dynamic> map) {
//     return PhrasesCategoryModel(
//       id: map['id'] as int?,
//       Afrikaans: map['Afrikaans'] as String?,
//       Albanian: map['Albanian'] as String?,
//
//     );
//   }
//   Map<String, dynamic> toMap() {
//     return {
//       'id':id,
//       'Afrikaans': Afrikaans,
//       'Albanian': Albanian,
//     };
//   }
//
// }

class PhrasesCategoryModel {
  final int? id;
  final String? Afrikaans;
  final String? Albanian;
  final String? Amharic;
  final String? Arabic;
  final String? Armenian;
  final String? Azeerbaijani;
  final String? Basque;
  final String? Belarusian;
  final String? Bengali;
  final String? Bosnian;
  final String? Bulgarian;
  final String? Catalan;
  final String? Cebuano;
  final String? ChineseSimplified;
  final String? ChineseTraditional;
  final String? Croatian;
  final String? Czech;
  final String? Danish;
  final String? Dutch;
  final String? English;
  final String? Esperanto;
  final String? Estonian;
  final String? Finnish;
  final String? French;
  final String? Frisian;
  final String? Galician;
  final String? Georgian;
  final String? German;
  final String? Greek;
  final String? Gujarati;
  final String? Haitian;
  final String? Hausa;
  final String? Hawaiian;
  final String? Hebrew;
  final String? Hindi;
  final String? Hmong;
  final String? Hungarian;
  final String? Icelandic;
  final String? Igbo;
  final String? Indonesian;
  final String? Irish;
  final String? Italian;
  final String? Japanese;
  final String? Javanese;
  final String? Kannada;
  final String? Kazakh;
  final String? Khmer;
  final String? KoreanNK;
  final String? KoreanSK;
  final String? Kurdish;
  final String? Kyrgyz;
  final String? Lao;
  final String? Latin;
  final String? Latvian;
  final String? Lithuanian;
  final String? Luxembourgish;
  final String? Macedonian;
  final String? Malagasy;
  final String? Malay;
  final String? Malayalam;
  final String? Maltese;
  final String? Maori;
  final String? Marathi;
  final String? Mongolian;
  final String? MyanmarBurmese;
  final String? Nepali;
  final String? Norwegian;
  final String? NyanjaChichewa;
  final String? Pashto;
  final String? Persian;
  final String? Polish;
  final String? Portuguese;
  final String? Punjabi;
  final String? Romanian;
  final String? Russian;
  final String? Samoan;
  final String? ScotsGaelic;
  final String? Serbian;
  final String? Sesotho;
  final String? Shona;
  final String? Sindhi;
  final String? Sinhala;
  final String? Slovak;
  final String? Slovenian;
  final String? Somali;
  final String? Spanish;
  final String? Sundanese;
  final String? Swahili;
  final String? Swedish;
  final String? Tagalog;
  final String? Tajik;
  final String? Tamil;
  final String? Telugu;
  final String? Thai;
  final String? Turkish;
  final String? Ukrainian;
  final String? Urdu;
  final String? Uzbek;
  final String? Vietnamese;
  final String? Welsh;
  final String? Xhosa;
  final String? Yiddish;
  final String? Yoruba;
  final String? Zulu;

  PhrasesCategoryModel({
    this.id,
    this.Afrikaans,
    this.Albanian,
    this.Amharic,
    this.Arabic,
    this.Armenian,
    this.Azeerbaijani,
    this.Basque,
    this.Belarusian,
    this.Bengali,
    this.Bosnian,
    this.Bulgarian,
    this.Catalan,
    this.Cebuano,
    this.ChineseSimplified,
    this.ChineseTraditional,
    this.Croatian,
    this.Czech,
    this.Danish,
    this.Dutch,
    this.English,
    this.Esperanto,
    this.Estonian,
    this.Finnish,
    this.French,
    this.Frisian,
    this.Galician,
    this.Georgian,
    this.German,
    this.Greek,
    this.Gujarati,
    this.Haitian,
    this.Hausa,
    this.Hawaiian,
    this.Hebrew,
    this.Hindi,
    this.Hmong,
    this.Hungarian,
    this.Icelandic,
    this.Igbo,
    this.Indonesian,
    this.Irish,
    this.Italian,
    this.Japanese,
    this.Javanese,
    this.Kannada,
    this.Kazakh,
    this.Khmer,
    this.KoreanNK,
    this.KoreanSK,
    this.Kurdish,
    this.Kyrgyz,
    this.Lao,
    this.Latin,
    this.Latvian,
    this.Lithuanian,
    this.Luxembourgish,
    this.Macedonian,
    this.Malagasy,
    this.Malay,
    this.Malayalam,
    this.Maltese,
    this.Maori,
    this.Marathi,
    this.Mongolian,
    this.MyanmarBurmese,
    this.Nepali,
    this.Norwegian,
    this.NyanjaChichewa,
    this.Pashto,
    this.Persian,
    this.Polish,
    this.Portuguese,
    this.Punjabi,
    this.Romanian,
    this.Russian,
    this.Samoan,
    this.ScotsGaelic,
    this.Serbian,
    this.Sesotho,
    this.Shona,
    this.Sindhi,
    this.Sinhala,
    this.Slovak,
    this.Slovenian,
    this.Somali,
    this.Spanish,
    this.Sundanese,
    this.Swahili,
    this.Swedish,
    this.Tagalog,
    this.Tajik,
    this.Tamil,
    this.Telugu,
    this.Thai,
    this.Turkish,
    this.Ukrainian,
    this.Urdu,
    this.Uzbek,
    this.Vietnamese,
    this.Welsh,
    this.Xhosa,
    this.Yiddish,
    this.Yoruba,
    this.Zulu,
  });

  factory PhrasesCategoryModel.fromMap(Map<String, dynamic> map) {
    return PhrasesCategoryModel(
      id: map['id'] as int?,
      Afrikaans: map['Afrikaans'] as String?,
      Albanian: map['Albanian'] as String?,
      Amharic: map['Amharic'] as String?,
      Arabic: map['Arabic'] as String?,
      Armenian: map['Armenian'] as String?,
      Azeerbaijani: map['Azeerbaijani'] as String?,
      Basque: map['Basque'] as String?,
      Belarusian: map['Belarusian'] as String?,
      Bengali: map['Bengali'] as String?,
      Bosnian: map['Bosnian'] as String?,
      Bulgarian: map['Bulgarian'] as String?,
      Catalan: map['Catalan'] as String?,
      Cebuano: map['Cebuano'] as String?,
      ChineseSimplified: map['ChineseSimplified'] as String?,
      ChineseTraditional: map['ChineseTraditional'] as String?,
      Croatian: map['Croatian'] as String?,
      Czech: map['Czech'] as String?,
      Danish: map['Danish'] as String?,
      Dutch: map['Dutch'] as String?,
      English: map['English'] as String?,
      Esperanto: map['Esperanto'] as String?,
      Estonian: map['Estonian'] as String?,
      Finnish: map['Finnish'] as String?,
      French: map['French'] as String?,
      Frisian: map['Frisian'] as String?,
      Galician: map['Galician'] as String?,
      Georgian: map['Georgian'] as String?,
      German: map['German'] as String?,
      Greek: map['Greek'] as String?,
      Gujarati: map['Gujarati'] as String?,
      Haitian: map['Haitian'] as String?,
      Hausa: map['Hausa'] as String?,
      Hawaiian: map['Hawaiian'] as String?,
      Hebrew: map['Hebrew'] as String?,
      Hindi: map['Hindi'] as String?,
      Hmong: map['Hmong'] as String?,
      Hungarian: map['Hungarian'] as String?,
      Icelandic: map['Icelandic'] as String?,
      Igbo: map['Igbo'] as String?,
      Indonesian: map['Indonesian'] as String?,
      Irish: map['Irish'] as String?,
      Italian: map['Italian'] as String?,
      Japanese: map['Japanese'] as String?,
      Javanese: map['Javanese'] as String?,
      Kannada: map['Kannada'] as String?,
      Kazakh: map['Kazakh'] as String?,
      Khmer: map['Khmer'] as String?,
      KoreanNK: map['KoreanNK'] as String?,
      KoreanSK: map['KoreanSK'] as String?,
      Kurdish: map['Kurdish'] as String?,
      Kyrgyz: map['Kyrgyz'] as String?,
      Lao: map['Lao'] as String?,
      Latin: map['Latin'] as String?,
      Latvian: map['Latvian'] as String?,
      Lithuanian: map['Lithuanian'] as String?,
      Luxembourgish: map['Luxembourgish'] as String?,
      Macedonian: map['Macedonian'] as String?,
      Malagasy: map['Malagasy'] as String?,
      Malay: map['Malay'] as String?,
      Malayalam: map['Malayalam'] as String?,
      Maltese: map['Maltese'] as String?,
      Maori: map['Maori'] as String?,
      Marathi: map['Marathi'] as String?,
      Mongolian: map['Mongolian'] as String?,
      MyanmarBurmese: map['MyanmarBurmese'] as String?,
      Nepali: map['Nepali'] as String?,
      Norwegian: map['Norwegian'] as String?,
      NyanjaChichewa: map['NyanjaChichewa'] as String?,
      Pashto: map['Pashto'] as String?,
      Persian: map['Persian'] as String?,
      Polish: map['Polish'] as String?,
      Portuguese: map['Portuguese'] as String?,
      Punjabi: map['Punjabi'] as String?,
      Romanian: map['Romanian'] as String?,
      Russian: map['Russian'] as String?,
      Samoan: map['Samoan'] as String?,
      ScotsGaelic: map['ScotsGaelic'] as String?,
      Serbian: map['Serbian'] as String?,
      Sesotho: map['Sesotho'] as String?,
      Shona: map['Shona'] as String?,
      Sindhi: map['Sindhi'] as String?,
      Sinhala: map['Sinhala'] as String?,
      Slovak: map['Slovak'] as String?,
      Slovenian: map['Slovenian'] as String?,
      Somali: map['Somali'] as String?,
      Spanish: map['Spanish'] as String?,
      Sundanese: map['Sundanese'] as String?,
      Swahili: map['Swahili'] as String?,
      Swedish: map['Swedish'] as String?,
      Tagalog: map['Tagalog'] as String?,
      Tajik: map['Tajik'] as String?,
      Tamil: map['Tamil'] as String?,
      Telugu: map['Telugu'] as String?,
      Thai: map['Thai'] as String?,
      Turkish: map['Turkish'] as String?,
      Ukrainian: map['Ukrainian'] as String?,
      Urdu: map['Urdu'] as String?,
      Uzbek: map['Uzbek'] as String?,
      Vietnamese: map['Vietnamese'] as String?,
      Welsh: map['Welsh'] as String?,
      Xhosa: map['Xhosa'] as String?,
      Yiddish: map['Yiddish'] as String?,
      Yoruba: map['Yoruba'] as String?,
      Zulu: map['Zulu'] as String?,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'Afrikaans': Afrikaans,
      'Albanian': Albanian,
      'Amharic': Amharic,
      'Arabic': Arabic,
      'Armenian': Armenian,
      'Azeerbaijani': Azeerbaijani,
      'Basque': Basque,
      'Belarusian': Belarusian,
      'Bengali': Bengali,
      'Bosnian': Bosnian,
      'Bulgarian': Bulgarian,
      'Catalan': Catalan,
      'Cebuano': Cebuano,
      'ChineseSimplified': ChineseSimplified,
      'ChineseTraditional': ChineseTraditional,
      'Croatian': Croatian,
      'Czech': Czech,
      'Danish': Danish,
      'Dutch': Dutch,
      'English': English,
      'Esperanto': Esperanto,
      'Estonian': Estonian,
      'Finnish': Finnish,
      'French': French,
      'Frisian': Frisian,
      'Galician': Galician,
      'Georgian': Georgian,
      'German': German,
      'Greek': Greek,
      'Gujarati': Gujarati,
      'Haitian': Haitian,
      'Hausa': Hausa,
      'Hawaiian': Hawaiian,
      'Hebrew': Hebrew,
      'Hindi': Hindi,
      'Hmong': Hmong,
      'Hungarian': Hungarian,
      'Icelandic': Icelandic,
      'Igbo': Igbo,
      'Indonesian': Indonesian,
      'Irish': Irish,
      'Italian': Italian,
      'Japanese': Japanese,
      'Javanese': Javanese,
      'Kannada': Kannada,
      'Kazakh': Kazakh,
      'Khmer': Khmer,
      'KoreanNK': KoreanNK,
      'KoreanSK': KoreanSK,
      'Kurdish': Kurdish,
      'Kyrgyz': Kyrgyz,
      'Lao': Lao,
      'Latin': Latin,
      'Latvian': Latvian,
      'Lithuanian': Lithuanian,
      'Luxembourgish': Luxembourgish,
      'Macedonian': Macedonian,
      'Malagasy': Malagasy,
      'Malay': Malay,
      'Malayalam': Malayalam,
      'Maltese': Maltese,
      'Maori': Maori,
      'Marathi': Marathi,
      'Mongolian': Mongolian,
      'MyanmarBurmese': MyanmarBurmese,
      'Nepali': Nepali,
      'Norwegian': Norwegian,
      'NyanjaChichewa': NyanjaChichewa,
      'Pashto': Pashto,
      'Persian': Persian,
      'Polish': Polish,
      'Portuguese': Portuguese,
      'Punjabi': Punjabi,
      'Romanian': Romanian,
      'Russian': Russian,
      'Samoan': Samoan,
      'ScotsGaelic': ScotsGaelic,
      'Serbian': Serbian,
      'Sesotho': Sesotho,
      'Shona': Shona,
      'Sindhi': Sindhi,
      'Sinhala': Sinhala,
      'Slovak': Slovak,
      'Slovenian': Slovenian,
      'Somali': Somali,
      'Spanish': Spanish,
      'Sundanese': Sundanese,
      'Swahili': Swahili,
      'Swedish': Swedish,
      'Tagalog': Tagalog,
      'Tajik': Tajik,
      'Tamil': Tamil,
      'Telugu': Telugu,
      'Thai': Thai,
      'Turkish': Turkish,
      'Ukrainian': Ukrainian,
      'Urdu': Urdu,
      'Uzbek': Uzbek,
      'Vietnamese': Vietnamese,
      'Welsh': Welsh,
      'Xhosa': Xhosa,
      'Yiddish': Yiddish,
      'Yoruba': Yoruba,
      'Zulu': Zulu,
    };
  }

}



class Phrases {
  final int? categoryID;
  final String? english;
  final String? urdu;
  final String? arabic;

  // Constructor
  Phrases({
    this.categoryID,
    this.english,
    this.urdu,
    this.arabic
  });

  // Factory method to create an instance from a map
  factory Phrases.fromMap(Map<String, dynamic> map) {
    return Phrases(
      categoryID: map['category_id'] as int?, // Corrected variable name
      english: map['English'] as String?,
      urdu: map['Urdu'] as String?,
      arabic: map['Arabic']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category_id':categoryID,
      'English': english,
      'Urdu': urdu,
      'Arabic':arabic
    };
  }
}
