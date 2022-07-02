import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenappdoctor/model/disease_model/disease_model.dart';
import 'package:greenappdoctor/model/plant_user_model/plant_user_model.dart';
import 'package:greenappdoctor/shared/components/components.dart';
import 'package:greenappdoctor/shared/shared_preferences/cash_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
  
  var nameController = TextEditingController();
  var phoneController = TextEditingController();


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


  void getFruitsItem(String dccId) {
    FirebaseFirestore.instance.collection('fruits').get().then((value) {
      value.docs.forEach((element) {
        fruitItem.add(DataModel.fromjson(element.data()));

        emit(GetFruitsItemSuccessState());
      });
    }).catchError((error) {
      emit(GetFruitsItemErrorState(error.toString()));
    });
  }

  void getUser() {
    nameController.text=CashHelper.getData(key: 'userName');
    phoneController.text=CashHelper.getData(key: 'userPhone');
    emit(GetUserSuccessState());

  }

  File? profileImage;

  ImageProvider profile = const AssetImage('assets/images/profile.png');

  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      profile = FileImage(profileImage!);
      print('Path is ${pickedFile.path}');
      emit(UploadProfileImageSuccessState());
    } else {
      print('No Image selected.');
      emit(UploadProfileImageErrorState());
    }
  }

  String? imagePath;

  Future uploadUserImage(){

    return firebase_storage.FirebaseStorage.instance.ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!).then((value) {

      value.ref.getDownloadURL().then((value) {

        print('Upload Success');
        print(value);
        imagePath = value;
        print('Siiiiiiiiiiii');
        print(imagePath);
        PlantUserAppModel model = PlantUserAppModel(
          name: nameController.text,
          phone:phoneController.text,
          image: imagePath,
          uId:CashHelper.getData(key: 'uId') ,
          email: CashHelper.getData(key: 'userEmail'),
        );
        FirebaseFirestore.instance
            .collection('users').
        doc(CashHelper.getData(key: 'uId')).set(model.toMap(), SetOptions(merge: true))
            .then((value) {
          print('Update');
          print(model.name);
        }).catchError((error) {
          print('Error is ${error.toString()}');
        });
        CashHelper.saveData(key: 'userImage',value: value);
        emit(UploadProfileImageSuccessState());

      }).catchError((error){

        print('Error in Upload profileImage ${error.toString()}');
        emit(UploadProfileImageErrorState());
      });


    });
  }

  List<DiseaseModel> disease=[];

  DiseaseModel? diseaseModel;
  void getDiseases(){

    FirebaseFirestore.instance.collection('Diseases').get().then((value) {

      value.docs.forEach((element) {
         disease.add(
             DiseaseModel.fromjson(element.data())
         );
         print(disease.length);
      });
      emit(GetDiseasesSuccessState());
    }).catchError((error){
      print('Error is ${error.toString()}');
      emit(GetDiseasesErrorState());
    });

  }

}
