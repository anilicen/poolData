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
}
