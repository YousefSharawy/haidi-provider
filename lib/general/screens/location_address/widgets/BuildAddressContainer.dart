part of 'LocationWidgetsImports.dart';

class BuildAddressContainer extends StatelessWidget {
  const BuildAddressContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        return Visibility(
          visible: state.model!.address != '',
          child: TranslateAnimation(
            duration: Duration(milliseconds: 300),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10),
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7, left: 5),
                    child: Icon(Icons.circle,
                        color: MyColors.primary, size: 12),
                  ),
                  Expanded(
                    child: MyText(
                      title: "${state.model!.address}",
                      size: 12,
                      color: MyColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}