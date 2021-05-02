import 'package:coinbase_commerce/returnObjects/errorObject.dart';

class CheckoutObject extends CoinbaseResponseObject {
  CheckoutObject({
    this.url,
    this.description,
    this.id,
    this.name,
    this.pricingType,
    this.isSuccessful,
    this.error,
    this.requestedInfo,
  });
  final String? description, id, name, url;
  final bool? isSuccessful;
  final ErrorObject? error;
  final String? pricingType;
  final List? requestedInfo;

  CheckoutObject fromJson(Map data) {
    return CheckoutObject(
      description: data['description'],
      id: data['id'],
      isSuccessful: !data.containsKey('message'),
      error: data.containsKey('message')
          ? ErrorObject().fromJson(data)
          : ErrorObject(),
      name: data['name'],
      url: "https://commerce.coinbase.com/checkout/${data['id']}",
      pricingType: data['pricing_type'],
      requestedInfo: data['requested_info'],
    );
  }

  @override
  String toString() {
    Map collection = {
      'description': description,
      'id': id,
      'isSuccessful': isSuccessful,
      'error': error.toString(),
      'name': name,
      'url': url,
      'pricingType': pricingType,
      'requestedInfo': requestedInfo
    };
    return collection.toString();
  }
}
