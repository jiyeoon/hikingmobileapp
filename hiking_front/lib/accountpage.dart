import 'package:flutter/material.dart';


class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: buildBody(),
      //drawer: _builddrawer(),
    );
  }

  buildAppbar() {
    return AppBar(
      title: Text('My Account Page'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: (){}, //수정 버튼 눌렀을 때 수정하는거!
        )
      ],
    );
  }

  buildBody() {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Image.network('https://t1.daumcdn.net/cfile/tistory/999A173D5D4216AF0A'),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 330,
              alignment: Alignment.bottomCenter,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 130.0, height: 130.0,
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: NetworkImage('https://www.itsliquid.com/wp-content/uploads/2018/10/egon_schiele_002_web.jpg'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 13, left: 8, right: 8, bottom: 13),
          child: Center(
            child: Column(
              children: <Widget>[
                Text('Jiyeon Lee', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.group),
          title: Text('가입중인 산악회'),
          subtitle: Text('산들바다 산악회'),
          onTap: (){}, //산악회 밴드나 그런 곳 갈 수 있도록
        ),
        ListTile(
          title: Text(''),
        ),
        
        Container( //line
          height: 1, width: MediaQuery.of(context).size.width * 0.9,
          color: Colors.grey,
        ),
      ],
    );
  }
}
