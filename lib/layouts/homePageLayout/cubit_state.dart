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


class GetFruitsItemLoadingState extends AppState {}

class GetFruitsItemSuccessState extends AppState {}

class GetFruitsItemErrorState extends AppState {
  final String error ;
  GetFruitsItemErrorState(this.error);
}

class AddFavoriteSuccessState extends AppState{}
class AddFavoriteErrorState extends AppState{}

class GetFavoriteSuccessState extends AppState{}
class GetFavoriteErrorState extends AppState{}

class AddNoteSuccessState extends AppState{}
class AddNoteErrorState extends AppState{}

class GetNoteSuccessState extends AppState{}
class GetNoteErrorState extends AppState{}

class GetModelSuccessState extends AppState{}
class GetModelErrorState extends AppState{}

class GetUserSuccessState extends AppState {}

class GetUserErrorState extends AppState {}


class UploadProfileImageSuccessState extends AppState {}

class UploadProfileImageErrorState extends AppState {}

class GetDiseasesSuccessState extends AppState {}

class GetDiseasesErrorState extends AppState {}

class GetDiseasesSuccessState extends AppState {}

class GetDiseasesErrorState extends AppState {}
