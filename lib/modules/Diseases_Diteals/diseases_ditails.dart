
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenappdoctor/layouts/homePageLayout/cubit_cubit.dart';
import 'package:greenappdoctor/shared/shared_preferences/cash_helper.dart';

class Diseases_Ditaels extends StatelessWidget {
  const Diseases_Ditaels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context,state){
        
      },
      builder: (context,state){
        return
        Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: NetworkImage(CashHelper.getData(key: 'image'))),
                    const SizedBox(height: 10,),
                    const Text('Name',style: TextStyle(
                      color: Colors.green,
                      fontSize: 19,
                      fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 5,),
                    Text(CashHelper.getData(key: 'name'),style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                    ),),
                    const SizedBox(height: 15,),

                    const Text('Prevention',style: TextStyle(
                        color: Colors.green,
                        fontSize: 19,
                        fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 5,),
                    Text(CashHelper.getData(key: 'Prevention'),style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),) ,
                    const SizedBox(height: 15,),

                    const Text('Solutions',style: TextStyle(
                        color: Colors.green,
                        fontSize: 19,
                        fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 5,),

                    Text(CashHelper.getData(key: 'Solutions'),style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),) ,
                    const SizedBox(height: 15,),

                    const Text('diseased_part',style: TextStyle(
                        color: Colors.green,
                        fontSize: 19,
                        fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 5,),

                    Text(CashHelper.getData(key: 'diseased_part'),style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 15,),

                    const Text('Symptom_Analysis',style: TextStyle(
                        color: Colors.green,
                        fontSize: 19,
                        fontWeight: FontWeight.bold
                    ),),
                    const SizedBox(height: 5,),

                    Text(CashHelper.getData(key: 'Symptom_Analysis'),style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),)

                  ],
                ),
              ),
            ),

        ));
      },
    );
  }
}
