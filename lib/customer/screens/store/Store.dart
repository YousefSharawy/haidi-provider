part of 'StoreImports.dart';

class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  final StoreData storeData = StoreData();
  @override
  void initState() {
    storeData.fetchStoreProduct(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
        title: tr(context, "store"),
        back: true,
        body: Column(
          children: [
            BlocBuilder<GenericBloc<List<ProductModel>>,
                GenericState<List<ProductModel>>>(
              bloc: storeData.productCubit,
              builder: (context, state) {
                if (state is GenericUpdateState) {
                  if (state.data.isNotEmpty) {
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          await storeData.fetchStoreProduct(context);
                        },
                        child: GridView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 220,
                          ),
                          itemBuilder: (context, index) => BuildShopItem(
                            storeData: storeData,
                            model: state.data[index],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                        child: Center(
                            child: MyText(title: tr(context, "noProducts"), size: 10)));
                  }
                } else {
                  return Expanded(
                    child: Center(
                      child: LoadingDialog.showLoadingView(),
                    ),
                  );
                }
              },
            ),
            BuildAddProductButton(
              editProduct: false,
            ),
          ],
        ));
  }
}
