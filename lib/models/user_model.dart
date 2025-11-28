import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String uid;
  final String email;
  final String displayName;
  final String? photoUrl;
  final int totalGlobalPoints; // Poin akumulasi seumur hidup
  final int currentStreak;     // Konsistensi harian
  final List<String> ownedBadges; // ID badges yang dimiliki

  const UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    this.photoUrl,
    this.totalGlobalPoints = 0,
    this.currentStreak = 0,
    this.ownedBadges = const [],
  });

  // Konversi dari Firestore ke Dart Object
  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      uid: id,
      email: map['email'] ?? '',
      displayName: map['displayName'] ?? 'Eco Warrior',
      photoUrl: map['photoUrl'],
      totalGlobalPoints: map['totalGlobalPoints']?.toInt() ?? 0,
      currentStreak: map['currentStreak']?.toInt() ?? 0,
      ownedBadges: List<String>.from(map['ownedBadges'] ?? []),
    );
  }

  // Konversi dari Dart Object ke Firestore
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'totalGlobalPoints': totalGlobalPoints,
      'currentStreak': currentStreak,
      'ownedBadges': ownedBadges,
    };
  }

  // Untuk update state parsial (wajib di BLoC)
  UserModel copyWith({
    String? displayName,
    int? totalGlobalPoints,
    int? currentStreak,
    List<String>? ownedBadges,
  }) {
    return UserModel(
      uid: uid,
      email: email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl,
      totalGlobalPoints: totalGlobalPoints ?? this.totalGlobalPoints,
      currentStreak: currentStreak ?? this.currentStreak,
      ownedBadges: ownedBadges ?? this.ownedBadges,
    );
  }

  @override
  List<Object?> get props => [uid, totalGlobalPoints, currentStreak, ownedBadges];
}