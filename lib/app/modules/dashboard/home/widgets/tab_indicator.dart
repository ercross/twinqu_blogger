part of '../page.dart';

class PageTabIndicator extends StatefulWidget {
  const PageTabIndicator({Key? key}) : super(key: key);

  @override
  State<PageTabIndicator> createState() => _PageTabIndicatorState();
}

class _PageTabIndicatorState extends State<PageTabIndicator>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    

    return TabBar(
      controller:
          TabController(length: BlogCategory.values.length, vsync: this),
      indicatorColor: kPrimaryColor,
      isScrollable: true,
      labelStyle: Get.textTheme.bodyText1!.copyWith(color: kPrimaryColor),
      tabs: BlogCategory.values
          .map<Tab>((category) =>
              Tab(height: 20, text: category.name.toSentenceCase()))
          .toList(),
      labelPadding: kTabLabelPadding.copyWith(top: 8),
      labelColor: kPrimaryColor,
      
      unselectedLabelColor: const Color(0xFF939393),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: MaterialIndicator(
        color: kPrimaryColor,
        horizontalPadding: 6,
        bottomLeftRadius: 5,
        height: 5,
        bottomRightRadius: 5,
        tabPosition: TabPosition.top,
        paintingStyle: PaintingStyle.fill,
      ),
    );
  }
}
