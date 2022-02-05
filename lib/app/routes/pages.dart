import 'package:blogger/app/data/repository/blogpost.dart';
import 'package:blogger/app/data/services/image_service.dart';
import 'package:flutter/animation.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../modules/auth/login/controller.dart';
import '../modules/auth/login/page.dart';
import '../modules/blogpost_details/controller.dart';
import '../modules/blogpost_details/page.dart';
import '../modules/create_blogpost/controller.dart';
import '../modules/create_blogpost/page.dart';
import '../modules/dashboard/home/controller.dart';
import '../modules/dashboard/home/page.dart';
import '../modules/edit_blogpost/controller.dart';
import '../modules/edit_blogpost/page.dart';
import 'routes.dart';

abstract class AppPages {
  static const int _duration = 300;
  static const Curve _curve = Curves.easeIn;

  static final List<GetPage<dynamic>> pages = [
    GetPage(
        name: Routes.login,
        binding: BindingsBuilder.put(() => LoginController()),
        page: () => const LoginPage(),
        curve: _curve,
        transitionDuration: const Duration(milliseconds: _duration),
        transition: Transition.cupertino),
    GetPage(
        name: Routes.home,
        binding: BindingsBuilder.put(
            () => HomepageController(BlogPostRepository(ImageService()))),
        page: () => const Homepage(),
        curve: _curve,
        transitionDuration: const Duration(milliseconds: _duration),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: Routes.blogpostDetails,
        binding: BindingsBuilder.put(
            () => DetailsPageController(BlogPostRepository(ImageService()))),
        page: () => const BlogPostDetailsPage(),
        curve: _curve,
        transitionDuration: const Duration(milliseconds: _duration),
        transition: Transition.leftToRightWithFade),
    GetPage(
        maintainState: false,
        name: Routes.createBlogpost,
        binding: BindingsBuilder.put(
            () => CreateBlogPostController(BlogPostRepository(ImageService()))),
        page: () => const CreateBlogPostPage(),
        curve: _curve,
        transitionDuration: const Duration(milliseconds: _duration),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: Routes.editBlogpost,
        binding: BindingsBuilder.put(
            () => EditBlogPostController(BlogPostRepository(ImageService()))),
        page: () => const EditBlogPostPage(),
        curve: _curve,
        transitionDuration: const Duration(milliseconds: _duration),
        transition: Transition.leftToRightWithFade)
  ];
}
