import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../componts/componts.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class SecinesScreen extends StatelessWidget {
  const SecinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Newscubit , NewsStates>(
      listener:(context, state) {},
      builder:(context  , state)
      {
        var list = Newscubit.get(context).science ;
        return  artcicalBulider(list,context) ;

      },
    );
  }
}
