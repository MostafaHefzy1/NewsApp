import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';

import '../componts/componts.dart';

class searchScreen extends StatelessWidget {
  //const searchScreen({Key? key}) : super(key: key);

  var searchcontroll = TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit , NewsStates>(
      listener: (context , state) {} ,
      builder: (context , state)
      {
        var list = Newscubit.get(context).search ; 
        return  Scaffold(
          appBar: AppBar(),
          body: Column(
            children:
            [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defultTextFormField(
                  on_change:(value)
                  {
                      Newscubit.get(context).getDatasearch(value) ;
                  },
                  Emailcontroll: searchcontroll ,
                  type: TextInputType.text ,
                  text:'Search' ,
                  validate: (value)
                  {
                    if(value==null||value.isEmpty)
                      return 'Search must not be empty' ;
                    return null ;
                  } ,
                  predix_Icon: Icons.search  ,
                ),
              ),
              Expanded(
                  child: artcicalBulider(list,context)
              ) ,



            ],
          ),
        );
      } ,

    );
  }
}
