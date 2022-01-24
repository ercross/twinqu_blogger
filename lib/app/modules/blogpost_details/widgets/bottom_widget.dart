part of '../page.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      color: Colors.white,
      height: 96,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 9, bottom: 39),
      child: Container(
        height: 50,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 16, right: 9),
        margin: const EdgeInsets.only(right: 24, left: 24),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(33),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 10,
                  color: Color.fromARGB(19, 123, 123, 123))
            ]),
        child: Row(
          children: [
            Expanded(
                child: Text(
              writeComment,
              style: Get.textTheme.caption!
                  .copyWith(color: const Color(0xFF8A8A8A)),
            )),
            Container(
              padding: const EdgeInsets.all(9),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFF2281E3).withOpacity(0.17),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                "assets/images/icons/send.svg",
              ),
            )
          ],
        ),
      ),
    );
  }
}
