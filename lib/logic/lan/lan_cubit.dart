import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_masa_2/logic/lan/lan_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanCubit extends Cubit<LanState> {
  LanCubit() : super(InitLangState());

  static LanCubit get(context) => BlocProvider.of(context);

  bool isEnglish = true;
  void changeLan() {
    emit(ChangeLoanToAr());
    isEnglish = !isEnglish;
    print(isEnglish);
    emit(ChangeLoanToEn());
  }

  bool isDark = true;
bool? storedTHeme;
  void changeTheme() {
    emit(ChangeTHemeModeToDark());
    isDark = !isDark;
    storeThemeMode(isDark);
    getTheme();
    emit(ChangeTHemeModeToLight());
  }

  void storeThemeMode(bool v) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('theme', v);
  }

  Future<bool?> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // print( "the store ${prefs.getBool('theme')}");
    storedTHeme = prefs.getBool('theme');
    return storedTHeme;
  }
}
