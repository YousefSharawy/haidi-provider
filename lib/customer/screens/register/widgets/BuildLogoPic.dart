part of 'RegisterWidgetsImports.dart';


class BuildLogoPic extends StatelessWidget {
  const BuildLogoPic({
    Key? key,
    required this.dark,
    required this.registerData,
  }) : super(key: key);

  final bool dark;
  final RegisterData registerData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenericTextField(
          hintColor: Theme.of(context)
              .textTheme
              .titleMedium
              ?.color
              ?.withOpacity(.8),
          fieldTypes: FieldTypes.clickable,
          fillColor: dark ? Colors.transparent : MyColors.textFields,
          hint: tr(context, "logoPic"),
          controller: registerData.logo,
          margin: const EdgeInsets.symmetric(vertical: 10),
          action: TextInputAction.next,
          type: TextInputType.text,
          suffixIcon: Icon(Icons.camera_alt),
          validate: (value) => value!.noValidate(),
          onTab: () => registerData.setLogoImage(),
        ),
        BlocBuilder<GenericBloc<File?>, GenericState<File?>>(
          bloc: registerData.logoImageCubit,
          builder: (_, state) {
            if (state.data != null) {
              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black45, BlendMode.screen),
                          image: FileImage(state.data!),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          width: 5,
                          color: Colors.white.withOpacity(.5),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    left: -5,
                    right: -60,
                    child: GestureDetector(
                      onTap: () => registerData.setLogoImage(),
                      child: Container(
                        width: 35,
                        height: 35,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: MyColors.primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(.5),
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: MyColors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }else{
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }

}
