
import 'package:flutter/material.dart';

import '../../models/popular_model.dart';

class CategoryBooks extends StatelessWidget {
  CategoryBooks({Key? key}) : super(key: key);
  final List<PopularModel> popularList = [
    PopularModel(
        bookImage:
            'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
            'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
            'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
            'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
            'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
            'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
            'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
            'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
        'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
        'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
        'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
        'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
        'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
        'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
        'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
        'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
        'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
        'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
        'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
        'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
    PopularModel(
        bookImage:
        'https://www.rd.com/wp-content/uploads/2019/11/heart-book-e1574702487427-scaled.jpg?resize=768,697'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,

          childAspectRatio: 0.7),
      itemBuilder: (context, index) => buildCategoryItem(popularList[index]),
      itemCount: popularList.length,
    );
  }

  Widget buildCategoryItem(PopularModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image(

        image: NetworkImage(
          model.bookImage!,
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
