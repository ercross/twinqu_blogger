part of '../page.dart';

class SearchTools extends StatelessWidget {
  const SearchTools({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: KeyValueWidgetsHorizontal(
          spaceBetweenAlternative: 13,
          title: Expanded(
            child: Container(
              height: 44,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 22.3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFEFEFEF)),
              child: KeyValueWidgetsHorizontal(
                title: const Icon(Icons.search),
                spaceBetweenAlternative: 14,
                value: Text(search,
                    style: Get.textTheme.bodyText1!
                        .copyWith(color: const Color(0xFFA8A8A8))),
              ),
            ),
          ),
          value: CurvedButton(
              height: 44,
              width: 44,
              color: kPrimaryColor,
              child: const Icon(
                Icons.settings_input_component_outlined,
                color: Colors.white,
              ),
              onPressed: () {})),
    );
  }
}
