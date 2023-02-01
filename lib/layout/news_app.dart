import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/search/search.dart';
import '../shared/components/components.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';
import 'cubit/theme_cubit.dart';

class NewsLayoutScreen extends StatelessWidget {
  const NewsLayoutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(onPressed: (){
                navigateTo(context, Search_Screen());
              }, icon: Icon(Icons.search_rounded,),),
              IconButton(onPressed: (){
                ThemeCubit.get(context).ChangeMode();
              }, icon: Icon(Icons.brightness_4_sharp),),

            ],

          ),
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNav(index);
            },
              items: cubit.bottomItem
          ),
        );
      },

    );
  }
}
