import 'package:flutter/material.dart';
import 'package:islami_masa_2/widgets/setting_widget/model_button_sheet_lan.dart';

class LanWidget extends StatelessWidget {
  const LanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return const ModelButtomSheetLan();
          },
        );
      },
      titleAlignment: ListTileTitleAlignment.center,
      title:  Text(
        "اللغة",
        style: Theme.of(context).textTheme.labelMedium
      ),
    );
  }
}
