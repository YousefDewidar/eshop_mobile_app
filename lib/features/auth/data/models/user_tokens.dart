class UserTokens {
  final String? accessToken;
  final String? refreshToken;

  UserTokens({required this.accessToken, required this.refreshToken});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory UserTokens.fromJson(Map<String, dynamic> map) {
    return UserTokens(
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }
}
