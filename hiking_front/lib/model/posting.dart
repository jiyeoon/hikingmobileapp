/*
* 포스팅 모델
* 1. 유저
* 2. 글 작성일자
* 3. 사진
* 4. 글 내용!!!
* 5. 글 타이틀
* 6. 유저 이미지 url?
*
* */


class Posting{
  final String user_name;
  final String time;
  //final List<String> image;
  final String image;
  final String content;
  final String title;
  final String user_image;

  Posting(this.user_name, this.title, this.content, this.image, this.time, this.user_image);


  List<Posting> post_example = [
    Posting('Jiyeon Lee', '아차산 다녀왔어요~', '아차산 재밌네요 어쩌구 저쩌구 또 가고싶어요~', 'https://t1.daumcdn.net/cfile/tistory/21367E4D5360FE9A14', '2019.09.30', 'http://getwallpapers.com/wallpaper/full/1/1/0/718859-popular-robert-downey-jr-iron-man-wallpaper-2560x1920-high-resolution.jpg'),
  ];

}