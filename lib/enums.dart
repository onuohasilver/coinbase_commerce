///Available Pricing Types
///[PricingType.fixedPrice] allows the payee to parse in a specified price for payment
///[PricingType.fixedPrice] ensures the payer can input any amount for payment
enum PricingType { fixedPrice, noPrice }

///The fiat currency type for which transactions are made.
///defaults to the US dollar.
enum CurrencyType { usd }

///Enumerates all the possible status responses of a coinbase charge
enum TransactionStatus {
  resolved,
  new_,
  pending,
  completed,
  expired,
  unresolved,
  canceled,
  refund_pending,
  refunded,
  none
}

///The logging level while in debug mode
enum Verbose { high, low }
