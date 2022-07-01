import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../layouts/homePageLayout/cubit_cubit.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var phoneController = TextEditingController();


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker imagePicker = ImagePicker();
  File? pickedImages;
  fetchImage() async {
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (ImagePicker == null) {
      return;
    } else if (ImagePicker != null) {
      setState(() {
        pickedImages = File(image!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AppCubit(),
  child: BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffF7F7F7),
          title: const Text("Profile"),
          titleTextStyle: const TextStyle(
            fontSize: 25,
            fontFamily: 'Courgette-Regular',
            color: Color(0xff245D18),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (context) {
              return IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'HomePageLayout');
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xff255F3B),
                    size: 30,
                  ));
            },
          ),
          actions: const [
            Icon(
              Icons.face,
              size: 30,
              color: Color(0xff255F3B),
            )
          ],
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xff9DDBB5),
                  image: DecorationImage(
                    image: AssetImage("lib/shared/styles/images/3 - Copy.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: Stack(alignment: Alignment.bottomRight, children: [
                        CircleAvatar(
                          backgroundColor: Colors.green[200],
                          radius: 80,
                          child: SizedBox(
                            width: 200,
                            child: ClipOval(
                              child: pickedImages == null
                                  ? null
                                  : Image.file(pickedImages!, fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: fetchImage,
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Color(0xff255E3A),
                            size: 40,
                          ),
                        )
                      ])),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xff416F46),
                        ),
                        labelText: "full name",
                        labelStyle: const TextStyle(
                            color: Color(0xff416F46), fontFamily: 'Courgette'),
                      ),
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  const SizedBox(),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(
                          Icons.lock_rounded,
                          color: Color(0xff416F46),
                        ),
                        labelText: "Edit Password",
                        labelStyle: const TextStyle(
                            color: Color(0xff416F46), fontFamily: 'Courgette'),
                      ),
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(
                          Icons.lock_rounded,
                          color: Color(0xff416F46),
                        ),
                        labelText: "Edit Phone number",
                        labelStyle: const TextStyle(
                            color: Color(0xff416F46), fontFamily: 'Courgette'),
                      ),
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            onPrimary: Colors.white,
                            primary: const Color(0xff255E3A),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {},
                        child: const Text("Save",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontFamily: 'Courgette'))),
                  ),
                ]))));
  },
),
);
  
}}
