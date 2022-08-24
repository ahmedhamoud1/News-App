import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/component.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class Health_Screen extends StatelessWidget {
  const Health_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, Object? state){},
      builder: ( BuildContext context, state)
      {
        var list = NewsCubit.get(context).Health;
        return ConditionalBuilder(
          condition: list.length > 0,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index) => BuildArticlesItem(list[index], context) ,
            separatorBuilder: (context,index) => Container(
              width: double.infinity,
              height: 1,
              color: Color(0xff000739).withOpacity(0.1),
            ) ,
            itemCount: list.length,
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(
              color: Colors.grey[200] ,
            ),
          ),
        );
      },
    );
  }
}
