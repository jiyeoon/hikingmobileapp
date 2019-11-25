import 'package:flutter/material.dart';

//drawer는 나중에 생각을 해보자...

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  var liststyle = TextStyle(fontWeight: FontWeight.w600, color: Colors.black54, fontSize: 15);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          //Drawer Header 부분!
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 9),
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://www.moma.org/s/ge/collection_images/enlarge/26/62826.jpg'),
                    ),
                    width: 90, height: 90,
                  ),
                  Padding(padding: EdgeInsets.all(10),),
                  Text('Jiyeon Lee', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black54),),
                  Padding(padding: EdgeInsets.all(5),),
                  Text('i3048i@yonsei.ac.kr', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black45),)
                ],
              ),
            ),
          ),

          //Drawer의 List 부분
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 30),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('산 검색', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54, fontSize: 15), textAlign: TextAlign.center,),
                    onTap: (){},
                  ),
                  ListTile(
                    title: Text('등산로 정보', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54, fontSize: 15), textAlign: TextAlign.center,),
                    onTap: (){},
                  ),
                  ListTile(
                    title: Text('About Us', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54, fontSize: 15), textAlign: TextAlign.center,),
                    onTap: (){},
                  ),
                ],
              ),
            ),
          ),

          //Sign out
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('LogOut', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54, fontSize: 16),),
                  trailing: Icon(Icons.power_settings_new, color: Colors.black54, size: 25,),
                  onTap: (){},
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
