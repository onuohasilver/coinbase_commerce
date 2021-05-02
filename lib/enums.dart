enum PricingType { fixedPrice, noPrice }
enum CurrencyType { usd }
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
enum Verbose { high, low }
