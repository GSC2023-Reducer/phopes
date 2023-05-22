class Destination {
  final String id;
  final String country;
  final String city;
  final DateTime photo;

  const Destination({
    required this.id,
    required this.country,
    required this.city,
    required this.photo,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "country": country,
        "city": city,
        "photo": photo,
      };
}
