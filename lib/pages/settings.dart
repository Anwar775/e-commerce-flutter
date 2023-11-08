import 'package:e_commerce/shared/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool valNotify1 = false;
  bool valNotify2 = false;
  bool valNotify3 = false;

  onChangeFunction1(bool val1) {
    setState(() {
      valNotify1 = val1;
    });
  }

  onChangeFunction2(bool val2) {
    setState(() {
      valNotify2 = val2;
    });
  }

  onChangeFunction3(bool val3) {
    setState(() {
      valNotify3 = val3;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: appbarGreen,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Divider(
              thickness: 1,
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOption(context, "Change Password"),
            buildAccountOption(context, "Content Settings"),
            buildAccountOption(context, "Social"),
            buildAccountOption(context, "Languages"),
            buildAccountOption(context, "Privacy and Security"),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.orange,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Notification",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 20,
              thickness: 1,
            ),
            SizedBox(
              height: 10,
            ),
            buildNotificationOption(
                "Dark Theme", valNotify1, onChangeFunction1),
            buildNotificationOption(
                "Account Active", valNotify2, onChangeFunction2),
            buildNotificationOption(
                "Opportunity", valNotify3, onChangeFunction3),
          ],
        ),
      ),
    );
  }

  Padding buildNotificationOption(String title, bool val,
      Function onChangeMethod) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600]),
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(value: val, onChanged: (bool value) {

            },
              activeColor: Colors.orange,
              trackColor: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        child: Text("close"), alignment: Alignment.topRight),
                  )
                ],
              );
            });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600]),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
            // SwitchListTile(value: false, onChanged: (val){})
          ],
        ),
      ),
    );
  }
}
//Dark Theme

//Account Active

//Opportunity