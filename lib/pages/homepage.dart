import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/blocs/bloc/navigate_navbar_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final botnavBloc = context.read<NavigateNavbarBloc>();
    return Scaffold(
      body: context
          .watch<NavigateNavbarBloc>()
          .widgets
          .elementAt(botnavBloc.state.index),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          onTap: (value) {
            botnavBloc.add(ChangeNavbarEvent(newIndex: value));
          },
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                label: '',
                icon: Stack(
                  children: <Widget>[
                    Container(
                        height: 50,
                        width: 30,
                        child: Image.asset('assets/images/home.png')),
                  ],
                )),
            BottomNavigationBarItem(
                label: '',
                icon: Stack(
                  children: <Widget>[
                    Container(
                        height: 50,
                        width: 30,
                        child: Image.asset('assets/images/search.png')),
                  ],
                )),
            BottomNavigationBarItem(
                label: '',
                icon: Stack(
                  children: <Widget>[
                    Container(
                        height: 50,
                        width: 30,
                        child: Image.asset('assets/images/video.png')),
                  ],
                )),
            BottomNavigationBarItem(
                label: '',
                icon: Stack(
                  children: <Widget>[
                    Container(
                        height: 50,
                        width: 30,
                        child: Image.asset('assets/images/shop.png')),
                  ],
                )),
            BottomNavigationBarItem(
                label: '',
                icon: Stack(
                  children: <Widget>[
                    Container(
                        height: 50,
                        width: 30,
                        child: CircleAvatar(
                          child: ClipOval(
                            child: Image.asset(
                                fit: BoxFit.cover,
                                'assets/images/profilepict.jpg'),
                          ),
                        )),
                    Positioned(
                      bottom: 1,
                      right: 13,
                      child: Icon(Icons.brightness_1,
                          size: 6, color: Colors.redAccent),
                    )
                  ],
                ))
          ]),
    );
  }
}
