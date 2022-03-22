
import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import '../../utils/components/category_books.dart';

class BookByCategory extends StatelessWidget {
   BookByCategory({Key? key, required this.modelData}) : super(key: key);
  CategoryModel modelData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:SafeArea(
        child: ListView(
          primary: true,
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20.0),
                      image:  DecorationImage(
                        image: NetworkImage(
                            modelData.image!
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                   Text(
                    modelData.title!,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

           /* const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Category Books',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.1,
                  fontSize: 24,
                ),
              ),
            ),*/
            CategoryBooks(),

          ],
        ),
      )
    );
  }
}
