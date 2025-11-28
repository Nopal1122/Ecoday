class LogModel {
  final int id;
  final String userId;
  final int habitId;
  final String? proofUrl;
  final String status; // 'verified' atau 'pending'
  final int earnedPoints;
  final DateTime createdAt;

  LogModel({
    required this.id,
    required this.userId,
    required this.habitId,
    this.proofUrl,
    required this.status,
    required this.earnedPoints,
    required this.createdAt,
  });

  factory LogModel.fromJson(Map<String, dynamic> json) {
    return LogModel(
      id: json['id'],
      userId: json['user_id'],
      habitId: json['habit_id'],
      proofUrl: json['proof_url'],
      status: json['status'] ?? 'pending',
      earnedPoints: json['earned_points'] ?? 0,
      // Supabase kirim format waktu ISO 8601 string, kita ubah jadi DateTime
      createdAt: DateTime.parse(json['created_at']), 
    );
  }
}