part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  final UserModel model;
  final bool changed;
  const UserState({required this.model, required this.changed});
}

class UserInitial extends UserState {
  UserInitial()
      : super(
            model: UserModel(
              userName: "",
              id: "",
              token: '',
              lang: '',
              taxRecord: '',
              commercialRecord: '',
              description: '',
              placeName: '',
              cityId: 0,
              phone: '',
              email: '',
              activedByCode: false,
              confirmedByDashboard: false,
              imgProfile: '',
              isAvilable: false,
              mainCategories: [],
              typeUser: 1,
              workdates: [],
            ),
            changed: false);
  @override
  List<Object> get props => [model, changed];
}

class UserUpdateState extends UserState {
  UserUpdateState({required UserModel model, required bool changed})
      : super(model: model, changed: changed);
  @override
  List<Object> get props => [model, changed];
}
