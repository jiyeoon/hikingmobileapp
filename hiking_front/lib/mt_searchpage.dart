/*
* 산 정보 검색하는 페이지!
* 1. 산 정보 입력을 받으면
* 2. 공공데이터 포털에 그 바로 검색 request를 보내고 응답이 있으면 그거 클릭해서 detail 페이지로 들어갈 수 있도록 하기
* 3. 유저 친화적으로 하려면.. 뭔가 디비에 저장되어 있는 것이 좋을 것 같다는 생각이 들긴 한다.
*
*
* 변수
* 1. 인증키 : client_key
* 2. 검색한 단어 : searchWrd
* 3. 검색 요청 보낼 url : search_api_url
* 4. 제이슨 형태로 받을 때 추가해야할 것 : response_to_json
* */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hiking_front/homepage.dart';
import 'package:hiking_front/mt_detailpage.dart';
import 'package:loader_search_bar/loader_search_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:hiking_front/model/mountain.dart';
import 'package:hiking_front/drawer.dart';
import 'package:dio/dio.dart';

class MtSearchPage extends StatefulWidget {
  final String searchWrd;
  MtSearchPage(this.searchWrd);


  @override
  _MtSearchPageState createState() => _MtSearchPageState();
}


//search_url = search_api_url + searchWrd + '&ServiceKey=' + client_key + '&_type=json'
class _MtSearchPageState extends State<MtSearchPage> {
  final String client_key = 'ntqx0%2BT6eKi2wLBQvSktuws5aGsQIdWFnih93w9ksArXbyHrzGWtBvuxw58F4FHTywBjVl4e5H7zj1dfHeVQJA%3D%3D';
  //String searchWrd = '';
  String search_api_url1 = 'http://apis.data.go.kr/1400000/service/cultureInfoService/mntInfoOpenAPI?searchWrd=';
  String search_api_url2 = '&ServiceKey=';
  String search_api_url3 = '&_type=json';
  String _queryText = '';
  Mountain mt;
  List<Mountain> search_mt =[]; //검색한 정보들을 여기에 저장할 수 있도록!!

  var scaffoldKey = GlobalKey<ScaffoldState>();

  String imglink = "";

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _getData();
    print("get image data : ");
    _getImageData();
  }

  _getImageData() async{
    String subscription_key = "8677648ff40f46a980e5517d83934297";
    String img_search_url = "https://api.cognitive.microsoft.com/bing/v7.0/images/search";
    var headers = {"Ocp-Apim-Subscription-Key" : subscription_key};
    String search_term = widget.searchWrd;
    var params  = {"q": search_term, "license": "all", "imageType": "photo"};

    var response = await Dio().get(img_search_url, queryParameters: params, options: Options(headers: headers));

    print("get image data : ");
    print(response.statusCode);
    print(response);
    print(response.data);

    var purifieddata = response.data['value'][1]['contentUrl'];
    print(purifieddata);
    
    setState(() {
      imglink = purifieddata;
    });

  }

  _getData() async {
    var search_url = search_api_url1 + widget.searchWrd + search_api_url2 + client_key + search_api_url3;

    var response = await http.get(search_url);
    var body = utf8.decode(response.bodyBytes);

    var rawdata = jsonDecode(body);
    var data1 = rawdata['response']['body']['items']['item'];

    //결과가.. 리스트로 있을때가 있고 그냥 단독으로 있을 때가 있는데 이거를 어떻게 구분하냐~~

    if(!(data1 is List)){
      print('검색 결과는 하나다!!\n');
      print(data1);

      Mountain mt1 = Mountain(
          mntiname: data1['mntiname'],
          mntilistno: data1['mntilistno'].toString(),
          mntihigh: data1['mntihigh'].toString(),
          mntidetails: data1['mntidetails'],
          mntiadminnum: data1['mntiadminnum'],
          mntiadmin: data1['mntiadmin'],
          mntiadd: data1['mntiadd']
      );
      print('${widget.searchWrd} 검색 결과 : ${mt1.mntilistno}');
      setState(() {
        search_mt.add(mt1);
      });

    }
    else {
      for (int i = 0; i < data1.length; i++) {
        print('검색 결과\n');
        print(data1[i]);

        Mountain mt1 = Mountain(
            mntiname: data1[i]['mntiname'],
            mntilistno: data1[i]['mntilistno'].toString(),
            mntihigh: data1[i]['mntihigh'].toString(),
            mntidetails: data1[i]['mntidetails'],
            mntiadminnum: data1[i]['mntiadminnum'],
            mntiadmin: data1[i]['mntiadmin'],
            mntiadd: data1[i]['mntiadd']
        );

        print('${widget.searchWrd} 검색 결과 : ${mt1.mntilistno}');
        setState(() {
          search_mt.add(mt1);
        });
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.searchWrd} 검색 결과'),),
      body: _buildBody(),
      endDrawer: DrawerPage(),
      //resizeToAvoidBottomInset: false,
    );
  }


  //여기에다가 ListView.builder를 추가해야 함!
  Widget _buildBody() {
    if (search_mt.length != 0) { //데이터가 있으면 불러옴!
      return ListView.builder(
        itemBuilder: searched_data,
        itemCount: search_mt.length,
      );
    }

    else { //정보가 없으면 progress bar나.. no data라고 표시해주는 것이 필요할 것 같은데 아직 어떻게 해야할지는 감이 안옴~
      return Column(
        children: <Widget>[
          Text(widget.searchWrd),

        ],
      );
    }
  }

  Widget searched_data(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 9),
      //height: MediaQuery.of(context).size.height / 3.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            offset: Offset(4, 4),
            blurRadius: 16
          )
        ]
      ),
      child: GestureDetector(
         onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => MtDetailPage(search_mt[index], imglink)));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 2,
                    child: Image.network(imglink, fit: BoxFit.cover,),
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      search_mt[index].mntiname,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black87.withOpacity(0.9)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0, right: 16, top: 6, bottom: 8),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(Icons.place, size: 18, color: Colors.cyan,),
                                        Padding(padding: EdgeInsets.all(2),),
                                        Expanded(
                                          child: Text(search_mt[index].mntiadd, overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 14, color: Colors.black54),
                                          ),
                                        ),
                                        Icon(Icons.favorite_border, size: 18, color: Colors.cyan,)
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),

                          ),
                        ),
                        /*
                        Padding(
                          padding: EdgeInsets.only(right: 16,top: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('뭐가 들어갈지 모르겟군뇨'),
                            ],
                          ),
                        ),
    */
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }


}


