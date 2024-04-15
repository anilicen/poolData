import 'package:pool_data/domain/entities/user.dart';

class Match {
  final String id;
  final User player1;
  final User player2;
  final int player1Score;
  final int player2Score;
  final int raceTo;

  Match({
    required this.id,
    required this.player1,
    required this.player2,
    required this.player1Score,
    required this.player2Score,
    required this.raceTo,
  });

  Match.fromJson(Map<String, dynamic> json)
      : id = json["_id"],
        player1 = User.fromJson(json["player1"]),
        player2 = User.fromJson(json["player2"]),
        player1Score = json["player1Score"],
        player2Score = json["player2Score"],
        raceTo = json["raceTo"];

  Map<String, dynamic> toJson() {
    return {
      'player1': player1.toJson(),
      'player2': player2.toJson(),
      'player1Score': player1Score,
      'player2Score': player2Score,
      'raceTo': raceTo,
    };
  }

  Match copyWith({
    String? id,
    User? player1,
    User? player2,
    int? player1Score,
    int? player2Score,
    int? raceTo,
  }) {
    return Match(
      id: id ?? this.id,
      player1: player1 ?? this.player1,
      player2: player2 ?? this.player2,
      player1Score: player1Score ?? this.player1Score,
      player2Score: player2Score ?? this.player2Score,
      raceTo: raceTo ?? this.raceTo,
    );
  }
}
