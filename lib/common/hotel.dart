class HotelData {
  final String id;
  final String name;
  final String description;
  final DateTime createdAt;
  final List<Map<String, dynamic>> comments;
  final List<String> images;
  final int stars;

  HotelData({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.comments,
    required this.images,
    required this.stars,
  });

  factory HotelData.fromMap(Map<String, dynamic> data) {
    return HotelData(
      id: data["id"],
      name: data["name"],
      description: data["description"],
      createdAt: DateTime.fromMillisecondsSinceEpoch(data["created_at"]),
      comments: data["comments"],
      images: data["images"],
      stars: data["stars"],
    );
  }
}
