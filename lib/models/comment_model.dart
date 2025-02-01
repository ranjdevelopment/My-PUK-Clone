import 'package:testing_project/models/owner_model.dart';

class CommentModel {
  final String? id;

  final String? image;
  final String? content;
  final String? name;
  final List<CommentModel>? replies;
  final OwnerModel? owner;

  CommentModel({
    this.id,
    this.image,
    this.content,
    this.name,
    this.replies,
    this.owner,
  });

  factory CommentModel.fromJson(Map<String, dynamic> data) {
    return CommentModel(
      content: data['comments'],
      id: data['id'],
      image: data['image'],
      name: data['full_name'],
      owner: OwnerModel.fromJson(data['owner']),
      replies: data['replies'] == null || data['replies'].isEmpty
          ? null
          : List<CommentModel>.from(
              data['replies'].map((e) => CommentModel.fromJson(e))),
    );
  }
}
