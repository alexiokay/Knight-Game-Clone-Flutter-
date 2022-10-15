class Country {
  String countryName;
  String flagImage;

  Country({
    required this.countryName,
    required this.flagImage,
  });
}

final PL =
    Country(countryName: 'poland', flagImage: 'assets/images/flags/pl.png');

final DE =
    Country(countryName: 'germany', flagImage: 'assets/images/flags/de.png');
final RU =
    Country(countryName: 'russia', flagImage: 'assets/images/flags/ru.png');

List<Country> countries = [PL, DE, RU];
