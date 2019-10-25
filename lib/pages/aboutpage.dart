import 'package:agro/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
              child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(LineIcons.exclamation_triangle, size: 50,),
              Text('सर्वोच्च अदालतले विदेशमा रहेका नेपालीलाई मतदान अधिकार दिन गत वर्ष दिएको निर्देशात्मक आदेश कार्यान्वयन गर्न सरकार उदासीन देखिएको छ । निर्वाचन आयोगले अझै त्यसतर्फ कुनै तयारी अघि बढाएको छैन ।', style: kSubtitleStyle,),
              Text('Tap Anywhere to Exit')
            ],
          ),
        ),
      ),
    );
  }
}