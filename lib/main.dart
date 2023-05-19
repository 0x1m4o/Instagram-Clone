import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/blocs/bloc/navigate_navbar_bloc.dart';
import 'package:instagram_clone/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigateNavbarBloc(),
      child: MaterialApp(
        title: 'Instagram Clone',
        home: HomePage(),
      ),
    );
  }
}
