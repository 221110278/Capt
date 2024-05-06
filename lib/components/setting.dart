import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas/components/prov_set.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar( 
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Dark Mode Theme'),
            Switch(
              value: prov.enableDarkMode, 
              activeColor: Color.fromARGB(255, 99, 185, 255),
              onChanged: (e){
                setState(() {
                  prov.setBrightness = e;
                });
              })
          ],
        ),

        ),
    );
  }
}