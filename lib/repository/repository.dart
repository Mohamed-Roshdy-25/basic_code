import 'package:basic_code_for_any_project/app/di.dart';
import 'package:basic_code_for_any_project/data/data_sources/remote_data_source.dart';
import 'package:basic_code_for_any_project/data/network/network_info.dart';


abstract class Repository {
  // Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest);
}

class RepositoryImpl implements Repository{
  final RemoteDataSource _remoteDataSource = instance<RemoteDataSource>();
  final NetworkInfo _networkInfo = instance<NetworkInfo>();
  // final LocalDataSource _localDataSource = instance<LocalDataSource>();

  // @override
  // Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest) async {
  //   if (await _networkInfo.isConnected) {
  //     try {
  //       LoginResponse response = await _remoteDataSource.login(loginRequest);
  //       if (response.status == 1) {
  //         return Right(response.toDomain());
  //       } else {
  //         return Left(Failure(response.status.orZero(),
  //             (response.data?.first.message).orEmpty()));
  //       }
  //     } catch (error) {
  //       return Left(ErrorHandler.handle(error).failure);
  //     }
  //   } else {
  //     return Left(DataSource.noInternetConnection.getFailure());
  //   }
  // }
}