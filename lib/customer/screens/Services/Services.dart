part of 'ServicesImports.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final ServicesData servicesData = ServicesData();

  @override
  void initState() {
    servicesData.fetchServices(context,
        firstTime: true,
        currentPage: servicesData.filterPageKeyBloc.state.data);
    servicesData.servicePaginationListener(context);
    super.initState();
  }

  @override
  void dispose() {
    servicesData.dispose(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('zzzzzzzzz${servicesData.hashCode}');
    return AuthScaffold(
      title: tr(context, "services"),
      back: true,
      body: Column(
        children: [
          BuildServiceList(servicesData: servicesData),
          BuildAddServiceButton(servicesData: servicesData),
        ],
      ),
    );
  }
}
