class Players {
  String name;
  int current_score = 301;
  int highest_score = 0;
  int avg_score = 0;

  int _total_score = 0;
  int _append_count = 0;

  void appendScore(int score) {
    if (score > highest_score) {
      highest_score = score;
    }
    _total_score += score;
    _append_count += 1;
    avg_score = (_total_score ~/ _append_count).round();
  }

  void resetScore(int mode) {
    current_score = mode;
    highest_score = 0;
    avg_score = 0;
    _total_score = 0;
    _append_count = 0;
  }

  Players(this.name);
}
