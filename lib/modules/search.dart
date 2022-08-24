import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/components/component.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/cubit/states.dart';

class Search_Screen extends StatelessWidget {

  var searchController = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state)
      {
        var list = NewsCubit.get(context).search;
        return  Scaffold(
          appBar: AppBar(),
          body: Form(
            key: FormKey,
            child: Column(
              children:
              [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (value)
                    {
                      NewsCubit.get(context).Search(value);
                    },
                    onTap: (){},
                    keyboardType: TextInputType.text,
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'INVALID DATA';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),

                    ),
                  ),
                ),
                Expanded(child: articleBuilder(list, context)),
              ],
            ),
          ),
        );
      },
    );
  }
}
