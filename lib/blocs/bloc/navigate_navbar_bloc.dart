import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/partials/home.dart';
import 'package:instagram_clone/data/partials/profile.dart';
import 'package:instagram_clone/data/partials/shop.dart';
import 'package:instagram_clone/data/partials/search.dart';
import 'package:instagram_clone/data/partials/video.dart';

part 'navigate_navbar_event.dart';
part 'navigate_navbar_state.dart';

class NavigateNavbarBloc
    extends Bloc<NavigateNavbarEvent, NavigateNavbarState> {
  List<Widget> widgets = [
    const HomeWidget(),
    const SearchWidget(),
    const VideoWidget(),
    const ShopWidget(),
    const ProfileWidget(),
  ];
  NavigateNavbarBloc() : super(NavigateNavbarState.initial()) {
    on<ChangeNavbarEvent>((event, emit) {
      emit(state.copyWith(index: event.newIndex));
    });
  }
}

class IsSelectedBloc extends Bloc<IsSelectedEvent, IsSelectedState> {
  IsSelectedBloc() : super(IsSelectedState.initial()) {
    on<IsSelectedEvent>((event, emit) {
      emit(state.copyWith(indSelected: event.indSelected));
    });
  }
}
