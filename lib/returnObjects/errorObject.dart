/// A simple [ErrorObject] entity.
class ErrorObject extends CoinbaseResponseObject {
  ///Returns an entity containing the type of error and the accompanying message for
  ErrorObject({
    this.type,
    this.message,
  });

  ///The type of Error message that resulted from the request made
  final String? type;

  ///The body of the error response
  final String? message;

  ///Creates an [ErrorObject] using the fields of the response from Coinbase
  factory ErrorObject.fromJson(Map data) {
    return ErrorObject(type: data['type'], message: data['message']);
  }

  ///Returns the [ErrorObject] fields as a [String] object
  @override
  String toString() {
    Map collection = {'type': type, 'message': message};
    return collection.toString();
  }
}

abstract class CoinbaseResponseObject {}
