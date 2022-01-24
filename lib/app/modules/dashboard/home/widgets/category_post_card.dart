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
                child: CachedNetworkImage(
                    imageUrl: blogpost.imageUrl,
                    placeholder: (_, __) => Container(
                          padding: const EdgeInsets.all(8),
                          height: 50,
                          width: 50,
                          child: const CircularProgressIndicator.adaptive(
                            strokeWidth: 2,
                          ),
                        ),
                    height: 70,
                    width: 77,
                    fit: BoxFit.cover)),
            spaceBetweenAlternative: 10,
            value: Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(blogpost.title,
                      style: Get.textTheme.caption!
                          .copyWith(fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: BlogPostMetaData(
                    comments: blogpost.comments,
                    created: blogpost.created,
                    likes: blogpost.likes,
                  ),
                )
              ],
            ))),
      ),
    );
  }
}
