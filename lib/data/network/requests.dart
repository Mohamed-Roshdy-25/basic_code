
import 'package:dio/dio.dart';

class LoginRequest {
  String userName;
  String password;

  LoginRequest(this.userName, this.password);

  Map<String,dynamic> toJson() => {
    'username': userName,
    'password': password,
  };
}

class SignUpRequest {
  String national_id;
  String name;
  String last_name;
  String username;
  String email;
  String mobile;
  String password;
  String password_repeat;
  int item1 ;
  List<String?> files ;

  SignUpRequest(
    this.national_id, 
    this.name, 
    this.last_name, 
    this.username, 
    this.email, 
    this.mobile, 
    this.password, 
    this.password_repeat, 
    this.item1, 
    this.files);

  Future<FormData> toJson() async {

    FormData formData = FormData.fromMap({
          'national_id': national_id,
          'name': name,
          'last_name': last_name,
          'username': username,
          'email': email,
          'mobile': mobile,
          'password': password,
          'password_repeat': password_repeat,
          'item1': item1,
        });

    for (var file in files){
      formData.files.add(MapEntry('imageFiles[]', await MultipartFile.fromFile(file!)));
    }

    return formData;
  }
}
