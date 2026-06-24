part of'SelectCatWImports.dart';

class BuildCatItems extends StatelessWidget {
  const BuildCatItems({
    Key? key,
    required this.selectCategoriesData,
  }) : super(key: key);

  final SelectCategoriesData selectCategoriesData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<CategoriesModel>>,
        GenericState<List<CategoriesModel>>>(
      bloc: selectCategoriesData.mainCatCubit,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          if (state.data.isNotEmpty) {
            return Wrap(
              spacing: 30,
              children: List.generate(
                state.data.length,
                    (index) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                        value: state.data[index].selected,
                        onChanged: (value) => selectCategoriesData.toggleSelectedCats(value!, index)),
                    MyText(
                      title: state.data[index].name ?? '',
                      size: 10,
                    )
                  ],
                ),
              ),
            );
          } else {
            return MyText(title: tr(context, "noSections"), size: 10);
          }
        } else {
          return Center(
            child: LoadingDialog.showLoadingView(),
          );
        }
      },
    );
  }
}
