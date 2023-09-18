import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuranDetailsScreen extends StatefulWidget {
  QuranDetailsScreen({
    super.key,
  });
  static const String routeName = 'quranDetailsScreen';

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> quranDetails = [];

  @override
  Widget build(BuildContext context) {
    var quran = ModalRoute.of(context)?.settings.arguments as QuranModel;
    if (quranDetails.isEmpty) {
      loadSura(quran.index);
    }
    return Stack(
      children: [
        Image.asset(
          'assets/images/layout_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              " سورة ${quran.name} ",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: ListView.separated(
            separatorBuilder: (context, index) =>Divider(thickness: 3,),
            itemCount: quranDetails.length,
            itemBuilder: (context, index) {
              return Text(
                quranDetails[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void loadSura(int index) async {
    String contant =
        await rootBundle.loadString('assets/quran_files/${index + 1}.txt');
    print(contant);
    quranDetails.addAll(contant.split("\n"));
    setState(() {});
  }
}

class QuranModel {
  int index;
  String name;
  QuranModel(this.index,this.name);
}
