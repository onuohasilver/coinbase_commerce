import 'dart:async';
import 'dart:core';
import 'package:coinbase_commerce/logger.dart';

import 'returnObjects/checkoutObject.dart';
import 'returnObjects/invoiceObject.dart';
import 'customFunctions/switchFunctions.dart';
import 'enums.dart';
import 'httpCalls.dart';
import 'returnObjects/chargeObject.dart';

/// A Coinbase flexible API wrapper
class Coinbase {
  ///The user API key gotten from commerce.coinbase.api
  String _apiKey;

  ///the debug value controls whether the responses are logged on the terminal
  bool debug;

  ///Default  for the coinbase API
  Coinbase(this._apiKey, {this.debug = false});

  /// To request a cryptocurrency payment, you create a charge.
  ///  You can create and view charges.
  ///  Since cryptocurrency payments are push payments,
  /// a charge will expire after a waiting period (payment window)
  ///   no payment has been detected. Charges are identified by a unique code.
  /// [amount] 	can be just simple
  /// []
  Future<ChargeObject> createCharge(
      {int? amount,
      required String name,
      CurrencyType? currency,
      required String description,
      required PricingType pricingType}) async {
    if (pricingType == PricingType.fixedPrice) {
      assert(amount != null);
    }
    ChargeObject coinbaseResponse;
    Map data;

    Map response = await postToDB(
      apiKey: _apiKey,
      api: 'https://api.commerce.coinbase.com/charges',
      body: {
        'name': name,
        'description': description,
        "pricing_type": getPricingType(pricingType),
        "local_price": pricingType == PricingType.fixedPrice
            ? {"amount": amount, "currency": getCurrency(currency!)}
            : null,
      },
    );
    if (response.containsKey('error')) {
      data = response['error'];
    } else {
      data = response['data'];
    }
    coinbaseResponse = ChargeObject().fromJson(data);
    Logger(debug).displayLog(coinbaseResponse.toString());

    return coinbaseResponse;
  }

  //

  ///Returns all Charges
  Future<List<ChargeObject>> get retrieveAllCharges async {
    List<ChargeObject> coinbaseResponse;
    List data;
    Map response = await getFromDB(
      api: 'https://api.commerce.coinbase.com/charges',
      apiKey: _apiKey,
    );
    if (response.containsKey('error')) {
      data = response['error'];
    } else {
      data = response['data'];
    }

    coinbaseResponse = List.generate(
        data.length, (index) => ChargeObject().fromJson(data[index]));

    Logger(debug).displayLog(coinbaseResponse.toString());
    return coinbaseResponse;
  }

  Future<ChargeObject> cancelCharge(String code) async {
    ChargeObject coinbaseResponse;
    Map data;

    Map response = await postToDB(
      body: {},
      apiKey: _apiKey,
      api: 'https://api.commerce.coinbase.com/charges/$code/cancel',
    );
    if (response.containsKey('error')) {
      data = response['error'];
    } else {
      data = response['data'];
    }
    coinbaseResponse = ChargeObject().fromJson(data);
    Logger(debug).displayLog(coinbaseResponse.toString());
    return coinbaseResponse;
  }

  Future<ChargeObject> resolveCharge(String code) async {
    ChargeObject coinbaseResponse;
    Map data;
    Map response = await postToDB(
      body: {},
      apiKey: _apiKey,
      api: 'https://api.commerce.coinbase.com/charges/$code/resolve',
    );
    if (response.containsKey('error')) {
      data = response['data'];
    } else {
      data = response['data'];
    }
    coinbaseResponse = ChargeObject().fromJson(data);
    Logger(debug).displayLog(coinbaseResponse.toString());
    return coinbaseResponse;
  }

  Future<ChargeObject> viewCharge(String code) async {
    ChargeObject coinbaseResponse;
    Map data;
    Map response = await getFromDB(
      api: 'https://api.commerce.coinbase.com/charges/$code',
      apiKey: _apiKey,
    );
    if (response.containsKey('error')) {
      data = response['error'];
    } else {
      data = response['data'];
    }
    coinbaseResponse = ChargeObject().fromJson(data);
    Logger(debug).displayLog(coinbaseResponse.toString());
    return coinbaseResponse;
  }

  Future<CheckoutObject> createCheckout(
      {required String description,
      required String name,
      int? amount,
      required PricingType pricingType,
      required CurrencyType currency}) async {
    CheckoutObject coinbaseResponse;
    Map data;
    Map<String, dynamic> body = {
      "name": name,
      "description": description,
      "pricing_type": getPricingType(pricingType),
      "requested_info": ['email', 'name']
    };
    if (pricingType == PricingType.fixedPrice) {
      assert(amount != null);
      body["local_price"] = {
        "amount": amount,
        "currency": getCurrency(currency)
      };
    }
    Map response = await postToDB(
        api: 'https://api.commerce.coinbase.com/checkouts',
        apiKey: _apiKey,
        body: body);
    if (response.containsKey('error')) {
      data = response['error'];
    } else {
      data = response['data'];
    }
    coinbaseResponse = CheckoutObject().fromJson(data);
    Logger(debug).displayLog(coinbaseResponse.toString());
    return coinbaseResponse;
  }

  Future<CheckoutObject> updateCheckout(
      {required String checkoutID,
      required String description,
      required String name,
      int? amount,
      required PricingType pricingType,
      required CurrencyType currency}) async {
    CheckoutObject coinbaseResponse;
    Map data;
    Map<String, dynamic> body = {
      "name": name,
      "description": description,
      "pricing_type": getPricingType(pricingType),
      "requested_info": ['email', 'name']
    };
    if (pricingType == PricingType.fixedPrice) {
      assert(amount != null);
      body["local_price"] = {
        "amount": amount,
        "currency": getCurrency(currency)
      };
    }
    Map response = await putOnDB(
        api: 'https://api.commerce.coinbase.com/checkouts/$checkoutID',
        apiKey: _apiKey,
        body: body);
    if (response.containsKey('error')) {
      data = response['error'];
    } else {
      data = response['data'];
    }
    coinbaseResponse = CheckoutObject().fromJson(data);
    Logger(debug).displayLog(coinbaseResponse.toString());
    return coinbaseResponse;
  }

  Future<CheckoutObject> deleteCheckout({
    required String checkoutID,
  }) async {
    CheckoutObject coinbaseResponse;
    Map data;
    Map response = await deleteFromDB(
        api: 'https://api.commerce.coinbase.com/checkouts/$checkoutID',
        apiKey: _apiKey);
    if (response.containsKey('error')) {
      data = response['error'];
    } else {
      data = response['data'];
    }
    coinbaseResponse = CheckoutObject().fromJson(data);
    Logger(debug).displayLog(coinbaseResponse.toString());
    return coinbaseResponse;
  }

  Future<CheckoutObject> viewCheckout(String code) async {
    CheckoutObject coinbaseResponse;
    Map data;
    Map response = await getFromDB(
      api: 'https://api.commerce.coinbase.com/checkouts/$code',
      apiKey: _apiKey,
    );
    if (response.containsKey('error')) {
      data = response['error'];
    } else {
      data = response['data'];
    }
    coinbaseResponse = CheckoutObject().fromJson(data);
    Logger(debug).displayLog(coinbaseResponse.toString());
    return coinbaseResponse;
  }

  ///Returns all Charges
  Future<List<CheckoutObject>> get retrieveAllCheckouts async {
    List<CheckoutObject> coinbaseResponse;
    List data;
    Map response = await getFromDB(
      api: 'https://api.commerce.coinbase.com/checkouts',
      apiKey: _apiKey,
    );
    if (response.containsKey('error')) {
      data = response['error'];
    } else {
      data = response['data'];
    }
    coinbaseResponse = List.generate(
        data.length, (index) => CheckoutObject().fromJson(data[index]));
    Logger(debug).displayLog(coinbaseResponse.toString());
    return coinbaseResponse;
  }

  Future<InvoiceObject> createInvoice(
      {required String businessName,
      required String customerEmail,
      required String customerName,
      required CurrencyType currency,
      required int amount,
      String? memo}) async {
    InvoiceObject coinbaseResponse;
    Map data;

    Map response = await postToDB(
        api: 'https://api.commerce.coinbase.com/invoices',
        apiKey: _apiKey,
        body: {
          'business_name': businessName,
          'customer_email': customerEmail,
          'customer_name': customerName,
          'local_price': {'amount': amount, 'currency': getCurrency(currency)}
        });
    if (response.containsKey('error')) {
      data = response['error'];
    } else {
      data = response['data'];
    }
    coinbaseResponse = InvoiceObject().fromJson(data);
    Logger(debug).displayLog(coinbaseResponse.toString());
    return coinbaseResponse;
  }

  ///Returns an [InvoiceObject] for the invoice with the supplied Invoice code
  Future<InvoiceObject> viewInvoice(String code) async {
    InvoiceObject coinbaseResponse;
    Map data;
    Map response = await getFromDB(
      api: 'https://api.commerce.coinbase.com/invoices/$code',
      apiKey: _apiKey,
    );
    if (response.containsKey('error')) {
      data = response['error'];
    } else {
      data = response['data'];
    }
    coinbaseResponse = InvoiceObject().fromJson(data);
    Logger(debug).displayLog(coinbaseResponse.toString());
    return coinbaseResponse;
  }

  ///TODO: Figure out how to get this API to work
  ///it is not working even when you try using curl requests on [PostMan]
  ///This function receives an [Invoice code] argument and voids the invoice
  ///Returning an [InvoiceObject] with null parameters
  Future<InvoiceObject> voidInvoice({required String code}) async {
    InvoiceObject coinbaseResponse;
    Map data;
    Map response = await postToDB(
        api: 'https://api.commerce.coinbase.com/invoices/$code/void',
        apiKey: _apiKey,
        body: {});

    if (response.containsKey('error')) {
      data = response['error'];
    } else {
      data = response['data'];
    }

    ///Cast an [InvoiceObject] from the returned Map
    coinbaseResponse = InvoiceObject().fromJson(data);
    Logger(debug).displayLog(coinbaseResponse.toString());
    return coinbaseResponse;
  }
}
