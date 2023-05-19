import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'navigate_navbar_event.dart';
part 'navigate_navbar_state.dart';

class NavigateNavbarBloc
    extends Bloc<NavigateNavbarEvent, NavigateNavbarState> {
  List<Widget> widgets = [
    Center(
      child: Text('Home'),
    ),
    Center(
      child: Text('Search'),
    ),
    Center(
      child: Text('Video'),
    ),
    Center(
      child: Text('Shop'),
    ),
    Center(
      child: Text('Profie'),
    ),
  ];
  NavigateNavbarBloc() : super(NavigateNavbarState.initial()) {
    on<ChangeNavbarEvent>((event, emit) {
      emit(state.copyWith(index: event.newIndex));
    });
  }
}
