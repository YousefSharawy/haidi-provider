part of 'ResetPasswordWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final ResetPasswordData resetPasswordData;
  final String userId;

  const BuildFormInputs(
      {required this.resetPasswordData, required this.userId});

  @override
  Widget build(BuildContext context) {
    var dark = context.watch<ThemeCubit>().state.isDark;
    return Form(
      key: resetPasswordData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GenericTextField(
            fieldTypes: FieldTypes.normal,
            hint: tr(context, "code"),
            controller: resetPasswordData.code,
            action: TextInputAction.next,
            fillColor: dark ? Colors.transparent : MyColors.textFields,
            type: TextInputType.number,
            validate: (value) => value!.validateEmpty(context),
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          BlocBuilder<GenericBloc, GenericState>(
            bloc: resetPasswordData.passwordBloc,
            builder: (context, state) {
              return GenericTextField(
                fieldTypes:
                    state.data ? FieldTypes.password : FieldTypes.normal,
                hint: tr(context, "newPass"),
                controller: resetPasswordData.newPassword,
                action: TextInputAction.next,
                fillColor: dark ? Colors.transparent : MyColors.textFields,
                type: TextInputType.text,
                validate: (value) => value!.validatePassword(context),
                suffixIcon: IconButton(
                  icon: state.data
                      ? Icon(
                          Icons.visibility,
                          size: 20,
                          color: Colors.grey,
                        )
                      : Icon(
                          Icons.visibility_off,
                          size: 20,
                          color: Colors.grey,
                        ),
                  onPressed: () {
                    resetPasswordData.passwordBloc.onUpdateData(!state.data);
                  },
                ),
                margin: const EdgeInsets.symmetric(vertical: 10),
              );
            },
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: resetPasswordData.confirmPasswordBloc,
            builder: (context, state) {
              return GenericTextField(
                fieldTypes:
                    state.data ? FieldTypes.password : FieldTypes.normal,
                hint: tr(context, "confirmPassword"),
                controller: resetPasswordData.confirmNewPassword,
                action: TextInputAction.done,
                type: TextInputType.text,
                fillColor: dark ? Colors.transparent : MyColors.textFields,
                margin: const EdgeInsets.symmetric(vertical: 10),
                validate: (value) => value!.validatePasswordConfirm(context,
                    pass: resetPasswordData.newPassword.text),
                suffixIcon: IconButton(
                  icon: state.data
                      ? Icon(
                          Icons.visibility,
                          size: 20,
                          color: Colors.grey,
                        )
                      : Icon(
                          Icons.visibility_off,
                          size: 20,
                          color: Colors.grey,
                        ),
                  onPressed: () {
                    resetPasswordData.confirmPasswordBloc
                        .onUpdateData(!state.data);
                  },
                ),
                onSubmit: () =>
                    resetPasswordData.onResetPassword(context, userId),
              );
            },
          ),
        ],
      ),
    );
  }
}
