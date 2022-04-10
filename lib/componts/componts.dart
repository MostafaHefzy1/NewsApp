
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modules/webvies.dart';

Widget buildcompontsjson(articles,context)=>

InkWell(
  onTap: ()
  {
    Navigator.push(context,
        MaterialPageRoute(builder:(context)=>webViewScreen(articles['url'])) ,
    );

  },
  child:   Padding(

  padding: const EdgeInsets.all(20.0),

  child: Row(

  children: [

  Container(

  width: 120,

  height: 120,

  decoration: BoxDecoration(

  borderRadius: BorderRadius.circular(10.0)   ,

  image: DecorationImage(

  image: NetworkImage(

  '${articles['urlToImage']}',

  )  ,

  fit: BoxFit.cover   ,

  ),

  ),

  )  ,

  SizedBox(

  width: 20,

  ),

  Expanded(

  child: Container(

  height: 120.0,

  child: Column(

  crossAxisAlignment: CrossAxisAlignment.start ,

  mainAxisAlignment: MainAxisAlignment.start,



  children: [

  Expanded(

  child: Text(

    '${articles['title']}',

  style:Theme.of(context).textTheme.bodyText1 ,

  maxLines: 3,

  overflow:TextOverflow.ellipsis,

  ),



  ) ,

  Text(

    '${articles['publishedAt']}',

  style:TextStyle(

  color: Colors.grey ,

  ),

  ) ,



  ],

  ),

  ),

  ) ,

  ],

  ),

  ),
);


Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);


Widget artcicalBulider(list,context)=> ConditionalBuilder(
    condition: list.length>0 ,
    builder: (context)=>ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) =>buildcompontsjson(list[index],context),
        separatorBuilder: (context, index)=>myDivider(),
        itemCount: 10

    ),
    fallback: (context)=>Center(
        child: CircularProgressIndicator(

        )
    )
);

//defultTextFormField
Widget defultTextFormField
    (
    {
      required  TextInputType type ,
      required TextEditingController Emailcontroll ,
      required  String ?Function(String ?val ) validate  ,
      required String text ,
      required IconData ?predix_Icon  ,
      IconData ?Suffix_Icon  ,
      bool ispassword  = false  ,
      Function ?  Suffix_Function ,
      Function ?on_Tap ,
      required Function ?on_change(String) ,


    }
    ) =>

    TextFormField(

      onTap:(){
        on_Tap!=null ? on_Tap() :'' ;
      },
      keyboardType:type,
      controller: Emailcontroll ,

      obscureText:ispassword  ,
      onChanged:(String)
      {
        on_change(String) ;
      },
      validator: (value)
      {
        return validate (value)  ;
      } ,
      decoration:InputDecoration(
        labelText:'$text' ,
        prefixIcon: Icon(
          predix_Icon  ,
        ),
        suffixIcon: Suffix_Icon!=null ? IconButton (

          icon: Icon(Suffix_Icon),
          onPressed:(){
            Suffix_Function!() ;
          },
        ) : null ,
        border:OutlineInputBorder() ,


      ),

    ) ;
