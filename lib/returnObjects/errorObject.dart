class ErrorObject extends CoinbaseResponseObject {
  ErrorObject({
    this.type,
    this.message,
  });
  final String? type;
  final String? message;

  fromJson(Map data) {
    return ErrorObject(type: data['type'], message: data['message']);
  }

  @override
  String toString() {
    Map collection = {'type': type, 'message': message};
    return collection.toString();
  }
}

abstract class CoinbaseResponseObject {}
