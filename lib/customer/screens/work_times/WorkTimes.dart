part of 'WorkTimesImports.dart';

class WorkTimes extends StatefulWidget {
  final String providerId ;
  const WorkTimes({Key? key, required this.providerId}) : super(key: key);

  @override
  State<WorkTimes> createState() => _WorkTimesState();
}

class _WorkTimesState extends State<WorkTimes> {
  final WorkTimesData workTimesData = WorkTimesData();
  @override
  void initState() {
    workTimesData.init();
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            BuildWorkTimeLogo(workTimesData: workTimesData),
            Expanded(
              child: BuildWorkItem(workTimesData: workTimesData),
            ),
            BuildConfirmWorkTimeButton(workTimesData: workTimesData, widget: widget),
          ],
        ),
      ),
    );
  }
}




