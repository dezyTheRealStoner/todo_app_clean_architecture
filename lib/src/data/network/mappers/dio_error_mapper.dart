import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_acrhitechture/src/data/network/entities/error_response.dart';
import 'package:todo_app_clean_acrhitechture/src/data/network/mappers/network_error_mapper.dart';
import 'package:todo_app_clean_acrhitechture/src/domain/exceptions/base_exception.dart';

@lazySingleton
class DioErrorMapper {
  DioErrorMapper(this._networkErrorMapper);

  final NetworkErrorMapper _networkErrorMapper;

  Exception map(DioError error) {
    if (error.type == DioErrorType.response &&
        error.response?.statusCode == 500) {
      return BaseException(error.message);
    } else if (error.type == DioErrorType.response) {
      final errorResponse =
          ErrorResponse.fromJson(error.response!.data as Map<String, dynamic>);

      return _networkErrorMapper.map(errorResponse.errors.first);
    } else {
      return error;
    }
  }
}
