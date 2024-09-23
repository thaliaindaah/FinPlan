class BaseException implements Exception{

  final dynamic _message;
  final dynamic _prefix;

  BaseException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }

}

class FetchDataException extends BaseException{
  FetchDataException([String? message]) : super(message, "Error During Communication:");
}

class BadRequestException extends BaseException{
  BadRequestException([String? message]) : super(message, "Invalid Request:");
}

class UnauthorisedException extends BaseException{
  UnauthorisedException([String? message]) : super(message, "Unauthorised:");
}

class InvalidInputException extends BaseException{
  InvalidInputException([String? message]) : super(message, "Invalid Input:");
}