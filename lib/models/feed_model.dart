import 'package:testing_project/models/category_model.dart';
import 'package:testing_project/models/comment_model.dart';
import 'package:testing_project/models/owner_model.dart';

class FeedModel {
  final String? id;
  final String? content;
  final List<CommentModel>? totalComments;
  final String? share;
  final OwnerModel? owner;
  final CategoryModel? category;

  FeedModel({
    this.id,
    this.content,
    this.totalComments,
    this.share,
    this.owner,
    this.category,
  });

  factory FeedModel.fromJson(Map<String, dynamic> data) {
    return FeedModel(
      id: data['id'],
      content: data['content'] == null || data['content'].isEmpty
          ? null
          : data['content'],
      totalComments: data['comments'] == null || data['comments'].isEmpty
          ? null
          : List<CommentModel>.from(
              data['comments'].map((e) => CommentModel.fromJson(e))),
      owner: data['owner'] == null || data['owner'].isEmpty
          ? null
          : OwnerModel.fromJson(data['owner']),
      share: data['total_share'],
      category: CategoryModel.fromJson(data['category']),
    );
  }
}
