import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure({
    this.message = "Undefined error",
  });

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  final String message;
  final int? statusCode;
  final Map data;
  final DioError error;

  const ServerFailure({
    required this.error,
    required this.message,
    required this.data,
    required this.statusCode,
  }) : super(message: message);

  factory ServerFailure.fromDio(DioError error) {
    return ServerFailure(
      data: ((error.response?.data ?? {}) as Map),
      error: error,
      message: error.message,
      statusCode: error.response?.statusCode ?? 500,
    );
  }
}
