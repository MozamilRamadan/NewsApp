import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import '../../shared/components/components.dart';

class Search_Screen extends StatelessWidget {
//  const Search_Screen({Key? key}) : super(key: key);
   var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener:(context, state) {},
        builder: (context, state) {

          var cubit  = NewsCubit.get(context);
          var list = cubit.search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: searchController,
                        onChanged: (value){
                          cubit.getSearch(value);
                        },
                        keyboardType: TextInputType.text,
                        validator: (String? value){
                          if(value!.isEmpty){
                            print('Type To Search');
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label:Text('Search'),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.search_rounded),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(child: articleBuilder(list,context)),
              ],
            )
          );
        }, );

  }
}
