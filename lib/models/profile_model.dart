class ProfileModel {
  final String id; // UUID dari Auth Supabase
  final String? fullName;
  final String? avatarUrl;
  final int totalPoints;
  final int currentStreak;

  ProfileModel({
    required this.id,
    this.fullName,
    this.avatarUrl,
    required this.totalPoints,
    required this.currentStreak,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      fullName: json['full_name'],
      avatarUrl: json['avatar_url'],
      totalPoints: json['total_points'] ?? 0,
      currentStreak: json['current_streak'] ?? 0,
    );
  }
}