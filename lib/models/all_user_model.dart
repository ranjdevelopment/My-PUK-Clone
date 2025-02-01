class AllUserModel {
  final String? id;
  final String? fullName;
  final String? image;
  final String? bio;
  final String? gender;
  final DateTime? birth;
  final DateTime? addedAt;

  AllUserModel({
    this.id,
    this.fullName,
    this.image,
    this.bio,
    this.gender,
    this.birth,
    this.addedAt,
  });

  factory AllUserModel.fromJson(Map<String, dynamic> data) => AllUserModel(
        id: data["id"],
        fullName: data["full_name"],
        image: data["image"],
        bio: data["bio"],
        gender: data["gender"],
        birth: data["birth"] == null ? null : DateTime.parse(data["birth"]),
        addedAt:
            data["added_at"] == null ? null : DateTime.parse(data["added_at"]),
      );
}
