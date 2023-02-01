import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/theme_states.dart';
import '../../shared/network/local/cache_helper.dart';
class ThemeCubit extends Cubit<ThemeCubitStates>{
  ThemeCubit() : super(InitialNewsStateB());

  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void ChangeMode({bool? fromshared}){
    if(fromshared != null) {
       isDark = fromshared;
      emit(ChangeAppMode());
    } else {
      isDark = !isDark;
      CacheHelper.setData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeAppMode());
      });
    }
  }
}