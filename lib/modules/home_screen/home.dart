import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeScreenCubit(),
      child: BlocConsumer<HomeScreenCubit,HomeScreenState>(
          builder: (context, state) {
            var cubit = HomeScreenCubit.get(context);
            return Scaffold(
              body: SafeArea(child: cubit.screens[cubit.currentIndex]),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                type: BottomNavigationBarType.fixed,
                onTap: (index) => cubit.changeIndex(index),
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.apps), label: 'category'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_border),
                      label: 'favorite_screen'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline_outlined),
                      label: 'profile'),
                ],
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
