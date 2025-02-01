class OwnerModel {
  final String? id;
  final String? fullName;
  final String? image;
  final String? bio;
  final String? gender;
  final DateTime? birth;

  OwnerModel({
    this.id,
    this.fullName,
    this.image,
    this.bio,
    this.gender,
    this.birth,
  });

  factory OwnerModel.fromJson(Map<String, dynamic> data) {
    return OwnerModel(
      id: data['id'],
      bio: data['bio'],
      fullName: data['full_name'],
      gender: data['gensder'],
      image:
          data['image'] == null || data['image'].isEmpty ? null : data['image'],
      birth: data['birth'] == null ? null : DateTime.parse(data['birth']),
    );
  }
}
