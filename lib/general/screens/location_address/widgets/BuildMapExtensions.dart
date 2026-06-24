part of'LocationWidgetsImports.dart';


class BuildMapExtensions extends StatelessWidget {
  const BuildMapExtensions({
    Key? key,
    required this.locationAddressData,
  }) : super(key: key);

  final LocationAddressData locationAddressData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          // BuildMapSearch(locationAddressData: locationAddressData),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: locationAddressData.mapType,
            builder: (context, state) {
              return TranslateAnimation(
                duration: Duration(milliseconds: 800),
                child: Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          spreadRadius: 1)
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () => locationAddressData.mapType.onUpdateData(
                        !locationAddressData.mapType.state.data),
                    child: Icon(
                      !state.data ? Icons.satellite : Icons.map,
                      size: 25,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

