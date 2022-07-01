import 'package:flutter/material.dart';

class PlantUserAppModel {
   String? name;
   String? phone;
   String? email;
   String? uId;
   String? image;

  PlantUserAppModel({
     this.name,
     this.email,
     this.phone,
     this.uId,
     this.image,
  });

  PlantUserAppModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
  }

Map<String, dynamic> toMap() {
  return {
    'name': name,
    'email': email,
    'phone': phone,
    'uId': uId,
    'image' : image
  };
}
}
