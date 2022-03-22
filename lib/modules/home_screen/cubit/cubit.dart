import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook_app/models/banner_model.dart';
import 'package:ebook_app/models/popular_model.dart';
import 'package:ebook_app/modules/home_screen/cubit/states.dart';
import 'package:ebook_app/network/remote/firebase/firebase_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import '../../../layout/bottom_nav/categorise/categorise_screen.dart';
import '../../../layout/bottom_nav/home/home_screen.dart';
import '../../../models/category_model.dart';
import '../../book_details/book_details.dart';
import '../../favorite_screen/favorites.dart';
import '../../profile_screen/profile_screen.dart';

class HomeScreenCubit extends Cubit<HomeScreenState>{
  HomeScreenCubit( ) : super(HomeScreenInitialState());


  static HomeScreenCubit get (context) => BlocProvider.of(context);
List<BannerModel> banner = [];
List<CategoryModel> category = [];
List<PopularModel> popular = [];


  int currentIndex = 0;



  List<Widget> screens = [
     HomeScreen(),
    CategoriseScreen(),
    const BookDetails(),
    UserProfile(),
  ];

  void changeIndex(int index){
    currentIndex = index;
    emit(HomeScreenOnBottomNavChangeState());
  }

  getAllBanners() async {
    emit(HomeScreenLoadingState());
    await FirebaseService().getBanners().then((value) => {
      for (int i = 0; i < value.length; i++){
        banner.add(BannerModel.fromJson(value[i].data() as Map<String, dynamic>)),

      },
      emit(HomeScreenSuccessGetBannerState()),

    }).catchError((onError){
      emit(HomeScreenErrorGetBannerState(onError));
    });
  }
  getAllCategories() async {
    emit(HomeScreenLoadingState());
    await FirebaseService().getCategory().then((value) => {
      for (int i = 0; i < value.length; i++){
        category.add(CategoryModel.fromJson(value[i].data() as Map<String, dynamic>)),
        print(category[i].image),
      },
      emit(HomeScreenSuccessGetCategoryState()),

    }).catchError((onError){
      emit(HomeScreenErrorGetCategoryState(onError));
    });
  }
  getAllPopulars() async {
    emit(HomeScreenLoadingState());
    await FirebaseService().getPopular().then((value) => {
      for (int i = 0; i < value.length; i++){
        popular.add(PopularModel.fromJson(value[i].data() as Map<String, dynamic>)),
        print(popular[i].bookImage),
      },
      emit(HomeScreenSuccessGetPopularState()),

    }).catchError((onError){
      emit(HomeScreenErrorGetPopularState(onError));
    });
  }


}