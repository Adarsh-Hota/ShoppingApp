import 'dart:convert';


class RatingModal {
  final String userId;
  final double rating;

  RatingModal({
    required this.userId,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'rating': rating,
    };
  }

  factory RatingModal.fromMap(Map<String, dynamic> map) {
    return RatingModal(
      userId: map['userId'] ?? '',
      rating: map['rating'].toDouble() ?? 0.0,
    );
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory RatingModal.fromJson(String source) {
    return RatingModal.fromMap(json.decode(source));
  }
}
