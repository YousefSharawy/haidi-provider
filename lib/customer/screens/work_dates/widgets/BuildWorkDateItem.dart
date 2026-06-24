part of'WorkDatesWImports.dart';

class BuildWorkDateItem extends StatelessWidget {
  final WorkDatesData workDatesData ;
  const BuildWorkDateItem({Key? key, required this.workDatesData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GenericBloc<List<WorkTimeModel>>,
          GenericState<List<WorkTimeModel>>>(
        bloc: workDatesData.workTimeBloc,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            if (state.data.isNotEmpty) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                physics: const BouncingScrollPhysics(),
                itemCount: state.data.length,
                itemBuilder: (context, index) => Row(
                  children: [
                    Container(
                      width: 50,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: MyText(
                          title: state.data[index].day ?? '',
                          size: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GenericTextField(
                        onTab: () {
                          if(!state.data[index].isClosed){
                            workDatesData.chooseFromTime(
                                context, index, true);
                          }
                        },
                        fieldTypes: FieldTypes.clickable,
                        fillColor: MyColors.textFields,
                        hint: tr(context, "from"),
                        controller: workDatesData
                            .workTimeBloc.state.data[index].from,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        action: TextInputAction.next,
                        type: TextInputType.text,
                        validate: (value) =>
                            value!.validateEmpty(context),
                      ),
                    ),
                    Expanded(
                      child: GenericTextField(
                        onTab: () {
                          if(!state.data[index].isClosed){
                            workDatesData.chooseFromTime(
                                context, index, false);
                          }
                        },
                        fieldTypes: FieldTypes.clickable,
                        fillColor: MyColors.textFields,
                        hint: tr(context, "to"),
                        controller: workDatesData
                            .workTimeBloc.state.data[index].to,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        action: TextInputAction.next,
                        type: TextInputType.text,
                        validate: (value) =>
                            value!.validateEmpty(context),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: state.data[index].isClosed,
                            onChanged: (value) {
                              workDatesData.onSelectClose(index, value);
                            }),
                        MyText(
                            title: tr(context, "close"),
                            size: 9,
                            color: MyColors.primary,
                            fontWeight: FontWeight.bold),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                  child: MyText(title: tr(context, "noAppoionts"), size: 10));
            }
          } else {
            return const SizedBox();
          }
        },
      ),
    );  }
}
