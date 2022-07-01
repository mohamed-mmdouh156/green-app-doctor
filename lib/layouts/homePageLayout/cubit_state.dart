part of 'cubit_cubit.dart';

@immutable
abstract class AppState {}

class InitialState extends AppState {}

class GetFruitsLoadingState extends AppState {}

class GetFruitsSuccessState extends AppState {}

class GetFruitsErrorState extends AppState {
  final String error ;
  GetFruitsErrorState(this.error);
}

class GetVegetablesLoadingState extends AppState {}

class GetVegetablesSuccessState extends AppState {}

class GetVegetablesErrorState extends AppState {
  final String error ;
  GetVegetablesErrorState(this.error);
}

class GetDecorationPlantsLoadingState extends AppState {}

class GetDecorationPlantsSuccessState extends AppState {}

class GetDecorationPlantsErrorState extends AppState {
  final String error ;
  GetDecorationPlantsErrorState(this.error);
}

class GetFavouritsLoadingState extends AppState {}

class GetFavouritsSuccessState extends AppState {}

class GetFavouritsErrorState extends AppState {
  final String error ;
  GetFavouritsErrorState(this.error);
}

class GetFruitsItemLoadingState extends AppState {}

class GetFruitsItemSuccessState extends AppState {}

class GetFruitsItemErrorState extends AppState {
  final String error ;
  GetFruitsItemErrorState(this.error);
}
