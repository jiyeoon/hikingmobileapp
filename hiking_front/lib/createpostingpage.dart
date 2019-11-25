import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zefyr/zefyr.dart';
//import 'package:quill_delta/quill_delta.dart'


//왓더
final doc =
    r'[{"insert":"Zefyr"},{"insert":"\n","attributes":{"heading":1}},{"insert":"Soft and gentle rich text editing for Flutter applications.","attributes":{"i":true}},{"insert":"\n"},{"insert":"​","attributes":{"embed":{"type":"image","source":"asset://assets/breeze.jpg"}}},{"insert":"\n"},{"insert":"Photo by Hiroyuki Takeda.","attributes":{"i":true}},{"insert":"\nZefyr is currently in "},{"insert":"early preview","attributes":{"b":true}},{"insert":". If you have a feature request or found a bug, please file it at the "},{"insert":"issue tracker","attributes":{"a":"https://github.com/memspace/zefyr/issues"}},{"insert":'
    r'".\nDocumentation"},{"insert":"\n","attributes":{"heading":3}},{"insert":"Quick Start","attributes":{"a":"https://github.com/memspace/zefyr/blob/master/doc/quick_start.md"}},{"insert":"\n","attributes":{"block":"ul"}},{"insert":"Data Format and Document Model","attributes":{"a":"https://github.com/memspace/zefyr/blob/master/doc/data_and_document.md"}},{"insert":"\n","attributes":{"block":"ul"}},{"insert":"Style Attributes","attributes":{"a":"https://github.com/memspace/zefyr/blob/master/doc/attr'
    r'ibutes.md"}},{"insert":"\n","attributes":{"block":"ul"}},{"insert":"Heuristic Rules","attributes":{"a":"https://github.com/memspace/zefyr/blob/master/doc/heuristics.md"}},{"insert":"\n","attributes":{"block":"ul"}},{"insert":"FAQ","attributes":{"a":"https://github.com/memspace/zefyr/blob/master/doc/faq.md"}},{"insert":"\n","attributes":{"block":"ul"}},{"insert":"Clean and modern look"},{"insert":"\n","attributes":{"heading":2}},{"insert":"Zefyr’s rich text editor is built with simplicity and fle'
    r'xibility in mind. It provides clean interface for distraction-free editing. Think Medium.com-like experience.\nMarkdown inspired semantics"},{"insert":"\n","attributes":{"heading":2}},{"insert":"Ever needed to have a heading line inside of a quote block, like this:\nI’m a Markdown heading"},{"insert":"\n","attributes":{"block":"quote","heading":3}},{"insert":"And I’m a regular paragraph"},{"insert":"\n","attributes":{"block":"quote"}},{"insert":"Code blocks"},{"insert":"\n","attributes":{"headin'
    r'g":2}},{"insert":"Of course:\nimport ‘package:flutter/material.dart’;"},{"insert":"\n","attributes":{"block":"code"}},{"insert":"import ‘package:zefyr/zefyr.dart’;"},{"insert":"\n\n","attributes":{"block":"code"}},{"insert":"void main() {"},{"insert":"\n","attributes":{"block":"code"}},{"insert":" runApp(MyWAD());"},{"insert":"\n","attributes":{"block":"code"}},{"insert":"}"},{"insert":"\n","attributes":{"block":"code"}},{"insert":"\n\n\n"}]';


class CreatePostingPage extends StatefulWidget {
  @override
  _CreatePostingPageState createState() => _CreatePostingPageState();
}

class _CreatePostingPageState extends State<CreatePostingPage> {
  var titlecontroller = new TextEditingController();
  var contentcontroller = new TextEditingController();

  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
      bottomSheet: _buildBottomAppbar(),
    );
  }

  Widget _buildAppbar() {
    return AppBar(
      title: Text('create new posting!'),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.send, color: Colors.cyan,),
            onPressed: (){},
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: titlecontroller,
            cursorColor: Colors.cyan,
            decoration: InputDecoration(
              hintText: "title",
            ),
          ),
          TextField(
            maxLines: 20,
            controller: contentcontroller,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              hintText: "body",
              //labelText: "body",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAppbar() {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left : 20.0, top: 5, bottom: 5),
            child: IconButton(
              icon: Icon(Icons.add_a_photo, color: Colors.black54, size: 30,),
              onPressed: _getImage,
            ),
          ),
          //Padding(),
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: IconButton(
                icon: Icon(Icons.keyboard_hide, color: Colors.black54, size: 30,),
                onPressed: (){
                  FocusScope.of(context).requestFocus(new FocusNode());
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: IconButton(
                icon: Icon(Icons.save_alt, color: Colors.black54, size: 30,),
                onPressed: (){},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(Icons.format_align_center, color: Colors.black54, size: 30,),
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }


  //왠지는 모르겠지만 일단 안됨
  Future _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }






}
