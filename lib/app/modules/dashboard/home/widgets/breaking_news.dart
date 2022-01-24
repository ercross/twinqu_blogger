part of '../page.dart';

class BreakingNews extends GetView<HomepageController> {
  const BreakingNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(() {
            return controller.posts.isEmpty
                ? Column(
                  children: [
                    Image.asset(
                        "assets/images/empty.jpg",
                        fit: BoxFit.contain,
                      ),
                      const Text("In the beginning, there was nothing...")
                  ],
                )
                : Row(
                    children: controller.posts
                        .map<BreakingNewsCard>(
                            (blogpost) => BreakingNewsCard(blogpost))
                        .toList(),
                  );
          }),
        ));
  }
}
