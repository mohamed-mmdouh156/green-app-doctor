import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenappdoctor/layouts/homePageLayout/cubit_cubit.dart';

class ShowNotes extends StatelessWidget {
  const ShowNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=> AppCubit()..getNotes(),
        child: BlocConsumer<AppCubit,AppState>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text(
                  'Notes', style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              )
              ),
            ),
            body:  ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index){
                  return  Container(
                    margin: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                    height: MediaQuery.of(context).size.height*.25,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(12)

                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          padding: const EdgeInsets.fromLTRB(3, 10, 3, 0),
                          width: double.infinity,
                          child: Material(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                                child: Row(
                                  children: [
                                    const Text('Title :', style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold
                                    )),
                                    const SizedBox(width: 3,),
                                    Text('${cubit.notes[index].title}',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        color: Colors.teal,
                                      ),

                                    ),
                                  ],
                                )
                            ),
                          ),
                        ),
                        const SizedBox(height: 6,),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 5, 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 78,
                                  width: 300,
                                  child: Text('${cubit.notes[index].description}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.fade,

                                  ),
                                ),
                              ],
                            )

                        ),
                        const SizedBox(height: 2,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Time : ${(cubit.notes[index].time)}',
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                )),
                            const SizedBox(width: 7,),
                          ],

                        ),
                        const SizedBox(height: 5,),

                      ],
                    ),
                  );
                },
                separatorBuilder: (context,index){
                  return const SizedBox(height: 10,);
                },
                itemCount: cubit.notes.length
            ),

          );
        },
      ),
    );
  }
}
