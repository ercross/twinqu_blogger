part of '../page.dart';

class MenuOptions extends StatelessWidget {
  final String modalTag;
  const MenuOptions({required this.modalTag, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 119,
      width: 243,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              removeModal(modalTag);
              Get.offNamed(Routes.editBlogpost);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(17, 10, 17, 0),
              child: KeyValueWidgetsHorizontal(
                  spaceBetween: true,
                  title: KeyValueWidgetsHorizontal(
                      spaceBetweenAlternative: 18,
                      title: const Icon(
                          CupertinoIcons.pencil_ellipsis_rectangle,
                          color: Color(0xFF282828)),
                      value: Text(editPost,
                          style: Get.textTheme.button!.copyWith(
                              color: const Color(0xFF282828),
                              fontWeight: FontWeight.w500))),
                  value: const Icon(Icons.arrow_forward_ios_rounded, size: 20)),
            ),
          ),
          Divider(
            color: Colors.grey.shade700,
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              removeModal(modalTag);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(17, 0, 17, 10),
              child: KeyValueWidgetsHorizontal(
                  spaceBetween: true,
                  title: KeyValueWidgetsHorizontal(
                      spaceBetweenAlternative: 18,
                      title:
                          const Icon(CupertinoIcons.trash, color: Colors.red),
                      value: Text(deletePost,
                          style: Get.textTheme.button!.copyWith(
                              color: Colors.red, fontWeight: FontWeight.w500))),
                  value: const Icon(Icons.arrow_forward_ios_rounded, size: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
