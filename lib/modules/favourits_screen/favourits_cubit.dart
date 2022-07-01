import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favourits_state.dart';

class FavouritsCubit extends Cubit<FavouritsState> {
  FavouritsCubit() : super(FavouritsInitial());



}
