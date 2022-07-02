
class DataModel2 {
  String? name;
  String? family_name;
  String? description;
  String? hight;
  String? leave_size;
  String? main_color;
  String? propagation;
  String? season_of_interst;
  String? uses;
  String? image;

  DataModel2({
    this.name,
    this.family_name,
    this.description,
    this.hight,
    this.leave_size,
    this.main_color,
    this.propagation,
    this.season_of_interst,
    this.uses,
    this.image,
  });
  DataModel2.fromjson(Map<String , dynamic> json){
    name = json['name'];
    family_name = json['family_name'];
    description = json['description'];
    hight = json['hight'];
    leave_size =json['leave_size'];
    main_color = json['main_color'];
    propagation = json['propagation'];
    season_of_interst = json['season_of_interst'];
    uses = json['uses'];
    image = json['image'];
  }
  Map<String , dynamic> toMap (){
    return {
      'name' : name,
      'family_name' :family_name,
      'description' : description,
      'hight' : hight,
      'leave_size' : leave_size,
      'main_color' : main_color,
      'propagation' : propagation,
      'season_of_interst' : season_of_interst,
      'uses' : uses,
      'image' : image,
    };
    }
  }

