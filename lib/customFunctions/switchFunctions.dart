import '../enums.dart';

///retrieves the type of pricing for the charges
///pricing type: [no_price] or [fixed_price]
///a [fixed_price] requires the user to also provide the [local_price] argument
///a [no_price] means that any amount can be received through the created charge
String getPricingType(PricingType type) {
  switch (type) {
    case PricingType.fixedPrice:
      return 'fixed_price';
    case PricingType.noPrice:
      return 'no_price';
    default:
      return 'no_price';
  }
}

String getCurrency(CurrencyType type) {
  switch (type) {
    case CurrencyType.usd:
      return 'USD';

    default:
      return 'usd';
  }
}
