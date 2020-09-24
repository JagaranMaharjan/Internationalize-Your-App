class Language{
  final int id;
  final String name;
  final String flag;
  final String languageCode;
  Language({this.id, this.languageCode, this.flag, this.name});

  static List<Language> languageList(){
    return <Language>[
      Language(id: 1, name: 'EN', flag: 'English',languageCode:'en' ),
      Language(id: 1, name: '🇳🇵', flag: 'Nepali',languageCode:'ne' ),
    ];
  }
}