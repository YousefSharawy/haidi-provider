part of 'WorkDatesImports.dart';

class WorkDatesData {
  // <editor-fold desc="params">
  final GlobalKey<CustomButtonState> btnKey = GlobalKey<CustomButtonState>();
  final GenericBloc<List<WorkTimeModel>> workTimeBloc = GenericBloc([]);
  final GenericBloc<List<Workdate>> getWorkTimeBloc = GenericBloc([]);
  Map<String, dynamic> body = {};
  List<Map<String, dynamic>> workDates = [];

  List<WorkTimeModel> get _list => WorkTimeModel.initList;

// </editor-fold>
  /// ================ init =====================>>>>>>
  // <editor-fold desc="init">
  void init(BuildContext context) {
    var user = context.read<UserCubit>().state.model;
    workTimeBloc.onUpdateData(_list);
    List<WorkTimeModel> list = workTimeBloc.state.data;
    for (int i = 0; i < list.length; i++) {
      list[i].isClosed = user.workdates![i].isClosed ?? false;
      list[i].id = user.workdates![i].id;
      list[i].startHour = user.workdates![i].startHour ?? null;
      list[i].endHour = user.workdates![i].endHour ?? null;
      list[i].from?.text = user.workdates![i].startHour ?? '';
      list[i].to?.text = user.workdates![i].endHour ?? '';
    }
    workTimeBloc.onUpdateData(list);
  }

  void getProviderWorkDates(BuildContext context) async {
    List<Workdate> result =
        await CustomerRepository(context).getProviderWorkDates();

    getWorkTimeBloc.onUpdateData(result);
  }

// </editor-fold>
  /// ================ selection Logic =====================>>>>>>
// <editor-fold desc="selection Logic">
  onSelectClose(int index, bool? value) {
    List<WorkTimeModel> list = workTimeBloc.state.data;
    list[index].isClosed = value!;
    if (list[index].isClosed) {
      list[index].from?.text = '';
      list[index].to?.text = '';
      list[index].startHour = null;
      list[index].endHour = null;
    }
    workTimeBloc.onUpdateData(list);
  }

  onConfirmFromTime(time, int index, bool isStart) {
    List<WorkTimeModel> list = workTimeBloc.state.data;
    if (time != null) {
      String dateStr = DateFormat("hh:mm a").format(time);
      if (isStart) {
        list[index].startHour = dateStr;
        list[index].from?.text = list[index].startHour ?? '';
        workTimeBloc.onUpdateData(list);
        // print(list[index].startHour);
        // print(list[index].from?.text);
      } else {
        list[index].endHour = dateStr;
        list[index].to?.text = list[index].endHour ?? '';
        workTimeBloc.onUpdateData(list);
        // print(list[index].endHour);
        // print(list[index].to?.text);
      }
    }
  }

  chooseFromTime(BuildContext context, int index, bool isStart) {
    FocusScope.of(context).requestFocus(FocusNode());
    AdaptivePicker.timePicker(
      context: context,
      title: tr(context, "plsSelectTime"),
      onConfirm: (date) => onConfirmFromTime(date, index, isStart),
    );
  }

// </editor-fold>
  /// ================ RecordTimesService =====================>>>>>>
// <editor-fold desc="RecordTimesService">
  void onRecordTimes(
    BuildContext context,
  ) async {
    List<WorkTimeModel> list = workTimeBloc.state.data;
    workDates = [];
    var user = context.read<UserCubit>();
    for (int i = 0; i < list.length; i++) {
      if (!list[i].isClosed) {
        if (list[i].startHour == null ||
            list[i].endHour == null ||
            list[i].startHour == "" ||
            list[i].endHour == "") {
          LoadingDialog.showSnackBar(
              context, '${tr(context, "uShouldEnterWorkTime")}${list[i].day}');
          return;
        }
      }
      workDates.addAll([
        {
          "\"id\"": list[i].id,
          "\"day\"": list[i].dayNum,
          "\"startHour\"":
              list[i].startHour != null ? "\"${list[i].startHour}\"" : null,
          "\"endHour\"":
              list[i].endHour != null ? "\"${list[i].endHour}\"" : null,
          "\"isClosed\"": list[i].isClosed
        }
      ]);
    }
    body = {"lang": "${DioUtils.lang}", "workdates": workDates.toString()};
    btnKey.currentState!.animateForward();
    List<Workdate> result =
        await CustomerRepository(context).updateProviderWorkDates(body: body);
    if (result.isNotEmpty) {
      if (result.isNotEmpty) {
        result.forEach((element) {
          user.state.model.workdates?.forEach((e) {
            print(">> 1 ${e.startHour}");
            print(">> 2 ${e.endHour}");
            print(">> 3 ${e.isClosed}");
            if (element.id == e.id) {
              e.startHour = element.startHour;
              e.endHour = element.endHour;
              e.isClosed = element.isClosed;
            }
          });
          user.onUpdateUserData(user.state.model);
          Utils.clearSavedData();
          Utils.saveUserData(user.state.model);
        });
        LoadingDialog.showSnackBar(context, tr(context, "updatedSuccessfully"));
        btnKey.currentState!.animateReverse();
        navigationKey.currentState!.pop();
      }
      btnKey.currentState!.animateReverse();
    }
  }
//</editor-fold>
}
