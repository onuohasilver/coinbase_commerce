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

// NEW, PENDING, COMPLETED, EXPIRED, UNRESOLVED, RESOLVED, CANCELED, REFUND PENDING, REFUNDED
TransactionStatus getTransactionStatus(String status) {
  switch (status) {
    case 'NEW':
      return TransactionStatus.new_;
    case 'PENDING':
      return TransactionStatus.pending;
    case 'COMPLETED':
      return TransactionStatus.completed;
    case 'EXPIRED':
      return TransactionStatus.expired;
    case 'UNRESOLVED':
      return TransactionStatus.unresolved;
    case 'RESOLVED':
      return TransactionStatus.resolved;
    case 'CANCELED':
      return TransactionStatus.canceled;
    case 'REFUND PENDING':
      return TransactionStatus.refund_pending;
    case 'REFUNDED':
      return TransactionStatus.refunded;

    default:
      return TransactionStatus.new_;
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
