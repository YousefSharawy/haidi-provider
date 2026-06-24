import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'generic_state.dart';

class GenericBloc<T> extends Cubit<GenericState<T>> {
  GenericBloc(T data) : super(GenericInitialState<T>(data));

  onUpdateData(T data){
    emit(GenericUpdateState<T>(data, !state.loading, state.error));
  }

  onUpdateLoader(bool loading){
    emit(GenericUpdateLoadingState<T>(state.data, loading,state.error));
  }

  onFailedResponse({String error = ""}){
    emit(GenericFailedState<T>(state.data, !state.loading, error));
  }

  onUpdateToInitState(T data){
    emit(GenericInitialState<T>(data));
  }


}