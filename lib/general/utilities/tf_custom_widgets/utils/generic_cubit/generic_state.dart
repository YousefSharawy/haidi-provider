part of 'generic_cubit.dart';

abstract class GenericState<T> extends Equatable {
  final T data;
  final bool loading;
  final String error;
  const GenericState(this.data, this.loading, this.error);
}

class GenericInitialState<T> extends GenericState<T> {
  GenericInitialState(T data) : super(data, false, "");

  @override
  List<Object> get props => [loading];
}


class GenericUpdateState<T> extends GenericState<T> {
  GenericUpdateState(T data, bool loading, String error) : super(data, loading, error);

  @override
  List<Object> get props => [loading];
}

class GenericUpdateLoadingState<T> extends GenericState<T> {
  GenericUpdateLoadingState(T data, bool loading, String error) :  super(data, loading, error);

  @override
  List<Object> get props => [loading];
}

class GenericFailedState<T> extends GenericState<T> {
  GenericFailedState(T data, bool changed, String error) : super(data, changed, error);

  @override
  List<Object> get props => [error];
}


