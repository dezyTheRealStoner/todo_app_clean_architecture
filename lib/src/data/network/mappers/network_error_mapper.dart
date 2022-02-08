import 'package:injectable/injectable.dart';
import 'package:todo_app_clean_acrhitechture/src/data/network/entities/error_response.dart';
import 'package:todo_app_clean_acrhitechture/src/domain/exceptions/base_exception.dart';

@lazySingleton
class NetworkErrorMapper {
  BaseException map(NetworkError networkError) {
    switch (networkError.code) {
      default:
        return BaseException(networkError.message);
    }
  }
}
