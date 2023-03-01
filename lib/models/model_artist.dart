class Artist {
  late final int? artistId;
  late final String? artistName;
  late final int? artistMovementId;
  late final int? artistAboutId;
  late final int? artistCountryId;
  late final int? artistCityId;
  Artist(this.artistId, this.artistName, this.artistMovementId,
      this.artistAboutId, this.artistCountryId, this.artistCityId);

  Artist.fromList(List artist) {
    artistId = artist[0];
    artistName = artist[1];
    artistMovementId = artist[2];
    artistAboutId = artist[3];
    artistCountryId = artist[4];
    artistCityId = artist[5];
  }
}
