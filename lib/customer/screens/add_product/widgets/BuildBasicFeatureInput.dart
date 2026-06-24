part of 'AddProductWImports.dart';

class BuildBasicFeatureInput extends StatelessWidget {
  const BuildBasicFeatureInput({
    Key? key,
    required this.addProductData,
  }) : super(key: key);

  final AddProductData addProductData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () =>addProductData.onAddBasicFeature(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                  title: tr(context, "basicFeatures"),
                  size: 10,
                  fontWeight: FontWeight.bold),
              Card(
                  shadowColor: MyColors.secondary,
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Icon(Icons.add, color: MyColors.primary),
                  )),
            ],
          ),
        ),
        BlocBuilder<GenericBloc<List<PrimaryFeatures>>,
            GenericState<List<PrimaryFeatures>>>(
          bloc: addProductData.primaryFeaturesCubit,
          builder: (context, state) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: state.data.length,
                itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        GenericTextField(
                          fieldTypes: FieldTypes.normal,
                          fillColor: MyColors.textFields,
                          hint: "${tr(context, "featureNum")} ${index+1} ${tr(context, "withAr")}",
                          controller: state.data[index].arabicFeature,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          action: TextInputAction.newline,
                          type: TextInputType.text,

                          // max: 4,
                          validate: (value) => value!.validateEmpty(context),
                        ),
                        GenericTextField(
                          fieldTypes: FieldTypes.normal,
                          fillColor: MyColors.textFields,
                          hint: "${tr(context, "featureNum")} ${index+1} ${tr(context, "withEn")}",
                          controller: state.data[index].englishFeature,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          action: TextInputAction.newline,
                          type: TextInputType.text,
                          validate: (value) => value!.validateEmpty(context),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: ()=>addProductData.onRemoveBasicFeature(index: index, id: state.data[index].id??0),
                    child: Card(
                        shadowColor: MyColors.secondary,
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Icon(Icons.remove, color: MyColors.primary),
                        )),
                  ),

                ],
              );
            });
          },
        ),
      ],
    );
  }
}
