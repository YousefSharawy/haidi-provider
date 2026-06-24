part of 'ProfileImports.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ProfileData profileData = ProfileData._();

  @override
  void initState() {
   profileData.initProfile(context);
    super.initState();
  }

  @override
  void dispose() {
   profileData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
      child: Column(
        children: [
          Flexible(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                BuildProviderProfilePhoto(profileData: profileData),
                BuildProfileBody(profileData: profileData),
              ],
            ),
          ),
          BuildProfileButtons(profileData: profileData)
        ],
      ),
    );
  }
}
