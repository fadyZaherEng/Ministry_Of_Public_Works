import 'package:dio/dio.dart';

/*
* A generic DataState class (Wrapper)
* We’re communicating with entity API service, every request we make to the
* Make to the server we get response.. but what if something goes wrong?
* A network error occur? Here comes the wrapper class, which wraps our
* Entire network response with DataState so we can have two states either
* The response is usecases successful or failed with error of type DioError.
 */
abstract class DataState<T> {
  final T? data;
  final DioError? error;
  String? message;

  DataState({this.data, this.error, this.message});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data, {String? message}) : super(data: data, message: message);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(DioError? error) : super(error: error);
}
