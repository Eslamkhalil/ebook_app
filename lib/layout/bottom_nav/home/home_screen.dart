import 'package:ebook_app/modules/home_screen/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modules/home_screen/cubit/states.dart';
import '../../../utils/components/category_list_view.dart';
import '../../../utils/components/for_you_list_view.dart';
import '../../../utils/components/popular_list_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit()
        ..getAllBanners()
        ..getAllCategories()
        ..getAllPopulars(),
      child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
          builder: (context, state) {
            var cubit = HomeScreenCubit.get(context);
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                state is HomeScreenLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const SizedBox(
                        height: 20.0,
                      ),
                CarouselSlider(
                  items: cubit.banner
                      .map((e) => Center(
                            child: Image(
                                image:
                                    NetworkImage(e.image ?? 'No Image found'),
                                fit: BoxFit.cover),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    reverse: false,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                    aspectRatio: 1.0,
                    initialPage: 0,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'CATEGORIES',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1,
                      fontSize: 24,
                    ),
                  ),
                ),
                CategoryListView(data: cubit.category),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'RECOMMENDED FOR YOU',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1,
                      fontSize: 18,
                    ),
                  ),
                ),
                PopularListView(
                  popularList: cubit.popular,
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'POPULAR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1,
                      fontSize: 24,
                    ),
                  ),
                ),
                ForYouListView(),
              ],
            );
          },
          listener: (context, state) {}),
    );
  }
}
