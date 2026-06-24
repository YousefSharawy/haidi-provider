part of 'ServiceWImports.dart';

class BuildAddServiceButton extends StatelessWidget {
  final ServicesData servicesData;
  const BuildAddServiceButton({
    Key? key, required this.servicesData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => BuildServiceDialog(servicesData: servicesData, editService: false));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: MyColors.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: MyText(
          alien: TextAlign.center,
          title: tr(context, "addService"),
          size: 10,
          fontWeight: FontWeight.bold,
          color: MyColors.white,
        ),
      ),
    );
  }
}

