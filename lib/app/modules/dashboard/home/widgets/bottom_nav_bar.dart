part of '../page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: const [
        Icons.home_filled,
        CupertinoIcons.search,
        Icons.bookmark,
        CupertinoIcons.person_solid
      ],
      
      activeIndex: _activeIndex,
      gapLocation: GapLocation.center,
      height: 100,
      notchSmoothness: NotchSmoothness.sharpEdge,
      notchMargin: 8,

      onTap: (index) => setState(() => _activeIndex = index),
      activeColor: kPrimaryColor,
      elevation: 16,
    );
  }
}
