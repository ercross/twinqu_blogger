part of '../page.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({Key? key}) : super(key: key);

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return KeyValueWidgetsHorizontal(
        spaceBetweenAlternative: 0,
        title: Checkbox(
            activeColor: kCheckBoxBorderColor,
            checkColor: kPrimaryColor,
            value: _isChecked,
            onChanged: _toggleCheck),
        value: Text(rememberMe, style: Get.textTheme.bodyText1));
  }

  void _toggleCheck(bool? isChecked) {
    setState(() {
      _isChecked = isChecked ?? _isChecked;
    });
  }
}
