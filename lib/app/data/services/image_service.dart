import 'dart:io';

import 'package:blogger/app/data/providers/api/api_response.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// [saveImage] saves [file] to FirebaseStorage and returns the
  /// web filepath
  Future<ApiResponse> saveImage(String filename, File file) async {
    try {
      var task = await _storage.ref(filename).putFile(file);

      if (task.bytesTransferred > 0) {
        final url = await task.ref.getDownloadURL();
        return ApiResponse(
            isSuccessful: true,
            data: url,
            msg: "image saved successfully");
      } else {
        return const ApiResponse(
            isSuccessful: false, data: null, msg: "unable to save image");
      }
    } on FirebaseException catch (error) {
      return ApiResponse(
          isSuccessful: false,
          data: null,
          msg: error.message ?? "error",
          errorMsg: error.code);
    } catch (err) {
      return ApiResponse(
          isSuccessful: false,
          data: null,
          msg: err.toString(),
          errorMsg: err.toString());
    }
  }

  Future<ApiResponse> deleteImage(String url) {
    try {
      return _storage
          .refFromURL(url)
          .delete()
          .then((value) => const ApiResponse(
              isSuccessful: true,
              data: null,
              msg: "Image deleted successfully"))
          .onError((error, stackTrace) => ApiResponse(
              isSuccessful: true,
              data: null,
              errorMsg: error.toString(),
              msg: "unable to delete image"));
    } catch (err) {
      return Future.value(ApiResponse(
          isSuccessful: true,
          data: null,
          errorMsg: err.toString(),
          msg: "unable to delete image"));
    }
  }

  /// [updateImage] replace the image found at [url] with [file]
  Future<ApiResponse> updateImage(String url, File file) {
    try {
      return _storage
          .refFromURL(url)
          .writeToFile(file)
          .then((value) => const ApiResponse(
              isSuccessful: true,
              data: null,
              msg: "Image updated successfully"))
          .onError((error, stackTrace) => ApiResponse(
              isSuccessful: true,
              data: null,
              errorMsg: error.toString(),
              msg: "unable to update image"));
    } catch (err) {
      return Future.value(ApiResponse(
          isSuccessful: true,
          data: null,
          errorMsg: err.toString(),
          msg: "unable to update image"));
    }
  }
}
