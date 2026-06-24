part of 'WorkDatesImports.dart';

class WorkDates extends StatefulWidget {
  const WorkDates({Key? key}) : super(key: key);

  @override
  State<WorkDates> createState() => _WorkDatesState();
}

class _WorkDatesState extends State<WorkDates> {
  final WorkDatesData workDatesData = WorkDatesData();
  @override
  void initState() {
    workDatesData.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: tr(context, "workTimes"),
      back: true,
      body: Column(
        children: [
          BuildWorkDateItem(
            workDatesData: workDatesData,
          ),
          BuildWorkDateButton(workDatesData: workDatesData),
        ],
      ),
    );
  }
}
