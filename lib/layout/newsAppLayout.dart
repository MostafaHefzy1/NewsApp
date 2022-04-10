import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/modules/settings.dart';
import 'package:newsapp/network/global/dio.dart';

import '../modules/search.dart';

class NewsLauout extends StatelessWidget {
  const NewsLauout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<Newscubit , NewsStates>(
      listener: (context, state) {} ,
      builder: (context , state)
      {
      var cubit  = Newscubit.get(context) ;
      return Scaffold(
      appBar:AppBar(
      title: Text(
      'News App' ,
      ),
      actions:
      [
        IconButton(onPressed:()
        {
          Navigator.push(context,
              MaterialPageRoute(builder:(context) => searchScreen()
              ) ,
          ) ;
        },
            icon:Icon(
                Icons.search
            ) ,
        ) ,
        IconButton(
        onPressed:()
        {
          cubit.setupDesktop() ;
        },
            icon: Icon(
         Icons.nightlight_round,
      ) ,

      )
      ],
      ),
      body:cubit.Screens[cubit.currentIndex],
      bottomNavigationBar:BottomNavigationBar(
      currentIndex: cubit.currentIndex,
      onTap: (index)
      {
          cubit.changBottomNav(index) ;
      },
      items:cubit.BottomItems,
      ),
      )  ;

      } ,
    );
  }
}

