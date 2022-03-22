import 'package:ebook_app/modules/home_screen/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/category_model.dart';
import '../../../modules/home_screen/cubit/states.dart';
import '../../../utils/components/shared/my_divider.dart';

class CategoriseScreen extends StatelessWidget {
  CategoriseScreen({Key? key}) : super(key: key);
  final List<CategoryModel> data = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit()..getAllCategories(),
      child: BlocConsumer<HomeScreenCubit,HomeScreenState>(
          builder: (context, state) {
            var cubit= HomeScreenCubit.get(context);
            return ListView(
              children: [
                /* Stack(
          children: [
            Container(
              height: 250.0,
              color: Colors.white,
            ),
            ShaderMask(shaderCallback: (rect) {
              return const LinearGradient(
                      begin: Alignment.topLeft,
                      colors: [Colors.white, Colors.transparent],
                      end: Alignment.bottomLeft)
                  .createShader(Rect.fromLTRB(0, 100, rect.width, rect.height));
            },
              blendMode: BlendMode.dstIn,
              child: const Image(
                height: 300.0,
                width:double.infinity,
                fit: BoxFit.cover,
                image: NetworkImage(
                'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1466368392l/30651156._SY475_.jpg',
              ),),

            ),
          ],
        ),*/

                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                  child: MyDivider(),
                ),
                const SizedBox(height: 16.0),
                GridView.builder(
                  primary: false,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      mainAxisExtent: 140,
                      childAspectRatio: 1),
                  itemBuilder: (context, index) =>
                      buildCategoryItem(cubit.category[index]),
                  itemCount: cubit.category.length,
                ),
              ],
            );
          },
          listener: (context, state) {}),
    );
  }

  Widget buildCategoryItem(CategoryModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(25.0),
              image: DecorationImage(
                image: NetworkImage(
                  model.image!,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          Text(
            model.title!,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
