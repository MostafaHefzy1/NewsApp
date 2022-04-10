import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';

import '../componts/componts.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit , NewsStates>(
      listener:(context, state) {},
      builder:(context  , state)
      {
        var list = Newscubit.get(context).business ;
        return  artcicalBulider(list,context) ;

      },
    );

  }
}
