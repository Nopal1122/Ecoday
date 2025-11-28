class HabitModel {
  final int id; // Di SQL pakai angka (bigint), bukan String unik
  final String title;
  final String category;
  final int defaultPoints;
  final String? iconPath;
  final String validationType; // 'photo', 'gps', 'none'

  HabitModel({
    required this.id,
    required this.title,
    required this.category,
    required this.defaultPoints,
    this.iconPath,
    required this.validationType,
  });

  // Fungsi "Penerjemah" dari Supabase ke Flutter
  factory HabitModel.fromJson(Map<String, dynamic> json) {
    return HabitModel(
      id: json['id'], 
      title: json['title'] ?? 'No Title',
      category: json['category'] ?? 'General',
      // Perhatikan: di JSON namanya 'default_points', di sini jadi 'defaultPoints'
      defaultPoints: json['default_points'] ?? 0, 
      iconPath: json['icon_path'],
      validationType: json['validation_type'] ?? 'none',
    );
  }
}