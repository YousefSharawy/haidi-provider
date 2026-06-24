part of 'GetWorkDocumentWidgetImports.dart';

class BuildGetWorkDocumentLogo extends StatelessWidget {
  const BuildGetWorkDocumentLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'logo',
        child: Padding(
            padding: const EdgeInsets.only(top: 80,bottom: 20,left: 40,right: 40),
            child: Image.asset(Res.imagesLogo)));
  }
}
