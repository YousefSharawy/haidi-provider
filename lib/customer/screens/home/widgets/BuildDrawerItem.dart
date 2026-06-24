part of 'HomeWidgetImports.dart';

class BuildDrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final GestureTapCallback? onTap;
  const BuildDrawerItem({Key? key, required this.icon, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTap??(){},
        child: Row(
          children: [
            Icon(icon,color: Colors.white,size: 25),
            const SizedBox(width: 10),
            MyText(
              title: title,
              size: 12,
              // fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
