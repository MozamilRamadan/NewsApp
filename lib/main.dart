import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/styles/themes.dart';
import 'layout/cubit/theme_states.dart';
import 'layout/cubit/theme_cubit.dart';
import 'shared/bloc_observe.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);
  final bool? isDark;

  MyApp( this.isDark );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>ThemeCubit()..ChangeMode(fromshared: isDark,)),
        BlocProvider(create: (context) =>NewsCubit()..getBusiness()..getSports()..getScience()),
      ],
      child: BlocConsumer<ThemeCubit , ThemeCubitStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeCubit.get(context).isDark? ThemeMode.light : ThemeMode.dark,
            home: const NewsLayoutScreen(),
          );
        },
        listener: (context, state) {

        },),
    );
  }
}


