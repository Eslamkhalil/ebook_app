import 'package:cloud_firestore/cloud_firestore.dart';


class FirebaseService {
  Future<List<QueryDocumentSnapshot>> getBanners () async{
    CollectionReference banner = FirebaseFirestore.instance.collection('Banner');
    var data =  await banner.get();
    return data.docs;
  }

  Future<List<QueryDocumentSnapshot>> getCategory () async{
    CollectionReference category = FirebaseFirestore.instance.collection('category');
    var categoryData =  await category.get();
    return categoryData.docs;
  }

  Future<List<QueryDocumentSnapshot>> getPopular () async{
    CollectionReference popular = FirebaseFirestore.instance.collection('popular');
    var popularData =  await popular.get();
    return popularData.docs;
  }
}
