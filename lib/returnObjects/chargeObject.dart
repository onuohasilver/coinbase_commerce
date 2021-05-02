import 'errorObject.dart';
import '../coinbase_commerce.dart';

class ChargeObject extends CoinbaseResponseObject {
  ChargeObject({
    this.confirmedAt,
    this.isSuccessful,
    this.error,
    this.cancelUrl,
    this.redirectUrl,
    this.metaData,
    this.name,
    this.payments,
    this.pricingType,
    this.timeline,
    this.supportEmail,
    this.id,
    this.url,
    this.addresses,
    this.code,
    this.createdAt,
    this.description,
    this.exchangeRate,
    this.expiresAt,
  });

  final String? code,
      id,
      url,
      description,
      name,
      supportEmail,
      cancelUrl,
      redirectUrl;
  final DateTime? createdAt, expiresAt, confirmedAt;
  final Map? exchangeRate, metaData, addresses;
  final List? payments, timeline;
  final ErrorObject? error;
  final String? pricingType;
  final bool? isSuccessful;

  fromJson(Map data) {
    return ChargeObject(
        metaData: data['metadata'],
        name: data['name'],
        isSuccessful: !data.containsKey('message'),
        error: data.containsKey('message')
            ? ErrorObject().fromJson(data)
            : ErrorObject(),
        description: data['description'],
        pricingType: data['pricing_type'],
        addresses: data['addresses'],
        code: data['code'],
        createdAt: DateTime.tryParse(data['created_at'].toString()),
        confirmedAt: DateTime.tryParse(data['confirmed_at'].toString()),
        exchangeRate: data['exchange_rates'],
        expiresAt: DateTime.tryParse(data['expires_at'].toString()),
        url: data['hosted_url'],
        id: data['id'],
        payments: data['payments'],
        supportEmail: data['support_email'],
        timeline: data['timeline']);
  }

  @override
  String toString() {
    Map collection = {
      'metaData': metaData,
      'name': name,
      'isSuccessful': isSuccessful,
      'error': error.toString(),
      'description': description,
      'pricingType': pricingType,
      'addresses': addresses,
      'code': code,
      'createdAt': createdAt,
      'exchangeRate': exchangeRate,
      'expiresAt': expiresAt,
      'url': url,
      'id': id,
      'payments': payments,
      'supportEmail': supportEmail,
      'timeline': timeline
    };
    return collection.toString();
  }
}
