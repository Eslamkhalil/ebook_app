

import 'package:ebook_app/utils/components/shared/constants.dart';
import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import '../../modules/book_by_category/book_by_category.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({Key? key ,required this.data }) : super(key: key);
  //CategoryListView(this.data): super(key: key);
    List<CategoryModel> data =[];
   /*List<CategoryModel> data = [
    CategoryModel(
        title: 'love',
        image:
            'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    CategoryModel(
        title: 'love',
        image:
            'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    CategoryModel(
        title: 'love',
        image:
            'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    CategoryModel(
        title: 'love story',
        image:
            'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    CategoryModel(
        title: 'love',
        image:
            'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
  ];*/

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child:  ListView.separated(

          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => buildCategoryItem(data[index],context),
          separatorBuilder: (context, index) => const SizedBox(width: 8.0),
          itemCount: data.length),
    );
  }

  Widget buildCategoryItem(CategoryModel model , context) {
    return GestureDetector(
      onTap: (){
        navigateTo(context: context, widget: BookByCategory(modelData: model,));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical:0.0),
        child: Container(
          width: 120.0,
          height: 200.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image(
                height: 200.0,
                width: 120.0,

                image: NetworkImage(
                  model.image!,

                ),
                fit: BoxFit.fill,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                ),
                child: Text(
                  model.title!,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style:
                      const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500,color: Colors.white,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
