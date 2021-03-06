import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layouts/homePageLayout/cubit_cubit.dart';
import '../../model/data_model/data_model.dart';
import '../../model/data_model/data_model2.dart';

class FavouritsScreen extends StatefulWidget {
  const FavouritsScreen({Key? key}) : super(key: key);

  @override
  State<FavouritsScreen> createState() => _FavouritsScreenState();
}

class _FavouritsScreenState extends State<FavouritsScreen> {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (BuildContext context) => AppCubit()..getFavoriteItem(),
        child: BlocConsumer<AppCubit, AppState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Scaffold(
                  appBar: AppBar(
                    backgroundColor: const Color(0xffF7F7F7),
                    title: const Text("Favorites"),
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
                              Navigator.pushReplacementNamed(
                                  context, 'HomePageLayout');
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Color(0xff255F3B),
                              size: 30,
                            ));
                      },
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'SearchScreen');
                        },
                        icon: const Icon(
                          Icons.search,
                          size: 30,
                          color: Color(0xff255F3B),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  body: ConditionalBuilder(
                    condition: AppCubit
                        .get(context)
                        .favorites
                        .isNotEmpty,
                    builder: (context) =>
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green[50],
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "lib/shared/styles/images/3 - Copy.jpg"),
                                  fit: BoxFit.fill)),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child:  Column(children: [
                              const SizedBox(height: 20,),
                              Expanded(
                                flex: 2,
                                child: GridView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        favoriteItem(
                                            AppCubit.get(context).favorites[index], context),
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20
                                    ),
                                    itemCount: AppCubit
                                        .get(context)
                                        .favorites
                                        .length),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ]),
                          ),
                        ),
                    fallback: (BuildContext context) =>
                    const Center(child: CircularProgressIndicator()),
                  ),
              );
            }),
    );
  }


  Widget favoriteItem(DataModel2 model, context) => InkWell(
    splashColor: Colors.teal,
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image:  DecorationImage(
                  image: NetworkImage(
                      "${model.image}"),
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
              child: Center(
                child: Text(
                  "${model.name}",
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            )),
      ],
    ),
  );


}
