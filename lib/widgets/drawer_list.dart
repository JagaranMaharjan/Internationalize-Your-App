import 'package:flutter/material.dart';
import 'package:flutter_localization/colors/colors_name.dart';
import 'package:flutter_localization/pages/about_page.dart';
import 'package:flutter_localization/routes/route_names.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        width: _size.width / 1.5,
        color: Theme.of(context).primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                height: _size.height * 0.25,
                child: CircleAvatar(
                  backgroundColor: whiteColor,
                ),
              ),
            ),
            Divider(color: whiteColor),
            ListTile(
              leading: Icon(Icons.info, color: whiteColor, size: _size.width*0.08),
              title: Text("About Us", style: TextStyle(color: whiteColor),),
              onTap: (){
                //to close drawer
                Navigator.pop(context);
                //navigate to about page
                Navigator.pushNamed(context, aboutRoute);
              },
            ),
            Divider(color: whiteColor),
            ListTile(
              leading: Icon(Icons.settings, color: whiteColor, size: _size.width*0.08),
              title: Text("Settings", style: TextStyle(color: whiteColor),),
              onTap: (){
                //to close drawer
                Navigator.pop(context);
                //navigate to about page
                Navigator.pushNamed(context, settingsRoute);
              },
            ),
            Divider(color: whiteColor),
          ],
        ),
      ),
    );
  }
}
