class SocialUserModel {
  String? name;
  String? userName;
  String? passCode;
  String? phone;
  String? key;
  String? uId;
  SocialUserModel(
      {this.name,
        this.userName,
        this.passCode,
        this.phone,
        this.key,
        this.uId,
      });
   SocialUserModel.fromJson(Map<String,dynamic>json){
    name=json['name'];
    userName=json['userName'];
    passCode=json['passCode'];
    phone=json['phone'];
    key=json['key'];
    uId=json['uId'];
  }
  Map<String,dynamic> toMap(){
     return{
       'name':name,
       'userName':userName,
       'passCode':passCode,
       'phone':phone,
       'key':key,
       'uId':uId,
     };
  }
}
