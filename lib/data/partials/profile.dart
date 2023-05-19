import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/blocs/bloc/navigate_navbar_bloc.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          'mdutchand',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        IconButton(
                          icon: Icon(Icons.keyboard_arrow_down_outlined),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add_box_outlined),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.format_list_bulleted),
                        onPressed: () {},
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 95,
                        height: 95,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(254, 205, 0, 1),
                              Color.fromARGB(255, 249, 55, 63),
                              Color.fromARGB(255, 201, 19, 185),
                            ])),
                      ),
                      Container(
                          width: 88,
                          height: 88,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/profilepict.jpg')),
                            border: Border.all(color: Colors.white, width: 3),
                            borderRadius: BorderRadius.circular(60),
                          )),
                    ],
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      infoProfile(title: 'Posts', count: '1,234'),
                      infoProfile(title: 'Followers', count: '5,678'),
                      infoProfile(title: 'Following', count: '9,123'),
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Muhamad Duta Chandra',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[200]),
                              onPressed: () {},
                              child: Text(
                                  style: TextStyle(color: Colors.black),
                                  'Edit Profil')),
                        )),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[200]),
                            onPressed: () {},
                            child: Text(
                              'Bagikan Profil',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[200]),
                            onPressed: () {},
                            child: Icon(
                              Icons.group_add_outlined,
                              color: Colors.black,
                            )),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Sorotan Cerita',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 120,
                  child: ScrollConfiguration(
                    behavior:
                        const ScrollBehavior().copyWith(overscroll: false),
                    child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return StoryProfile(
                            title: 'Story ${index + 1}',
                            img: 'https://picsum.photos/300/300?random=$index');
                      },
                    ),
                  )),
              SizedBox(
                height: 6,
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            context.watch<IsSelectedBloc>().state.indSelected ==
                                    0
                                ? BorderSide(color: Colors.black, width: 1)
                                : BorderSide(color: Colors.white))),
                child: IconButton(
                    iconSize: 30,
                    onPressed: () {
                      context
                          .read<IsSelectedBloc>()
                          .add(IsSelectedEvent(indSelected: 0));
                    },
                    icon: Icon(Icons.grid_on)),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            context.watch<IsSelectedBloc>().state.indSelected ==
                                    0
                                ? BorderSide(color: Colors.white)
                                : BorderSide(color: Colors.black, width: 1))),
                child: IconButton(
                    iconSize: 30,
                    onPressed: () {
                      context
                          .read<IsSelectedBloc>()
                          .add(IsSelectedEvent(indSelected: 1));
                    },
                    icon: Icon(Icons.person_pin_outlined)),
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 60,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 2, crossAxisSpacing: 2),
          itemBuilder: (context, index) =>
              Image.network('https://picsum.photos/300/300?random=$index'),
        )
      ],
    ));
  }
}

class StoryProfile extends StatelessWidget {
  const StoryProfile({
    required this.title,
    required this.img,
    super.key,
  });
  final String title;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 19),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(img)),
                border: Border.all(color: Colors.grey.shade200, width: 3),
                borderRadius: BorderRadius.circular(60),
              )),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 80,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 1,
              softWrap: false,
            ),
          )
        ],
      ),
    );
  }
}

class infoProfile extends StatelessWidget {
  const infoProfile({required this.title, required this.count, super.key});

  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(3),
          child: Text(
            count,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Text(title)
      ],
    );
  }
}
