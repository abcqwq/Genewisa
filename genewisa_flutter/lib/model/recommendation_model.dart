class Recommendation {
  int budgetStart;
  int budgetEnd;
  String key;

  Recommendation(this.budgetStart, this.budgetEnd, this.key);

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(json['budgetStart'], json['budgetEnd'], json['key']);
  }

  Map<String, dynamic> toJson() => {
        'budgetStart': budgetStart,
        'budgetEnd': budgetEnd,
        'key': key,
      };
}
