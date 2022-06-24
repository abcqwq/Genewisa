class TempatWisata {
  int id;
  String name;
  String city;
  String pictureUrl;
  int price;
  int rating;
  String description;

  TempatWisata (
    this.id,
    this.name,
    this.city,
    this.pictureUrl,
    this.price,
    this.rating,
    this.description,
  );

  factory TempatWisata.fromJson(Map<String, dynamic> json) {
    return TempatWisata(
      json['id'],
      json['name'].toString(),
      json['city'].toString(),
      json['pictureUrl'].toString(),
      json['price'],
      json['rating'],
      json['description'].toString(),
    );
  }

}