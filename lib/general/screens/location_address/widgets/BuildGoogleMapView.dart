part of 'LocationWidgetsImports.dart';

class BuildGoogleMapView extends StatelessWidget {
  final LocationAddressData locationAddressData;

  const BuildGoogleMapView({required this.locationAddressData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        CameraPosition _initialLoc = CameraPosition(
            target: LatLng(state.model!.lat, state.model!.lng),
            zoom: 10,
            tilt: 90);
        return Stack(
          alignment: Alignment.topRight,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                BlocBuilder<GenericBloc<Set<Marker>>,
                    GenericState<Set<Marker>>>(
                  bloc: locationAddressData.addMarkerCubit,
                  builder: (context, state) {
                    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                      bloc: locationAddressData.mapType,
                      builder: (context, state) {
                        return GoogleMap(
                            zoomControlsEnabled: false,
                            indoorViewEnabled: true,
                            mapType: state.data
                                ? MapType.satellite
                                : MapType.normal,
                            markers: locationAddressData
                                .addMarkerCubit.state.data,
                            initialCameraPosition: _initialLoc,
                            onMapCreated: (GoogleMapController controller) {
                              locationAddressData.googleMapController = controller;
                              locationAddressData.controller.complete(controller);
                            },
                            padding:
                            const EdgeInsets.symmetric(vertical: 150),
                            onLongPress: (latLng) {
                              locationAddressData.addMarker(
                                  context, latLng);
                            },
                            onCameraIdle: () {
                              locationAddressData.getLocationAddress(context);
                            },
                            onTap: (location) {
                              locationAddressData.addMarkerCubit.onUpdateData({});
                              locationAddressData.addMarkerCubit.state.data.clear();
                              locationAddressData.getLocationAddress(context);
                              locationAddressData.showMainMarker.onUpdateData(true);

                            },
                            onCameraMove: (loc) {
                              locationAddressData.locationModel =
                                  LocationModel(
                                    lat: loc.target.latitude,
                                    lng: loc.target.longitude,
                                    address: "",
                                  );
                              if(!locationAddressData.showMainMarker.state.data){
                                locationAddressData.addMarkerCubit.onUpdateData({});
                                locationAddressData.addMarkerCubit.state.data.clear();
                                locationAddressData.showMainMarker.onUpdateData(true);
                              }
                            }
                            );

                      },
                    );
                  },
                ),
                BuildMainMarker(locationAddressData: locationAddressData),
              ],
            ),
            BuildAddressContainer(),
            BuildMapExtensions(locationAddressData: locationAddressData)
          ],
        );
      },
    );
  }
}


