import 'dart:io';

import 'package:blogger/app/data/models/blogpost.dart';
import 'package:blogger/app/data/providers/api/api_response.dart';
import 'package:blogger/app/data/services/image_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BlogPostRepository {
  final ImageService imageService;
  BlogPostRepository(this.imageService);

  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('blogposts');

  Stream<QuerySnapshot> getStream() {
    
    return _collection.snapshots();
  }

  /// [createPost] creates a new [BlogPost] into the repository.
  /// Image is the [File] object representing blogPost image.
  /// As at this stage, [blogPost.imageUrl] may be the image filename
  /// [blogPost.imageUrl] and [imageFile] must not be null.
  /// The returned ApiResponse contains the newly created post,
  /// fresh from the oven.
  Future<ApiResponse> createPost(BlogPost blogPost, File imageFile) async {
    final response = await imageService.saveImage(blogPost.imageUrl, imageFile);
    if (response.isSuccessful) {
      try {
        return _collection.add(blogPost.toJson()).then((docRef) async {
          final snapshot = await docRef.get();
          docRef.update({"image_url": response.data});
          return ApiResponse(
              isSuccessful: true,
              data: BlogPost.fromSnapshot(snapshot)
                  .copyWith(newImageUrl: response.data),
              msg: "your post has been saved in the Nigerian Treasury");
        }).onError((error, stackTrace) => ApiResponse(
            isSuccessful: false,
            data: null,
            msg: "unable to save post",
            errorMsg: error.toString()));
      } catch (e) {
        return ApiResponse(
            isSuccessful: false,
            data: null,
            msg: "unable to save post",
            errorMsg: e.toString());
      }
    } else {
      return const ApiResponse(
          isSuccessful: false, data: null, msg: "unable to save post");
    }
  }

  Future updatePost(Map<String, dynamic> inputs, String id) async {
    return await _collection.doc(id).update(inputs);
  }

  Future<void> deletePostByID(String? id) async {
    await _collection.doc(id).delete();
  }
}
