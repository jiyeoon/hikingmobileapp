class Mountain{
  Mountain({this.mntiadd, this.mntiadmin, this.mntiadminnum, this.mntidetails, this.mntihigh, this.mntilistno, this.mntiname});

  final String mntiadd;       //주소
  final String mntiadmin;     //관리자?
  final String mntiadminnum;  //번호
  final String mntidetails;   //짧막한 소개
  final String mntihigh;      //높이
  final String mntilistno;    //고유 번호
  final String mntiname;      //산 이름

  /*
  factory Mountain.fromJson(Map<String, dynamic> json){
    return Mountain(
      mntiadd: json['mntiadd'],
      mntiadmin: json['mntiadmin'],
      mntiadminnum: json['mntiadminnum'],
      mntidetails: json['mntidetails'],
      mntihigh: json['mntihigh'],
      mntilistno: json['mntilistno'],
      mntiname: json['mntiname'],
    );
  }
  */

  Mountain.fromJson(Map<String, dynamic> json)
   :  mntiadd = json['mntiadd'] as String,
      mntiadmin =json['mntiadmin']as String,
      mntiadminnum = json['mntiadminnum']as String,
      mntidetails = json['mntidetails']as String,
      mntihigh = json['mntihigh']as String,
      mntilistno = json['mntilistno']as String,
      mntiname = json['mntiname']as String;

}