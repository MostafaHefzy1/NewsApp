import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/network/global/dio.dart';
import 'package:newsapp/network/local/cashhelper.dart';

import 'cubit/blocobserve.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'layout/newsAppLayout.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized() ;
  BlocOverrides.runZoned(
        () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init() ;
 await cashHelper.init() ;

 bool? isDark = cashHelper.getData(key: 'isDark') as bool? ;

 runApp(MyApp(isDark??false));


}

class MyApp extends StatelessWidget
{


  final bool  isDark   ;

  MyApp(this.isDark) ;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => Newscubit()..getDataBusiness()..getDatascience()..getDataSports() ..setupDesktop(dark:isDark ,
        ),
        child: BlocConsumer<Newscubit , NewsStates>(
      listener:(context, state) {},
      builder:(context  , state)
      {
       return MaterialApp(
          debugShowCheckedModeBanner:false,
          theme: ThemeData(
            appBarTheme:AppBarTheme(
              color:Colors.white ,
              elevation: 0.0  ,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white ,
                statusBarIconBrightness:Brightness.dark ,

              ),
              titleTextStyle:TextStyle(
                color : Colors.black ,
                fontSize:20 ,
                fontWeight:FontWeight.bold ,
              ) ,
              iconTheme: IconThemeData(
                color: Colors.black   ,

              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type:BottomNavigationBarType.fixed ,
                selectedItemColor:Colors.deepOrange ,
                backgroundColor: Colors.white,
                unselectedItemColor:Colors.grey
            ),
            scaffoldBackgroundColor:Colors.white,
            floatingActionButtonTheme:FloatingActionButtonThemeData(
              backgroundColor: Colors.deepOrange ,
            ),
            primarySwatch: Colors.deepOrange ,
            textTheme: TextTheme(
              bodyText1:TextStyle(
                fontSize:18 ,
                fontWeight: FontWeight.w600 ,
                color: Colors.black   ,
              ),
            ),

          ),
          darkTheme:ThemeData(
            appBarTheme:AppBarTheme(
              color:HexColor('333739'),
              elevation: 0.0  ,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor:HexColor('333739'),
                statusBarIconBrightness:Brightness.light ,

              ),
              titleTextStyle:TextStyle(
                color :Colors.white ,
                fontSize:20 ,
                fontWeight:FontWeight.bold ,
              ) ,
              iconTheme: IconThemeData(
                color: Colors.white   ,

              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type:BottomNavigationBarType.fixed ,
                selectedItemColor:Colors.deepOrange ,
                backgroundColor: HexColor('333739') ,
                unselectedItemColor:Colors.grey
            ),
            floatingActionButtonTheme:FloatingActionButtonThemeData(
              backgroundColor: Colors.deepOrange ,
            ),
            textTheme: TextTheme(
              bodyText1:TextStyle(
                fontSize:18 ,
                fontWeight: FontWeight.w600 ,
                color: Colors.white   ,
              ),
            ),
            primarySwatch: Colors.deepOrange ,
            scaffoldBackgroundColor:HexColor('333739'),
          ),
          themeMode:Newscubit.get(context).isDark ? ThemeMode.dark:ThemeMode.light  ,
          home: NewsLauout(),
        ) ;
      }
    ),
    ) ;
  }
}


/*
BlocProvider(
      create: (BuildContext context) => Newscubit()..setupDesktop(dark:isDark ,
      ),
      ) ,
 */
/*
        create: (BuildContext context) => Newscubit()..getDataBusiness()..getDatascience()..getDataSports() ,

 */