class Review {
  int id;
  String username;
  int id_tempatwisata;
  double rating;
  String comment;

  Review(
    this.id,
    this.username,
    this.id_tempatwisata,
    this.rating,
    this.comment,
  );

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      json['id'],
      json['username'].toString(),
      json['id_tempatwisata'],
      json['rating'],
      json['comment'].toString(),
    );
  }
}