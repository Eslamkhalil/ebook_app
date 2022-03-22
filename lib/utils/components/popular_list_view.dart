import 'package:flutter/material.dart';

import '../../models/popular_model.dart';

class PopularListView extends StatelessWidget {
  PopularListView({Key? key, required this.popularList}) : super(key: key);

  List<PopularModel> popularList = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.0,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              buildCategoryItem(popularList[index]),
          separatorBuilder: (context, index) => const SizedBox(width: 16.0),
          itemCount: popularList.length),
    );
  }

  Widget buildCategoryItem(PopularModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 200.0,
            width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.black,
            ),
            child: Image(
              image: NetworkImage(
                model.bookImage!,
              ),
              fit: BoxFit.cover,
            ),
          ), const SizedBox(
            height: 4.0,
          ),
          const Text(
            'book name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          const Text(
            'book title',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
