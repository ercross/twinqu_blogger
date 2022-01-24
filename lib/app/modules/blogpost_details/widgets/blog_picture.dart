part of '../page.dart';

class BlogPicture extends StatelessWidget {
  final String imageUrl;
  const BlogPicture(this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 19,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 195,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, color: kPrimaryColor),
                loadingBuilder: (context, child, loadingProgress) => Column(
                  children: [
                    const SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator.adaptive(
                          strokeWidth: 2,
                        )),
                    Text("Loading image...", style: Get.textTheme.subtitle1)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 28,
            bottom: 0,
            height: 38,
            width: 38,
            child: FloatingActionButton.small(
                elevation: 0,
                backgroundColor: const Color(0xFFF3F3F3),
                child: const Icon(
                  Icons.bookmark,
                  size: 20,
                  color: Color(0xFF8F8F8F),
                ),
                onPressed: () {}),
          )
        ],
      ),
    );
  }
}
