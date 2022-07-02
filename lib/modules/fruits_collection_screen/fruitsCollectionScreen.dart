import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layouts/homePageLayout/cubit_cubit.dart';
import '../../model/data_model/data_model.dart';

class FruitsCollectionScreen extends StatefulWidget {
  const FruitsCollectionScreen({Key? key,}) : super(key: key);

  @override
  State<FruitsCollectionScreen> createState() => _FruitsCollectionScreenState();
}

class _FruitsCollectionScreenState extends State<FruitsCollectionScreen> {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AppCubit()..getFruits()),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xffF7F7F7),
              title: const Text("Fruits"),
              titleTextStyle: const TextStyle(
                fontSize: 25,
                fontFamily: 'Courgette',
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
                  .fruits
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
                                        buildFruitsItem(
                                            AppCubit
                                                .get(context)
                                                .fruits[index], context , index),
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                    crossAxisSpacing: 20,
                                      mainAxisSpacing: 20
                                    ),
                                    itemCount: AppCubit
                                        .get(context)
                                        .fruits
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
            ));
        }));
    }
  }

  Widget buildFruitsItem(DataModel model, context , index) => InkWell(
        splashColor: Colors.teal,
    onTap: () {
      AppCubit.get(context).addFavouriteItem(model);
    },
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

