class ModelProfile {
  final String id;
  final String fullname;
  final String email;
  final String? avatar;

  ModelProfile(
    {
      required this.id,
      required this.fullname,
      required this.email,
      this.avatar,
    }
  );
}