import 'package:basic_code_for_any_project/app/app_prefs.dart';
import 'package:basic_code_for_any_project/app/di.dart';


abstract class RemoteDataSource {
  // Future<LoginResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  // @override
  // Future<LoginResponse> login(LoginRequest loginRequest) async {
  //   final response = await DioHelper.postData(
  //     url: EndPoints.login,
  //     data: loginRequest.toJson(),
  //   );
  //   LoginResponse loginResponse = LoginResponse.fromJson(response.data);
  //   return loginResponse;
  // }
}
