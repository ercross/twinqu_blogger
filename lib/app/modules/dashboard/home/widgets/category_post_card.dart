part of "../page.dart";

class CategoryPostCard extends StatelessWidget {
  final BlogPost blogpost;
  const CategoryPostCard(this.blogpost, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.blogpostDetails, arguments: blogpost),
      child: Container(
        height: 70,
        margin: const EdgeInsets.only(bottom: 25, right: 24),
        padding: const EdgeInsets.only(right: 16, left: 24),
        child: KeyValueWidgetsHorizontal(
            title: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  blogpost.imageUrl,
                  height: 70,
                  width: 77,
                )),
            spaceBetweenAlternative: 10,
            value: Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(blogpost.title,
                    style: Get.textTheme.caption!
                        .copyWith(fontWeight: FontWeight.w600)),
                BlogPostMetaData(
                  comments: blogpost.comments,
                  created: blogpost.created,
                  likes: blogpost.likes,
                )
              ],
            ))),
      ),
    );
  }
}
