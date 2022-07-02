class NoteModel {
  String? title;
  String? description ;
  String? time;


  NoteModel ({
    required this.title ,
    required this.description ,
    required this.time ,

  });

  NoteModel.fromFire(Map <String , dynamic> fire){
    title = fire['title'];
    description = fire['description'];
    time = fire['time'];

  }

  Map <String , dynamic> toMap ()
  {
    return{
      'title' : title,
      'description' : description,
      'time' : time,

    };
  }

}