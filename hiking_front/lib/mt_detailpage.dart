import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hiking_front/model/mountain.dart';
import 'package:http/http.dart' as http;
import 'package:hiking_front/style.dart';
import 'package:expandable/expandable.dart';


class MtDetailPage extends StatefulWidget {
  final Mountain mountain;
  final String imglink;
  MtDetailPage(this.mountain, this.imglink);

  @override
  _MtDetailPageState createState() => _MtDetailPageState();
}

class _MtDetailPageState extends State<MtDetailPage>
  with TickerProviderStateMixin {
  //이제 여기에 그.. 정보들을 띄워주면 된다능. 어렵지 않다능~~~!!~!~!~!
  final String client_key = 'ntqx0%2BT6eKi2wLBQvSktuws5aGsQIdWFnih93w9ksArXbyHrzGWtBvuxw58F4FHTywBjVl4e5H7zj1dfHeVQJA%3D%3D';
  final String search_url1= 'http://apis.data.go.kr/1400000/service/cultureInfoService/mntInfoImgOpenAPI?mntiListNo=';
  final String search_url2 = '&ServiceKey=';
  final String search_url3 = '&_type=json';

  List<String> search_imagelist = [];

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
      duration: Duration(milliseconds: 1000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn));
    setData();
    super.initState();
  }

  void setData() async{
    animationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    final tempHight = (MediaQuery.of(context).size.height - (MediaQuery.of(context).size.width / 1.2) + 24.0);

    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 250.0,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
            //title: Text(widget.mountain.mntiname, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
            background: Image.network(widget.imglink, fit: BoxFit.cover,),
          ),
        ),
        SliverFillRemaining(
          child: Container(
            color: Colors.white,
            child: Column(
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 15),
                  child: Text(widget.mountain.mntiname, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 30, letterSpacing: 0.27), textAlign: TextAlign.left,),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('주소', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.cyan),),
                      Text(widget.mountain.mntiadd, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54),)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('전화번호', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.cyan),),
                      Text(widget.mountain.mntiadminnum, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54),)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
                  child: Column(
                    children: <Widget>[
                      //Text('상세 설명', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.cyan),),
                      //Padding(padding: EdgeInsets.all(4),),
                      ExpandablePanel(
                        header: Text('상세 설명', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0.27, color: Colors.cyan), ),
                        expanded: Text(widget.mountain.mntidetails, softWrap: true, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black54),),
                        tapHeaderToExpand: true,
                        hasIcon: true,
                        collapsed: Text(widget.mountain.mntidetails, softWrap: true, maxLines: 4, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, letterSpacing: 0.27, color: Colors.black54),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );


    /*
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.2,
              child: Image.network('http://cfile229.uf.daum.net/image/24404D4352AE5EAA1B4C1A', fit: BoxFit.cover,),
            )
          ],
        ),
        Positioned(
          top: (MediaQuery.of(context).size.width/1.2) - 24.0,
          bottom: 0, left: 0, right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
              boxShadow: <BoxShadow>[BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: Offset((1.1), 1.1),
                blurRadius: 10
              )],
            ),
            child: Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    //minHeight: info
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0, left: 18, right: 16),
                        child: Text(widget.mountain.mntiname, textAlign: TextAlign.left, style: Styles.headlineText,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 22, left: 16, right: 16, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('주소', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: 0.27, color: Colors.cyan),),
                            Padding(padding: EdgeInsets.all(4),),
                            Text(widget.mountain.mntiadd, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 0.27, color: Colors.black54),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('전화번호', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: 0.27, color: Colors.cyan),),
                            Padding(padding: EdgeInsets.all(4),),
                            Text(widget.mountain.mntiadminnum, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 0.27, color: Colors.black54),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('높이', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: 0.27, color: Colors.cyan),),
                            Padding(padding: EdgeInsets.all(4),),
                            Text(widget.mountain.mntihigh, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 0.27, color: Colors.black54),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //Text('상세 설명', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: 0.27, color: Colors.cyan),),
                            //Padding(padding: EdgeInsets.all(14),),
                            ExpandablePanel(
                              header: Text('상세 설명', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: 0.27, color: Colors.cyan),),//Text(widget.mountain.mntiname, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200, letterSpacing: 0.27, color: Colors.black54 ), maxLines: 5,),
                              expanded: Text(widget.mountain.mntidetails, softWrap: true, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200, letterSpacing: 0.27, color: Colors.black54 ),),
                              collapsed: Text(widget.mountain.mntidetails, softWrap: true, maxLines: 5, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200, letterSpacing: 0.27, color: Colors.black54 ),),
                              tapHeaderToExpand: true,
                              hasIcon: true,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: (MediaQuery.of(context).size.width/1.2) - 24.0 - 35,
          right: 35,
          child: new ScaleTransition(
              alignment: Alignment.center,
              scale: new CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn),
            child: GestureDetector(
              onTap: (){},
              child: Card(
                color: Colors.cyan,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                elevation: 10.0,
                child: Container(
                  width: 60, height: 60,
                  child: Center(child: Icon(Icons.add, color: Colors.white, size: 30,)),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top:MediaQuery.of(context).padding.top),
          child: SizedBox(
            width: AppBar().preferredSize.height,
            height: AppBar().preferredSize.height,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: new BorderRadius.circular(
                  AppBar().preferredSize.height
                ),
                child: Icon(Icons.arrow_back_ios, color: Colors.black,),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),

      ],
    );
    */


  }




}
