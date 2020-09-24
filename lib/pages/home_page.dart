import 'package:flutter/material.dart';
import 'package:flutter_localization/classes/language.dart';
import 'package:flutter_localization/colors/colors_name.dart';
import 'package:flutter_localization/localization/demo_localization.dart';
import 'package:flutter_localization/main.dart';
import 'package:flutter_localization/widgets/drawer_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  void _changeLanguage(Language language) {
    print(language.languageCode);
    Locale _temp;
    switch (language.languageCode) {
      case 'en':
        _temp = Locale(language.languageCode, 'US');
        break;
      case 'ne':
        _temp = Locale(language.languageCode, 'NP');
        break;
      default:
        _temp = Locale(language.languageCode, 'US');
        break;
    }
    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      //drawer: DrawerList(),
      appBar: AppBar(
        title:
            Text(DemoLocalization.of(context).getTranslatedValue('home_page')),
        actions: [
          Padding(
            padding: EdgeInsets.all(_size.width * 0.025),
            child: DropdownButton(
              onChanged: (Language language) {
                _changeLanguage(language);
              },
              icon: Icon(
                Icons.language,
                color: whiteColor,
                size: _size.height * 0.040,
              ),
              underline: SizedBox(),
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                      value: lang,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lang.flag,
                            style: TextStyle(fontSize: _size.height * 0.025),
                          ),
                          Text(lang.name,
                              style: TextStyle(fontSize: _size.height * 0.025)),
                        ],
                      )))
                  .toList(),
            ),
          ),
        ],
      ),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _size.height / 4,
                child: Center(
                  child: Text(
                    DemoLocalization.of(context).getTranslatedValue('personal_info'),
                    style: TextStyle(
                      fontSize: _size.height * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              TextFormField(
                validator: (val) {
                  if (val.isEmpty) {
                    return DemoLocalization.of(context).getTranslatedValue('required_field');
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: DemoLocalization.of(context).getTranslatedValue('name'),
                    hintText: DemoLocalization.of(context).getTranslatedValue('name_hint'),),
              ),
              SizedBox(
                height: _size.height * 0.010,
              ),
              TextFormField(
                validator: (val) {
                  if (val.isEmpty) {
                    return DemoLocalization.of(context).getTranslatedValue('required_field');
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: DemoLocalization.of(context).getTranslatedValue('email'),
                    hintText: DemoLocalization.of(context).getTranslatedValue('email_hint')),
              ),
              SizedBox(
                height: _size.height * 0.010,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: DemoLocalization.of(context).getTranslatedValue('date_of_birth')),
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year),
                      lastDate: DateTime(DateTime.now().year + 20));
                },
              ),
              SizedBox(
                height: _size.height * 0.010,
              ),
              MaterialButton(
                  height: _size.height * 0.070,
                  shape: StadiumBorder(),
                  color: Theme.of(context).primaryColor,
                  child: Center(
                    child: Text(
                      DemoLocalization.of(context).getTranslatedValue('submit_info'),
                      style: TextStyle(
                          color: Colors.white, fontSize: _size.height * 0.0275),
                    ),
                  ),
                  onPressed: () {
                    if (_key.currentState.validate()) {
                      _showSuccessDialog();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
