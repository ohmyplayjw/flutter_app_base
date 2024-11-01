class TeamScore {
  final String teamName;
  final String playerName;
  final int set1Score;
  final int set2Score;
  final int set3Score;
  final int setScore;

  TeamScore(this.teamName, this.playerName, this.set1Score, this.set2Score,
      this.set3Score, this.setScore);

  TeamScore copyWith({
    String? teamName,
    String? playerName,
    int? set1Score,
    int? set2Score,
    int? set3Score,
    int? setScore,
  }) {
    return TeamScore(
      teamName ?? this.teamName,
      playerName ?? this.playerName,
      set1Score ?? this.set1Score,
      set2Score ?? this.set2Score,
      set3Score ?? this.set3Score,
      setScore ?? this.setScore,
    );
  }
}
