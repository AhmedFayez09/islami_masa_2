import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_masa_2/logic/lan/lan_cubit.dart';
import 'package:islami_masa_2/logic/lan/lan_state.dart';
import 'package:islami_masa_2/widgets/setting_widget/lan_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LanWidget(),
        BlocBuilder<LanCubit, LanState>(
          builder: (context, state) {
            var cubit = LanCubit.get(context);
            return ListTile(
              title: Text("المظهر",style: Theme.of(context).textTheme.labelMedium,),
              onTap: () {
                cubit.changeTheme();
              },
            );
          },
        )
      ],
    );
  }
}
