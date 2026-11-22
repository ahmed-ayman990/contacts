import 'dart:io';

class ContantModel {
  String userName;
  String email;
  String phone;
  File? imagefile;

  ContantModel({required this.email,required this.imagefile,required this.phone,required this.userName});
  static List<ContantModel> contantList = [];
}
