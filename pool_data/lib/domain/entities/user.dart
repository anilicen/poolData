class User {
  final String id;
  final String username;
  final int matchCount;
  final int matchWon;
  final int matchLost;
  User({
    required this.id,
    required this.username,
    required this.matchCount,
    required this.matchWon,
    required this.matchLost,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      username: json["username"],
      matchCount: json["matchCount"],
      matchWon: json["matchWon"],
      matchLost: json["matchLost"],
    );
  }
}
