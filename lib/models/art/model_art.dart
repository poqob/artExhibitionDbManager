class Art {
  late final int? artId;
  late final String? artName;
  late final String? artType;
  late final int? artArtistId;
  late final int? artMaterialId;
  late final int? artMovementId;
  late final int? artAboutId;

  Art(this.artId, this.artName, this.artType, this.artArtistId,
      this.artMaterialId, this.artMovementId, this.artAboutId);
  // DATE canceled.

  Art.fromList(List art) {
    artId = art[0];
    artName = art[1];
    artType = art[2];
    artArtistId = art[3];
    artMaterialId = art[4];
    artMovementId = art[5];
    artAboutId = art[6];
  }
}
