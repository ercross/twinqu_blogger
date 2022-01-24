part of '../page.dart';

class BreakingNewsCard extends StatelessWidget {
  final BlogPost blogpost;
  const BreakingNewsCard(this.blogpost, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.blogpostDetails, arguments: blogpost),
      child: Container(
        margin: const EdgeInsets.only(left: 18, bottom: 10, top: 5),
        height: 258,
        width: Get.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(19, 130, 130, 130),
                  blurRadius: 8,
                  spreadRadius: 10,
                  blurStyle: BlurStyle.normal)
            ],
            color: CupertinoColors.systemBackground),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                child: CachedNetworkImage(
                  imageUrl: blogpost.imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (_, __) =>
                      Container(
                    padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                    height: 150,
                    width: 150,
                    child: const CircularProgressIndicator.adaptive(
                      strokeWidth: 2,
                    ),
                  ),
                )),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(blogpost.title,
                  style: Get.textTheme.button!
                      .copyWith(color: const Color(0xFF333333))),
            ),
            const SizedBox(height: 12),
            _BottomPart(
                created: blogpost.created,
                creatorImageUrl: blogpost.creatorPicsUrl,
                createdBy: blogpost.createdBy)
          ],
        ),
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  final String creatorImageUrl;
  final String createdBy;
  final DateTime created;
  const _BottomPart(
      {required this.created,
      required this.creatorImageUrl,
      required this.createdBy,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: KeyValueWidgetsHorizontal(
          spaceBetween: true,
          title: KeyValueWidgetsHorizontal(
              title: ProfileAvatar(
                creatorImageUrl,
                radius: 18,
              ),
              value: Text(createdBy, style: Get.textTheme.subtitle1)),
          value: KeyValueWidgetsHorizontal(
            title: const Icon(Icons.today_outlined, size: 18),
            spaceBetweenAlternative: 5,
            value: Text(
                DateTimeFormat.format(
                  created,
                  format: AmericanDateFormats.abbr,
                ),
                style: Get.textTheme.subtitle1),
          ),
        ));
  }
}
