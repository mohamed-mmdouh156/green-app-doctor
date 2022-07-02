import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layouts/homePageLayout/cubit_cubit.dart';
import '../../layouts/main_drawer/main_drawer.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  getUser() async {
    var user = FirebaseAuth.instance.currentUser;
    print(user?.email);
    print(user?.uid.toString());
  }

  void initState() {
    getUser();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getNotes()..getFavoriteItem()..getDecorationPlants()..getVegetables()..getFruits()..getModel()..getDiseases(),
      child: BlocConsumer<AppCubit , AppState>(
        listener: (context , state) {},
        builder: (context , state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xffF7F7F7),
              title: const Text("Green Doctor"),
              titleTextStyle: const TextStyle(
                fontSize: 25,
                fontFamily: 'Courgette-Regular',
                color: Color(0xff245D18),
              ),
              centerTitle: true,
              leading: Builder(
                builder: (context) {
                  return IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: const Icon(
                        Icons.view_headline,
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
            drawer: const Drawer(
              child: MainDrawer(),
            ),
            body: Stack(
              children: [
                Container(
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xff9DDBB5),
                    image: DecorationImage(
                      image: AssetImage("lib/shared/styles/images/3 - Copy.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Let's find your \n plants !",
                        style: TextStyle(
                            fontFamily: "Courgette-Regular",
                            fontSize: 30,
                            color: Color(0xff255E3A)),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Search",
                              icon: Icon(Icons.search),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Expanded(
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            children: [
                              InkWell(
                                splashColor: Colors.teal,
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, 'VegetablesCollectionScreen');
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "lib/shared/styles/images/5 - Copy.jpg"),
                                              fit: BoxFit.fill),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(13),
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(0, 10),
                                                blurRadius: 10,
                                                //  spreadRadius: -10,
                                                color: Colors.black45)
                                          ]),
                                      height: 160,
                                    ),
                                    Center(
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          color: Colors.white60,
                                          child: const Center(
                                            child: Text(
                                              "Vegetables",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.teal,
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, 'FruitsCollectionScreen');
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "lib/shared/styles/images/fruits - Copy.jpg"),
                                              fit: BoxFit.fill),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(13),
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(0, 10),
                                                blurRadius: 10,
                                                //  spreadRadius: -10,
                                                color: Colors.black45)
                                          ]),
                                    ),
                                    Center(
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          color: Colors.white60,
                                          child: const Center(
                                            child: Text(
                                              "Fruits",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.teal,
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, 'DecorationPlantsCollectionScreen');
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "lib/shared/styles/images/8 - Copy.jpg"),
                                              fit: BoxFit.fill),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(13),
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(0, 10),
                                                blurRadius: 10,
                                                //  spreadRadius: -10,
                                                color: Colors.black45)
                                          ]),
                                    ),
                                    Center(
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          color: Colors.white60,
                                          child: const Center(
                                            child: Text(
                                              "Decoration Plants",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.teal,
                                onTap: () {},
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "lib/shared/styles/images/7 - Copy.jpg"),
                                              fit: BoxFit.fill),
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(13),
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(0, 10),
                                                blurRadius: 10,
                                                //  spreadRadius: -10,
                                                color: Colors.black45)
                                          ]),
                                    ),
                                    Center(
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          color: Colors.white60,
                                          child: const Center(
                                            child: Text(
                                              "Other Plants",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
