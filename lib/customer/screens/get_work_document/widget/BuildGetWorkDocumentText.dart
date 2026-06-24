part of 'GetWorkDocumentWidgetImports.dart';

class BuildGetWorkDocumentText extends StatelessWidget {
  const BuildGetWorkDocumentText({
    Key? key,
    required this.getWorkDocumentData,
  }) : super(key: key);

  final GetWorkDocumentData getWorkDocumentData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(
          title: tr(context, "register"),
          size: 18,
          color: MyColors.primary,
        ),
        MyText(
          title: tr(context, "documentForSignature"),
          size: 18,
          color: MyColors.primary,
        ),
        BlocBuilder<GenericBloc<DownloadDocumentModel>,
            GenericState<DownloadDocumentModel>>(
          bloc: getWorkDocumentData.downloadDocumentCubit,
          builder: (context, state) {
            if (state is GenericUpdateState) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: MyText(
                  title: state.data.description!,
                  size: 14,
                  color: MyColors.black,
                  alien: TextAlign.center,
                ),
              );
            } else {
              return Center(
                child: LoadingDialog.showLoadingView(),
              );
            }
          },
        ),
      ],
    );
  }
}
