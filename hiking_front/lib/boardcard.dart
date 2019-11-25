import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hiking_front/model/posting.dart';

class BoardCard extends StatelessWidget {
  Posting _posting;
  BoardCard(this._posting);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        //유저 부분
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(_posting.user_image),),
            title: Text(_posting.title),
            subtitle: Text(_posting.time),
          ),
          Image.network(_posting.image),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Text(_posting.content),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.thumb_up),
                      Text('8 Like')
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.favorite_border),
                      Text('8 Like')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


/*
class BoardCard extends StatelessWidget {
  Posting _posting;
  BoardCard(this._posting);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, height: 500,
      child: Column(
        children: <Widget>[
          //// header - 유저 정보
          GestureDetector(
            onTap: (){}, //유저 개인 정보 페이지로 이동하게
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(_boardContent.userImageUrl),),
              title: Text(_boardContent.writer),
              subtitle: Text(_boardContent.club),
            ),
          ),
          // body - 글 내용. 200자 넘으면 ... 으로 표시하도록
          GestureDetector(
            onTap: (){}, //게시글로 이동할 수 있도록
            child: Column(
              children: <Widget>[

              ],
            ),
          ),
          /////footer - 추천 or 좋아요
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: (){},
              ),
              Text('댓글 0개', style: TextStyle(color: Colors.grey),),

            ],
          ),


        ],
      ),
    );
  }

  Widget _cardbody(BoardContent blockcontent){
    String text;
    List<String> attached_image_url = new List();

    //글자수 너무 길면 자르기
    if(blockcontent.textfield.length > 300){
      text = blockcontent.textfield.substring(0, 300) + "...."; //너무 길면 자르기
    }
    else{
      text = blockcontent.textfield;
    }

    //사진이 있으면
    if(blockcontent.attachedImageUrl != null){
      return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
          child: Text(text),
          ),
          CarouselSlider(
            items: null,
            autoPlay: false,

          ),
        ],
      );
    }
    //사진이 없으면 그냥 글만 출력
    else{
      return Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10), child: Text(text),),
        ],
      );
    }

  }
}
*/