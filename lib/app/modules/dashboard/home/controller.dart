import 'package:blogger/app/data/repository/blogpost.dart';
import 'package:get/instance_manager.dart';

import '../../../data/models/blogpost.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomepageController extends GetxController {
  final BlogPostRepository repo;

  

  HomepageController(this.repo) {
    repo.getStream().listen((event) {
      final posts = event.docs
          .map<BlogPost>((qds) => BlogPost.fromSnapshot(qds))
          .toList();
      _posts.addAll(posts);
    });
  }

  late RxList<BlogPost> _posts = <BlogPost>[].obs;

  RxList<BlogPost> get posts => _posts;
}
