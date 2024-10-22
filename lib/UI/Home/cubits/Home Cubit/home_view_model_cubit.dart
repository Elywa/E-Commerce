import 'package:bloc/bloc.dart';
import 'package:e_commerce/UI/Home/tabs/favourite%20tab/favourite_tab_view.dart';
import 'package:e_commerce/UI/Home/tabs/home%20tab/home_tab_view.dart';
import 'package:e_commerce/UI/Home/tabs/Categories%20tab/categories_tab.dart';
import 'package:e_commerce/UI/Home/tabs/profile%20tab/profile_tab_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_view_model_state.dart';

class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  HomeViewModelCubit() : super(HomeInitialState());

  int selectedIndex = 0;
  List<Widget> tabs = [
    const HomeTabView(),
    const CategoriesTabView(),
    const FavouriteTabView(),
    const ProfileTabView(),
  ];

  void changeTab(int index) {
    emit(HomeInitialState());
    selectedIndex = index;
    emit(HomeChangeTabState());
  }
}
