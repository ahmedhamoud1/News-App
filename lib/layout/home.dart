import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/cubit/DarkMode.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/cubit/states.dart';
import 'package:news/modules/search.dart';
import 'package:news/network/dio_helper.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        // api search
        // https://newsapi.org/
        // v2/everything
        // ?q=tesla&apiKey=beaf25f8d2f844f8a63df0ef14b7ab5a

        // api data
        // https://newsapi.org/
        // v2/top-headlines
        // ?country=eg&category=business&apiKey=beaf25f8d2f844f8a63df0ef14b7ab5a

        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Search_Screen()));
                  },
                  icon: Icon(
                    Icons.search,
                    size: 22,
                  )),
              BlocConsumer<DarkMode, NewsStates>(
                  listener: (BuildContext context, state) {},
                  builder: (BuildContext context, Object? state) {
                    return IconButton(
                      icon: Icon(
                        Icons.brightness_4_outlined,
                      ),
                      onPressed: () {
                        DarkMode.get(context).ChangeMode();
                      },
                    );
                  }),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.ChangeIndex(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.monetization_on,
                  size: 24,
                ),
                label: 'Economie',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.sports_soccer,
                  size: 24,
                ),
                label: 'Sports',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.science_outlined,
                    size: 24,
                  ),
                  label: 'Science'),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.computer,
                  size: 24,
                ),
                label: 'Techology',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.health_and_safety,
                    size: 24,
                  ),
                  label: 'Health'),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
