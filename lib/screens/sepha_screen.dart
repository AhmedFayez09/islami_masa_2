import 'package:flutter/material.dart';

class SephaScreen extends StatefulWidget {
  const SephaScreen({super.key});

  @override
  State<SephaScreen> createState() => _SephaScreenState();
}

class _SephaScreenState extends State<SephaScreen> {
  int scount = -99;
  int aCount = -33;
  int allaAkbrCount = -66;
  int count = 0;
  String tsbehText = "سبحان الله";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset("assets/images/sebha_image.png")),
        SizedBox(height: 15),
        Text(
          "عدد التسبيحات",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(12)),
          child: Text(
            "$count",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 50),
        InkWell(
          onTap: () {
            addTasbeh();
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(25)),
            child: Text(
              tsbehText,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  void addTasbeh() {
    setState(() {
      count++;
      aCount++;
      scount++;
      allaAkbrCount++;
      if (count == 33) {
        count = 0;
        if (aCount == 0) {
          tsbehText = "الحمد لله ";
        }
        if (allaAkbrCount == 0) {
          tsbehText = "الله اكبر";
        }
        if (scount == 0) {
          tsbehText = "سبحان الله";
          scount = -99;
          aCount = -33;
          allaAkbrCount = -66;
        }
        //
        // scount = 1;
      }
    });
  }
}
