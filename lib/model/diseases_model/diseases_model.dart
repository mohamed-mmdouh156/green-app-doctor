class DiseaseModel {
  String? Name;
  String? Prevention;
  String? Solutions;
  String? Symptom_Analysis;
  String? diseased_part;
  String? image;


  DiseaseModel({
    this.Name,
    this.Prevention,
    this.Solutions,
    this.Symptom_Analysis,
    this.diseased_part,
    this.image,

  });
  DiseaseModel.fromjson(Map<String , dynamic> json){
    Name = json['Name'];
    Prevention = json['Prevention'];
    Solutions = json['Solutions'];
    Symptom_Analysis = json['Symptom Analysis'];
    diseased_part =json['diseased part'];
    image = json['image'];
  }
  Map<String , dynamic> toMap (){
    return {
      'Name' : Name,
      'Prevention' :Prevention,
      'Solutions' : Solutions,
      'Symptom Analysis' : Symptom_Analysis,
      'diseased part' : diseased_part,
      'image' : image,
    };
  }
}
