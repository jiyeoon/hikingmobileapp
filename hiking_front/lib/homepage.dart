import 'package:flutter/material.dart';
import 'package:hiking_front/createpostingpage.dart';
import 'package:hiking_front/drawer.dart';
import 'package:hiking_front/mappage.dart';
import 'package:hiking_front/mt_searchpage.dart';
import 'package:hiking_front/style.dart';
import 'package:hiking_front/boardcard.dart';

import 'model/posting.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final mycontroller = TextEditingController();
  //Posting _posting = new Posting('Jiyeon Lee', '아차산 다녀왔어요~', '아차산 재밌네요 어쩌구 저쩌구 또 가고싶어요~', 'https://t1.daumcdn.net/cfile/tistory/21367E4D5360FE9A14', '2019.09.30', 'http://getwallpapers.com/wallpaper/full/1/1/0/718859-popular-robert-downey-jr-iron-man-wallpaper-2560x1920-high-resolution.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerPage(),
      //appBar: buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePostingPage()));
        },
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.cyan,
      ),
    );
  }

  /*
  buildAppBar() {
    return AppBar(
      title: Text('HomePage'),
    );
  }
*/
  _buildBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // sliver app bar
            homeheader(),

            //중간에 부분..
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('What do you want to do?', style: Styles.detailpage_subtitle,),
                  //Text('show more', style: TextStyle(color: Colors.cyan),),
                ],
              ),
            ),

            // 여기에 아이콘 리스트들 쭈르륵 나올 수 있도록
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 20, left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Image.asset('images/backpacker.png', fit: BoxFit.cover),
                        width: 60, height: 60,
                      ),
                      Padding(padding: EdgeInsets.all(5),),
                      Text('backpacker'),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Image.asset('images/map.png', fit: BoxFit.cover),
                          width: 60, height: 60,
                        ),
                        Padding(padding: EdgeInsets.all(5),),
                        Text('map'),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Image.asset('images/mountains.png', fit: BoxFit.cover),
                        width: 60, height: 60,
                      ),
                      Padding(padding: EdgeInsets.all(5),),
                      Text('mountains'),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),

            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Recent Issue Topic', style: Styles.detailpage_subtitle,),
                  Text('show more', style: TextStyle(color: Colors.cyan),),
                ],
              ),
            ),


            Divider(),


          ],
        ),
      ),

    );
  }

  Widget homeheader() {
    return Stack(
      children: <Widget>[
        //헤더? 같은 부분. sliver appbar 로 구현을 해야할 것 같긴 하나.. 어떻게 하지~~
        Opacity(
          opacity: 0.75,
          child: ClipPath(
              child: Image.asset('images/santalogo.png'),
          ),
        ),

        //검색창
        Container(
          margin: EdgeInsets.only(left: 40, right: 40, top: MediaQuery.of(context).size.height / 2.8),
          child: Material(
            borderRadius: BorderRadius.circular(32.0),
            elevation: 8,
            child: Container(
              child: TextFormField(
                //여기에 클릭을 하면 검색이 되도록!!! 할 수 있어야 한다능~
                cursorColor: Colors.cyan,
                keyboardType: TextInputType.text,
                controller: mycontroller,
                onEditingComplete: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MtSearchPage(mycontroller.text)));
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  prefixIcon: GestureDetector(
                      child: Icon(Icons.search, color: Colors.cyan, size: 30,),
                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MtSearchPage(mycontroller.text)));
                    },
                  ),
                  hintText: "Where do you want to go?",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    borderSide: BorderSide.none
                  ),
                ),
              ),
            ),
          ),
        ),

        //Drawer 부분!!!
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: MediaQuery.of(context).size.height/20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Opacity(
                opacity: 0.9,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: GestureDetector(
                    onTap: (){
                      scaffoldKey.currentState.openDrawer();
                    },
                    child: Icon(Icons.menu, size: 30, color: Colors.black,),
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );

  }


}
