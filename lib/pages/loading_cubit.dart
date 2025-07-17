import 'package:bloc/bloc.dart';

sealed class LoadingState {}

final class LoadingInitial extends LoadingState {}

final class LoadingShown extends LoadingState {}

final class LoadingHidden extends LoadingState {}

class LoadingCubit extends Cubit<LoadingState> {
  LoadingCubit() : super(LoadingInitial());

  void showLoading() => emit(LoadingShown());

  void hideLoading() => emit(LoadingHidden());

}