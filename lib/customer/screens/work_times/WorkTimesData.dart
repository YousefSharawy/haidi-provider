part of 'WorkTimesImports.dart';

class WorkTimesData {
  // <editor-fold desc="params">
  final GlobalKey<CustomButtonState> btnKey = GlobalKey<CustomButtonState>();
  final GenericBloc<List<WorkTimeModel>> workTimeBloc = GenericBloc([]);
  Map<String, dynamic> body = {};
  List<Map<String, dynamic>> workDates = [];

  List<WorkTimeModel> get _list => WorkTimeModel.initList;

  // </editor-fold>

  void init() {
    workTimeBloc.onUpdateData(_list);
    List<WorkTimeModel> list = workTimeBloc.state.data;
    for (int i = 0; i < list.length; i++) {
      list[i].isClosed = false;
      list[i].startHour = null;
      list[i].endHour = null;
      list[i].from?.text = '';
      list[i].to?.text = '';
    }
    workTimeBloc.onUpdateData(list);
  }

  onSelectClose(int index, bool? value) {
    workTimeBloc.state.data[index].isClosed = value!;
    if (workTimeBloc.state.data[index].isClosed) {
      workTimeBloc.state.data[index].from?.text = '';
      workTimeBloc.state.data[index].startHour = null;
      workTimeBloc.state.data[index].endHour = null;
      workTimeBloc.state.data[index].to?.text = '';
    }
    workTimeBloc.onUpdateData(workTimeBloc.state.data);
  }

  onConfirmFromTime(time, int index, bool isStart) {
    if (time != null) {
      String dateStr = DateFormat("hh:mm a").format(time);
      dateStr = dateStr.replaceRange(dateStr.length - 2, dateStr.length,
          dateStr.contains('AM') ? 'ص' : 'م');
      if (isStart) {
        workTimeBloc.state.data[index].startHour = dateStr;
        workTimeBloc.state.data[index].from?.text =
            workTimeBloc.state.data[index].startHour ?? '';
        workTimeBloc.onUpdateData(workTimeBloc.state.data);
        print(workTimeBloc.state.data[index].startHour);
        print(workTimeBloc.state.data[index].from?.text);
      } else {
        workTimeBloc.state.data[index].endHour = dateStr;
        workTimeBloc.state.data[index].to?.text =
            workTimeBloc.state.data[index].endHour ?? '';
        workTimeBloc.onUpdateData(workTimeBloc.state.data);
        print(workTimeBloc.state.data[index].endHour);
        print(workTimeBloc.state.data[index].to?.text);
      }
    }
  }

  chooseFromTime(BuildContext context, int index, bool isStart) {
    FocusScope.of(context).requestFocus(FocusNode());
    AdaptivePicker.timePicker(
      context: context,
      title: tr(context, "plsSelectTime"), //الرجاء تحديد وقت بداية الاعلان
      onConfirm: (date) => onConfirmFromTime(date, index, isStart),
    );
  }

  void onRecordTimes(
    BuildContext context,
    String userId,
  ) async {
    workDates = [];
    for (int i = 0; i < workTimeBloc.state.data.length; i++) {
      if (!workTimeBloc.state.data[i].isClosed) {
        if (workTimeBloc.state.data[i].startHour == null ||
            workTimeBloc.state.data[i].endHour == null) {
          LoadingDialog.showSnackBar(context,
              '${tr(context, "uShouldEnterWorkTime")}${workTimeBloc.state.data[i].day}');
          return;
        }
      }
      // log('sssssss');
      workDates.addAll([
        {
          "\"day\"": workTimeBloc.state.data[i].dayNum,
          "\"startHour\"": workTimeBloc.state.data[i].startHour != null
              ? "\"${workTimeBloc.state.data[i].startHour!.contains('ص') ? workTimeBloc.state.data[i].startHour!.replaceAll('ص', 'AM') : workTimeBloc.state.data[i].startHour!.contains('م') ? workTimeBloc.state.data[i].startHour!.replaceAll('م', 'PM') : workTimeBloc.state.data[i].startHour}\""
              : null,
          "\"endHour\"": workTimeBloc.state.data[i].endHour != null
              ? "\"${workTimeBloc.state.data[i].endHour!.contains('ص')
              ? workTimeBloc.state.data[i].endHour!.replaceAll('ص', 'AM')
              : workTimeBloc.state.data[i].endHour!.contains('م')
              ? workTimeBloc.state.data[i].endHour!.replaceAll('م', 'PM')
              : workTimeBloc.state.data[i].endHour}\""
              : null,
          "\"isClosed\"": workTimeBloc.state.data[i].isClosed
        }
      ]);
    }
    body = {
      "lang": "${DioUtils.lang}",
      "providerId": userId,
      "workdates": workDates.toString()
    };
    btnKey.currentState!.animateForward();
    bool result = await GeneralRepository(context).addProviderWorkDates(
      body: body,
    );
    if (result) {
      Nav.navigateTo(
          GetWorkDocument(
            userId: userId,
          ),
          navigatorType: NavigatorType.push);
      btnKey.currentState!.animateReverse();
    }
    btnKey.currentState!.animateReverse();
  }
}
