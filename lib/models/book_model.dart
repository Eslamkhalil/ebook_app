class BookModel {
  String? id;
  String? name;
  String? title;
  String? numberOfPage;
  String? language;
  String? description;
  String? category;
  String? pdfAsset;
  bool? isFavorite;
  bool? isPopular;
  bool? isRecommended;

  BookModel(
      {this.id,
      this.name,
      this.title,
      this.numberOfPage,
      this.language,
      this.description,
      this.category,
      this.isFavorite= false,
      this.isPopular =false,
      this.isRecommended = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'numberOfPage': numberOfPage,
      'language': language,
      'description': description,
      'category': category,
      'isFavorite': isFavorite,
      'isPopular': isPopular,
      'isRecommended': isRecommended,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      numberOfPage: json['numberOfPage'] ,
      language: json['language'] ,
      description: json['description']  ,
      category: json['category']  ,
      isFavorite: json['isFavorite']  ,
      isPopular: json['isPopular']  ,
      isRecommended: json['isRecommended']  ,
    );
  }
}
