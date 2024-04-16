class User {
  final String id;
  final String username;
  final int matchWon;
  final int matchLost;
  final int rackWon;
  final int rackLost;

  User({
    required this.id,
    required this.username,
    required this.matchWon,
    required this.matchLost,
    required this.rackWon,
    required this.rackLost,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json["_id"] ?? '0',
        username = json["username"],
        matchWon = json["matchWon"],
        matchLost = json["matchLost"],
        rackWon = json['rackWon'],
        rackLost = json['rackLost'];

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'matchWon': matchWon,
      'matchLost': matchLost,
      'rackWon': rackWon,
      'rackLost': rackLost,
    };
  }
}
