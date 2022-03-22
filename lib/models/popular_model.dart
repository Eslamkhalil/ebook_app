

class PopularModel{

  String? bookImage;
  String? bookPath;

  PopularModel({this.bookImage, this.bookPath});

  PopularModel.fromJson(Map<String, dynamic> json){
    if(json == null){
      return;
    }
    bookImage = json['bookImage'];
    bookPath = json['bookPath'];

  }

  toJson(){
    return {
      'bookImage':bookImage,
      'bookPath':bookPath,
    };
  }
}