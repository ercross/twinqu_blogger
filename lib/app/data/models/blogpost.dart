import 'package:blogger/app/data/models/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../enums.dart';

class BlogPost extends Equatable {
  final String? id;
  final String title;
  final String body;

  /// intentionally typed String rather than int.
  /// As this is just a test app
  final String likes;

  /// intentionally typed String rather than int.
  /// /// As this is just a test app
  final String comments;
  final DateTime created;
  final String createdBy;
  final String creatorPicsUrl;
  final String imageUrl;
  final BlogCategory category;

  const BlogPost(
      {required this.title,
      required this.body,
      this.id,
      this.likes = "2.2k",
      this.comments = "2.2k",
      required this.created,
      required this.category,
      required this.createdBy,
      required this.creatorPicsUrl,
      required this.imageUrl});

  /// set [id] field from [snapshot]
  factory BlogPost.fromSnapshot(DocumentSnapshot snapshot) {
    BlogPost blogPost =
        BlogPost.fromJson(snapshot.data() as Map<String, dynamic>);
    blogPost = blogPost.copyWith(id: snapshot.reference.id);
    return blogPost;
  }

  /// [copyWith] is just a helper to set [imageUrl] and [id]
  BlogPost copyWith({String? id, String? newImageUrl}) {
    return BlogPost(
        id: id,
        title: title,
        body: body,
        created: created,
        category: category,
        createdBy: createdBy,
        creatorPicsUrl: creatorPicsUrl,
        imageUrl: newImageUrl ?? imageUrl);
  }

  factory BlogPost.fromJson(Map<String, dynamic> json) => BlogPost(
      id: json["id"],
      title: json["title"],
      body: json["body"],
      created: DateTime.parse((json["created"])),
      category: BlogCategory.all,
      createdBy: "John Stones",
      creatorPicsUrl: json["creator_pics"],
      imageUrl: json["image_url"]);

  // 7
  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "created": created.toString(),
        "creator_pics": creatorPicsUrl,
        "image_url": imageUrl
      };

  @override
  List<Object?> get props => [
        title,
        body,
        likes,
        comments,
        created,
        category,
        createdBy,
        creatorPicsUrl,
        imageUrl
      ];
}
