part of 'ServiceWImports.dart';

class BuildServiceList extends StatelessWidget {
  final ServicesData servicesData;

  const BuildServiceList({
    Key? key,
    required this.servicesData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    return BlocBuilder<GenericBloc<List<ServicesModel>>,
        GenericState<List<ServicesModel>>>(
      bloc: servicesData.serviceBloc,
      builder: (context, state) {
        if (state is GenericUpdateState) {
          if (state.data.isNotEmpty) {
            return Expanded(
              child: ListView.builder(
                controller: servicesData.controller,
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                itemCount: state.data.length,
                itemBuilder: (context, mainIndex) {
                  if (mainIndex < state.data.length) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () => servicesData.toggleClose(mainIndex),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: MyColors.primary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  title:
                                      state.data[mainIndex].subCategoryName ??
                                          '',
                                  size: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                Icon(
                                    state.data[mainIndex].close!
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down,
                                    color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                        ...List.generate(
                          state.data[mainIndex].services?.length ?? 0,
                          (subIndex) => Offstage(
                            offstage: !state.data[mainIndex].close!,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: MyColors.secondary,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: MyText(
                                      title: lang == "ar"
                                          ? (state.data[mainIndex]
                                                  .services?[subIndex].nameAr ??
                                              '')
                                          : (state.data[mainIndex]
                                                  .services?[subIndex].nameEn ??
                                              ''),
                                      size: 9,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: MyText(
                                      title:
                                          '${state.data[mainIndex].services?[subIndex].timeTakesInMinutes} د',
                                      size: 9,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: MyText(
                                      title:
                                          '${state.data[mainIndex].services?[subIndex].price} ر.س',
                                      size: 9,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                          onTap: () => showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    BuildServiceDialog(
                                                  servicesData: servicesData,
                                                  editService: true,
                                                  mainIndex: mainIndex,
                                                  subIndex: subIndex,
                                                ),
                                              ),
                                          child: Icon(Icons.edit,
                                              color: Colors.black, size: 22)),
                                      const SizedBox(width: 10),
                                      InkWell(
                                          onTap: () async {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    BuildDeleteServiceDialog(
                                                      mainIndex: mainIndex,
                                                      servicesData:
                                                          servicesData,
                                                      serviceId: state.data[mainIndex]
                                                          .services?[subIndex].id ??
                                                          0,
                                                    ));
                                          },
                                          child: Icon(Icons.cancel,
                                              color: Colors.black, size: 22)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                      bloc: servicesData.paginationLoading,
                      builder: (context, state) {
                        return Visibility(
                          visible: state.data,
                          child: Center(
                            child: CupertinoActivityIndicator(
                              radius: 15,
                              color: MyColors.primary,
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            );
          } else {
            return Expanded(
                child: Center(
                    child: MyText(
              title: tr(context, "noService"),
              size: 10,
              fontWeight: FontWeight.bold,
            )));
          }
        } else {
          return Expanded(
            child: Center(
              child: LoadingDialog.showLoadingView(),
            ),
          );
        }
      },
    );
  }
}
