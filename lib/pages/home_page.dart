import 'package:flutter/material.dart';
import 'package:flutter_localization/routes/route_names.dart';
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

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerList(),
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Form(
        key: _key,
        child: Column(
          children: [
            Container(
              height: _size.height / 4,
              child: Center(
                child: Text(
                  "Personal Information",
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
                  return "required filed";
                }
                return null;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                  hintText: "Enter Name"),
            ),
            SizedBox(
              height: _size.height * 0.010,
            ),
            TextFormField(
              validator: (val) {
                if (val.isEmpty) {
                  return "required filed";
                }
                return null;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "E-mail",
                  hintText: "Enter email address"),
            ),
            SizedBox(
              height: _size.height * 0.010,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Select date of birth"),
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
                    "Submit Information",
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
    );
  }
}
