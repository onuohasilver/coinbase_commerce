# coinbase_commerce

A dart library that connects to interact with the Coinbase Commerce API. 
Enables projects to connect seamlessly to coinbase and receive payments!

For more details visit Coinbase API docs.

To start using library, you need to register on Commerce SignUp. And get your API_KEY from user settings.

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

# Usage

