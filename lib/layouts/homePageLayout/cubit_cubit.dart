import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model/data_model/data_model.dart';
part 'cubit_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<DataModel> fruits = [];
  List<DataModel> vegetables = [];
  List<DataModel> decorationPlants = [];
  List<String> fruitsId = [];
  List<DataModel> fruitItem = [];


  void getFruits() {
    FirebaseFirestore.instance.collection('fruits').get().then((value) {
      value.docs.forEach((element) {
        fruitsId.add(element.id);
        fruits.add(DataModel.fromjson(element.data()));
      });
      emit(GetFruitsSuccessState());
    }).catchError((error) {
      emit(GetFruitsErrorState(error.toString()));
    });
  }

  void getVegetables() {
    FirebaseFirestore.instance.collection('vegetables').get().then((value) {
      value.docs.forEach((element) {
        vegetables.add(DataModel.fromjson(element.data()));
      });
      emit(GetVegetablesSuccessState());
    }).catchError((error) {
      emit(GetVegetablesErrorState(error.toString()));
    });
  }

  void getDecorationPlants() {
    FirebaseFirestore.instance
        .collection('decoration plants')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        decorationPlants.add(DataModel.fromjson(element.data()));
      });
      emit(GetDecorationPlantsSuccessState());
    }).catchError((error) {
      emit(GetDecorationPlantsErrorState(error.toString()));
    });
  }


  getFruitsItem(String dccId) {
    FirebaseFirestore.instance.collection('fruits').get().then((value) {
      value.docs.forEach((element) {
        fruitItem.add(DataModel.fromjson(element.data()));

        emit(GetFruitsItemSuccessState());
      });
    }).catchError((error) {
      emit(GetFruitsItemErrorState(error.toString()));
    });
  }
}
