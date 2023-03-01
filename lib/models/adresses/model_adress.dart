//references tempp.newtable

class Adress {
  late final int? countryId;
  late final String? countryName;
  late final int? cityId;
  late final String? cityName;
  late final String? districtName;
  late final int? districtId;
  late final int? adressId;

  Adress(
      [this.countryId,
      this.countryName,
      this.cityId,
      this.cityName,
      this.districtName,
      this.districtId,
      this.adressId]);

  Adress.fromList(List adress) {
    countryId = adress[0];
    countryName = adress[1];
    cityId = adress[2];
    cityName = adress[3];
    districtName = adress[4];
    districtId = adress[5];
    adressId = adress[6];
  }
}
