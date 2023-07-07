class Language {
  final String flag;
  final String name;
  final String dilKodu;

  Language(this.flag, this.name, this.dilKodu);

  static List<Language> languageList() {
    return <Language>[
      Language("🇬🇧", "English", "en"),
      Language("🇹🇷", "Türkçe", "tr"),
    ];
  }
}
