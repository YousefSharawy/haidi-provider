part of 'LocationAddressImports.dart';

class LocationAddress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LocationAddress();
}

class _LocationAddress extends State<LocationAddress> {
  final LocationAddressData locationAddressData = new LocationAddressData();
  @override
  void initState() {
    var loc = context.read<LocationCubit>().state.model;
    double lat = loc?.lat ?? 24.774265;
    double lng = loc?.lng ?? 46.738586;
    locationAddressData.locationModel = LocationModel(lat: lat, lng: lng);
    locationAddressData.getLocationAddress(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      key: locationAddressData.scaffold,
      body: SafeArea(
        child: BuildGoogleMapView(
          locationAddressData: locationAddressData,
        ),
      ),
      floatingActionButton: BuildSaveButton(
        locationAddressData: locationAddressData,
      ),
    );
  }
}


