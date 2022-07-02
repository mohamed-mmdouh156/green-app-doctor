import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenappdoctor/layouts/homePageLayout/cubit_cubit.dart';
import 'package:greenappdoctor/model/notes_model/notes_model.dart';
import 'package:greenappdoctor/modules/caring_screen/show_notes.dart';
import 'package:intl/intl.dart';

class CaringScreen extends StatefulWidget {
  const CaringScreen({Key? key}) : super(key: key);

  @override
  State<CaringScreen> createState() => _CaringScreenState();
}

class _CaringScreenState extends State<CaringScreen> {


  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> AppCubit(),
      child: BlocConsumer<AppCubit , AppState>(
        listener: (context , state){},
        builder: (context , state){
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, 'HomePageLayout');
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: (){
                      showModalBottomSheet(context: context, builder: (_){
                        return Container(
                          height: MediaQuery.of(context).size.height*.09,
                          alignment: Alignment.centerLeft,
                          color: Colors.grey[200],
                          child: TextButton(
                            child: const Text('Show Notes',style: TextStyle(
                              fontSize: 17,
                              color: Colors.teal,
                            ),
                              textAlign: TextAlign.start,
                            ),
                            onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                return const ShowNotes();
                              }));
                            },
                          ),
                        );
                      });
                    },
                    icon: const Icon(
                        Icons.more_vert_rounded
                    )
                )
              ],
              elevation: 2,
              titleSpacing: 0,
              backgroundColor: Colors.teal,
              title: const Text('Plant Care', style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              )),
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(height: 6,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0,0, 0),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('Add Notes :',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Title',
                          hintStyle: const TextStyle(
                              fontSize: 22,
                              color: Colors.grey
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2,color: Colors.teal),
                              borderRadius: BorderRadius.circular(7)
                          ),

                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2,color: Colors.teal),
                              borderRadius: BorderRadius.circular(7)
                          ),
                        ),
                        controller: titleController,
                        style: const TextStyle(
                          fontSize: 19,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Description',
                          hintStyle: const TextStyle(
                              fontSize: 22,
                              color: Colors.grey
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2,color: Colors.teal),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 2,color: Colors.teal),
                              borderRadius: BorderRadius.circular(7)
                          ),
                        ),

                        maxLines: 10,
                        controller: descriptionController,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.teal,
                        ),


                      ),
                    ),
                    const SizedBox(height: 25,),
                    Container(
                      height: 60,
                      width: 120,
                      child: MaterialButton(
                        elevation: 2,
                        color: Colors.teal,
                        padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onPressed: (){
                          NoteModel model = NoteModel(title: titleController.text, description: descriptionController.text, time: DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()));
                          AppCubit.get(context).addNote(model);
                          titleController.text = "";
                          descriptionController.text = "";
                        },
                        child: const Text('Add',style: TextStyle(
                            color: Colors.white,
                            fontSize: 17
                        ),),
                      ),
                    ),
                  ],
                ),

              ),
            ),
          );
        },

      ),
    );
  }
}
