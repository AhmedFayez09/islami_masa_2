import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_masa_2/logic/lan/lan_cubit.dart';
import 'package:islami_masa_2/logic/lan/lan_state.dart';

class ModelButtomSheetLan extends StatelessWidget {
  const ModelButtomSheetLan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        height: 400,
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: BlocBuilder<LanCubit, LanState>(
          builder: (context, state) {
            var cubit = LanCubit.get(context);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    if (cubit.isEnglish == true) {
                      cubit.changeLan();
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    "اللغة العربية ",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: cubit.isEnglish == true
                            ? Colors.black
                            : Theme.of(context).hoverColor),
                  ),
                ),
                InkWell(
                    onTap: () {
                      if (cubit.isEnglish == false) {
                        cubit.changeLan();
                      }
                      Navigator.pop(context);
                    },
                    child: Text(
                      "اللغة الانجليزية",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: cubit.isEnglish == false
                              ? Colors.black
                              : Theme.of(context).hoverColor),
                    ))
              ],
            );
          },
        ));
  }
}
