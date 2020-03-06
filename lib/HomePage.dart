import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Calls.dart';
import 'package:whatsapp_clone/Camera.dart';
import 'package:whatsapp_clone/Chat.dart';
import 'package:whatsapp_clone/CustomPopupMenu.dart';
import 'package:whatsapp_clone/Status.dart';
import 'package:whatsapp_clone/setting.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  List<CustomPopupMenu> choices = <CustomPopupMenu>[
    CustomPopupMenu(title: 'New Group'),
    CustomPopupMenu(title: 'New broadcast'),
    CustomPopupMenu(title: 'WhatsApp Web'),
    CustomPopupMenu(title: 'Starred messages'),
    CustomPopupMenu(title: 'Setting'),
  ];

  void _select(CustomPopupMenu choice) {
    setState(() {
      //TODO: implement this method
    });
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFF075e54),
            title: Text(
              "WhatsApp",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    //This is only for testing purpose we push the profile menu
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Setting()));
                  }),
              PopupMenuButton<CustomPopupMenu>( 
                elevation: 3.2,
                onCanceled: () {
                  print('You have not chossed anything');
                },
                tooltip: 'This is tooltip',
                onSelected: _select,
                itemBuilder: (BuildContext context) {
                  return choices.map((CustomPopupMenu choice) {
                    return PopupMenuItem<CustomPopupMenu>(
                      value: choice,
                      child: Text(choice.title),
                    );
                  }).toList();
                },
              )
            ],
            bottom: TabBar(
              controller: controller,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.camera_alt),
                ),
                Tab(
                  child: Text(
                    "CHATS",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "STATUS",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "CALLS",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
             Camera(),
            Chat(),
            Status(),
            Calls(),
           
          ],
        ));
  }
}
