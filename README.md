# coinbase_commerce

A dart library that connects to interact with the Coinbase Commerce API. 
Enables projects to connect seamlessly to coinbase and receive payments!

For more details visit Coinbase API docs.

To start using library, you need to register on Coinbase Commerce and get your API_KEY from user settings.

Next create a Coinbase object for interacting with the API:
the object contains links to an dart Class representations of the API resources Checkout, Charge and Invoice.

Each request returns a CoinbaseResponseObject.
Every CoinbaseResponseObject matches the API response Jsons and casts them as models.

# Features
* Create Charges
* Cancel Charges
* View Charges
* List Charges
* View The Status of Charges
* Create Invoices
* View Invoices
* List Invoices
* Create Checkouts
* Delete Checkouts
* View Checkouts
* List Checkouts

See also:
- [The official Coinbase Commerce API documentation](https://commerce.coinbase.com/docs/api/).

# Usage
To create a new instance of a coinbase_commerce object you have to supply your API as generated from the coinbase commerce settings page.
```dart 
Coinbase coinbase=Coinbase('YOUR API KEY HERE',debug:true);
```
### Charges
#### To create a new charge 

```dart
ChargeObject charge = await coinbase.createCharge(
                        name: 'Coffee Charge',
                        description: '3 cups of Coffee',
                        currency: CurrencyType.usd,
                        pricingType: PricingType.fixedPrice,
                        amount: 40);
```

#### To view the status of Your previously created charge

```dart
StatusObject status = StatusCheck().checkChargeStatus(image);
```
Charges can either be (NEW, PENDING, COMPLETED, EXPIRED,
UNRESOLVED, RESOLVED, CANCELED, REFUND PENDING, REFUNDED,NONE)

In the case where it returns a status of none it implies that no record of the charge was seen.

#### To view the information concerning a particular charge

```dart
ChargeObject charge = await coinbase.viewCharge('YOUR CHARGE ID HERE');
```

#### To cancel a charge
```dart
ChargeObject charge= await coinbase.cancelCharge('YOUR CHARGE ID HERE');
```
#### To list all charges assoiciated with an account

```dart
List<ChargeObject> charge = await coinbase.retrieveAllCharges;
```
### Checkouts
#### To create a new checkout
```dart
CheckoutObject checkout = await coinbase.createCheckout(
                        description: 'description',
                        name: 'name',
                        pricingType: PricingType.noPrice,
                        currency: CurrencyType.usd);
```
#### To view the information concerning a particular checkout

```dart
CheckoutObject charge = await coinbase.viewCheckout('YOUR CHECKOUT ID HERE');
```
#### To update a previously created checkout, supply the id and the new information,
```dart
CheckoutObject checkout = await coinbase.updateCheckout(
                        checkoutID: 'c4357d83-42d4-4d7b-bc44-d0262b1efd25',
                        name: 'New Name here');
```
#### To delete a checkout
```dart
CheckoutObject checkout= await coinbase.deleteCheckout('YOUR CHECKOUT ID HERE');
```

#### To List all charges assoiciated with an account

```dart
List<CheckoutObject> checkoutList = await coinbase.retrieveAllCheckouts;
```

### Invoices

#### To create a new invoice
```dart
InvoiceObject invoice = await coinbase.createInvoice(
                      businessName: 'businessName',
                      customerEmail: 'onuohasilver9@gmail.com',
                      customerName: 'Onuoha Silver',
                      currency: CurrencyType.usd,
                      amount: 20,
                    );
```

#### To view an invoice
```dart
InvoiceObject invoice = await coinbase
                        .viewInvoice('2a4aeb3e-a12b-4728-9c88-297dea5d2adb');
```
#### To retrieve all Invoices
```dart
List<InvoiceObject> invoice =await coinbase.retrieveAllInvoices;
```









