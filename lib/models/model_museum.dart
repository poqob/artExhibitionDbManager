class Museum {
  late final int? museumId;
  late final String? museumName;
  late final int? countryId;
  late final int? cityId;
  late final int? districtId;
  late final int? aboutId;
  Museum(this.museumId, this.museumName, this.countryId, this.cityId,
      this.districtId, this.aboutId);

  Museum.fromList(List museum) {
    museumId = museum[0];
    museumName = museum[1];
    countryId = museum[2];
    cityId = museum[3];
    districtId = museum[4];
    aboutId = museum[5];
  }
}
