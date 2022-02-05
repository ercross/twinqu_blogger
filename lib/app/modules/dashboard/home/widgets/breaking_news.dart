part of '../page.dart';

class BreakingNews extends GetView<HomepageController> {
  const BreakingNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: GetBuilder<HomepageController>(builder: (_)  {
        return controller.posts.isEmpty
            ? Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/empty.jpg",
                      height: 210,
                      width: Get.width * 0.7,
                      fit: BoxFit.contain,
                    ),
                    Text("In the beginning, there was nothing...",
                        style: Get.textTheme.bodyText1),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: controller.posts
                      .map<BreakingNewsCard>(
                          (blogpost) => BreakingNewsCard(blogpost))
                      .toList(),
                ));
      }),
    );
  }
}
