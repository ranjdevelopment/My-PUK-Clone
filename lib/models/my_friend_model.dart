class MyFriendModel {
  final String? id;
  final String? name;
  final String? bio;
  final String? image;
  final String? gender;
  final DateTime? birth;
  final bool? isSelect;

  MyFriendModel({
    this.id,
    this.name,
    this.bio,
    this.image,
    this.gender,
    this.birth,
    required this.isSelect,
  });

  factory MyFriendModel.fromJson(Map<String, dynamic> data) {
    return MyFriendModel(
      id: data['id'],
      name: data['full_name'],
      image: data['image'],
      bio: data['bio'],
      gender: data['gender'],
      birth: data['birth'] == null || data['birth'].isEmpty
          ? null
          : DateTime.parse(data['birth']),
      isSelect: false,
    );
  }
}
