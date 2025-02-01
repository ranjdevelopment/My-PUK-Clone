class CategoryModel {
  final String? id;
  final bool? isStatic;
  final String? name;
  final dynamic icon;
  final String? key;
  final dynamic parentId;
  final int? isDisable;

  CategoryModel({
    this.id,
    this.isStatic,
    this.name,
    this.icon,
    this.key,
    this.parentId,
    this.isDisable,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> data) => CategoryModel(
        id: data["id"],
        isStatic: data["is_static"],
        name: data["name"],
        icon: data["icon"],
        key: data["key"],
        parentId: data["parent_id"],
        isDisable: data["is_disable"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_static": isStatic,
        "name": name,
        "icon": icon,
        "key": key,
        "parent_id": parentId,
        "is_disable": isDisable,
      };
}
