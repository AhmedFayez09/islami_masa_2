import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_masa_2/logic/lan/lan_cubit.dart';
import 'package:islami_masa_2/logic/lan/lan_state.dart';
import 'package:islami_masa_2/screens/quran_screen.dart';
import 'package:islami_masa_2/screens/sepha_screen.dart';
import 'package:islami_masa_2/screens/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = 'layoutScreen';

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;
  List<Widget> screen = [
    QuranScreen(),
    Container(
      color: Colors.red,
    ),
    SephaScreen(),
    Container(
      color: Colors.grey,
    ),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocProvider.of<LanCubit>(context).isDark
            ? Image.asset(
                'assets/images/lauout_background_dark.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              )
            : Image.asset(
                'assets/images/layout_background.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.islami,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          bottomNavigationBar: BlocBuilder<LanCubit, LanState>(
            builder: (context, state) {
              return BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (current) {
                  selectedIndex = current;
                  setState(() {});
                },
                backgroundColor: Theme.of(context).primaryColor,
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: const TextStyle(color: Colors.black),

                useLegacyColorScheme: false,
                items: [
                  bottomNavigationBarItem(
                    imageSuraName: 'quran_icon',
                    suraName: 'القران الكريم',
                    color: selectedIndex == 0
                        ? context.read<LanCubit>().isDark == true
                            ? Theme.of(context).focusColor
                            : Colors.black
                        : Colors.white,
                  ),
                  bottomNavigationBarItem(
                    imageSuraName: 'ahdth_icon',
                    suraName: 'أحاديث',
                    color: selectedIndex == 1
                        ? context.read<LanCubit>().isDark == true
                            ? Theme.of(context).focusColor
                            : Colors.black
                        : Colors.white,
                  ),
                  bottomNavigationBarItem(
                    imageSuraName: 'sebha_icon',
                    suraName: 'سبحة',
                    color: selectedIndex == 2
                        ? context.read<LanCubit>().isDark == true
                            ? Theme.of(context).focusColor
                            : Colors.black
                        : Colors.white,
                  ),
                  bottomNavigationBarItem(
                    imageSuraName: 'radio_icon',
                    suraName: 'الاذاعة',
                    color: selectedIndex == 3
                        ? context.read<LanCubit>().isDark == true
                            ? Theme.of(context).focusColor
                            : Colors.black
                        : Colors.white,
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.settings,
                        color: selectedIndex == 4
                        ? context.read<LanCubit>().isDark == true
                            ? Theme.of(context).focusColor
                            : Colors.black
                        : Colors.white,
                      ),
                      label: 'الاعدادت'),
                ],
              );
            },
          ),
          body: screen[selectedIndex],
        ),
      ],
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(
          {required String imageSuraName,
          required String suraName,
          required Color color}) =>
      BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/$imageSuraName.png',
            height: 30,
            color: color,
          ),
          label: suraName);
}




/***
 * ,
     
     
     
     
 */