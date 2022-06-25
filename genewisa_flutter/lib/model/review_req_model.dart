class ReviewRequest {
  String username;
  int id_tempatwisata;
  double rating;
  String comment;

  ReviewRequest(
    this.username,
    this.id_tempatwisata,
    this.rating,
    this.comment,
  );

  Map<String, dynamic> toJson() => {
    'username': username,
    'id_tempatwisata': id_tempatwisata,
    'rating': rating,
    'comment': comment,
  };
}