part of '../page.dart';

class AlternativeLoginButtons extends StatelessWidget {
  const AlternativeLoginButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/images/icons/apple.svg",
            height: 40, width: 40),
        const SizedBox(width: 13),
        SvgPicture.asset("assets/images/icons/google.svg",
            height: 40, width: 40),
      ],
    );
  }
}
