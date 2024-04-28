class MySongModel {
  int? id;
  String? title;
  String? artist;
  String? album;
  String? albumArt;
  String? data;

  MySongModel({
    this.id,
    this.title,
    this.artist,
    this.album,
    this.albumArt,
    this.data,
  });

  MySongModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        artist = json["artist"],
        album = json["album"],
        albumArt = json["albumArt"],
        data = json["data"];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "artist": artist,
      "album": album,
      "albumArt": albumArt,
      "data": data,
    };
  }
}