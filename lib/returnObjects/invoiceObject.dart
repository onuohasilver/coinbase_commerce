import 'package:coinbase_commerce/returnObjects/chargeObject.dart';
import 'package:coinbase_commerce/returnObjects/errorObject.dart';

///A check to confirm whether the response completed successfully
///An [isSuccessful] value is contained in each of the [CoinbaseChargeObjects]
///this value shows returns true when there is a successful request
class InvoiceObject extends CoinbaseResponseObject {
  InvoiceObject({
    this.isSuccessful,
    this.error,
    this.businessName,
    this.code,
    this.status,
    this.customerName,
    this.customerEmail,
    this.url,
    this.charge,
    this.memo,
    this.createdAt,
    this.updatedAt,
    this.localPrice,
  });
  final String? businessName,
      code,
      status,
      customerName,
      customerEmail,
      url,
      memo;
  final DateTime? createdAt, updatedAt;
  final Map? localPrice;
  final bool? isSuccessful;
  final ErrorObject? error;
  final ChargeObject? charge;

  factory InvoiceObject.fromJson(Map data) {
    return InvoiceObject(
        businessName: data['business_name'],
        isSuccessful: !data.containsKey('message'),
        error: data.containsKey('message')
            ? ErrorObject.fromJson(data)
            : ErrorObject(),
        code: data['code'],
        charge: data.containsKey('charge')
            ? ChargeObject.fromJson(data['charge'])
            : ChargeObject(),
        status: data['status'],
        customerEmail: data['customer_email'],
        url: data['hosted_url'],
        customerName: data['customer_name'],
        memo: data['memo'],
        createdAt: DateTime.tryParse(data['created_at'].toString()),
        updatedAt: DateTime.tryParse(data['updated_at'].toString()),
        localPrice: data['local_price']);
  }

  ///Returns the [InvoiceObject] as a [String] object.
  @override
  String toString() {
    Map collection = {
      'businessName': businessName,
      'isSuccessful': isSuccessful,
      'error': error.toString(),
      'charge': charge.toString(),
      'code': code,
      'status': status,
      'customerEmail': customerEmail,
      'customerName': customerName,
      'memo': memo,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'localPrice': localPrice,
      'url': url
    };
    return collection.toString();
  }
}
