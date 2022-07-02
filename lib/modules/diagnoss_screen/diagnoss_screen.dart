import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenappdoctor/layouts/homePageLayout/cubit_cubit.dart';
import 'package:greenappdoctor/modules/Diseases_Diteals/diseases_ditails.dart';
import 'package:greenappdoctor/shared/components/components.dart';
import 'package:greenappdoctor/shared/shared_preferences/cash_helper.dart';

class DiagnossScreen extends StatefulWidget {
  const DiagnossScreen({Key? key}) : super(key: key);



  @override
  State<DiagnossScreen> createState() => _DiagnossScreenState();
}

class _DiagnossScreenState extends State<DiagnossScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:BlocConsumer<AppCubit,AppState>(
        listener: (context,state){

        },
        builder: (context,state){
          return Container(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                const SizedBox(height: 10,),
                const Text('Diseases',style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.green
                ),),

                const SizedBox(height: 10,),
                Expanded(

                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 1/1.5,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 5,
                    physics: BouncingScrollPhysics(),
                    children: List.generate(AppCubit.get(context).disease.length, (index) {
                      return InkWell(
                        onTap: (){
                          CashHelper.saveData(key: 'name',value: (AppCubit.get(context).disease[index].Name)!);
                          CashHelper.saveData(key: 'image',value: (AppCubit.get(context).disease[index].image)!);
                          CashHelper.saveData(key: 'Prevention',value: (AppCubit.get(context).disease[index].Prevention)!);
                          CashHelper.saveData(key: 'Solutions',value: (AppCubit.get(context).disease[index].Solutions)!);
                          CashHelper.saveData(key: 'diseased_part',value: (AppCubit.get(context).disease[index].diseased_part)!);
                          CashHelper.saveData(key: 'Symptom_Analysis',value: (AppCubit.get(context).disease[index].Symptom_Analysis)!);
                          Navigator.push(context, MaterialPageRoute(builder: (_){
                            return Diseases_Ditaels();
                          }));
                        },
                        child: Stack(
                          children: [
                            Container(
                              child:
                              Image(image:NetworkImage((AppCubit.get(context).disease[index].image)!)
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,

                            ),
                            Positioned(
                              child: Container(
                                color: Colors.black.withOpacity(.5),
                                padding: EdgeInsets.only(left: 5),
                                child: Text((AppCubit.get(context).disease[index].Name)!,style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17
                                ),

                                ),
                                width: 80,
                              ),
                              top: 70,

                            ),


                          ],

                        ),
                      );
                    }),
                  ),
                ),

              ],
            ),
          );
        },
      )
    );
  }
}
