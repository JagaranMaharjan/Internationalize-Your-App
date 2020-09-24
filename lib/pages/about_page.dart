import 'package:flutter/material.dart';
import 'package:flutter_localization/localization/demo_localization.dart';
import 'package:flutter_localization/widgets/drawer_list.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: DrawerList(),
      appBar: AppBar(
        title: Text(DemoLocalization.of(context).getTranslatedValue('about_page')),
      ),
    );
  }
}
