import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse {
  ErrorResponse(this.errors);

  @JsonKey(name: 'errors')
  final List<NetworkError> errors;

  static const fromJson = _$ErrorResponseFromJson;

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}

@JsonSerializable()
class NetworkError {
  NetworkError(
    this.code,
    this.message,
  );

  @JsonKey(name: 'code')
  final String code;

  @JsonKey(name: 'message')
  final String message;

  static const fromJson = _$NetworkErrorFromJson;

  Map<String, dynamic> toJson() => _$NetworkErrorToJson(this);
}
