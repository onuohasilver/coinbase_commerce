import 'package:coinbase_commerce/coinbase_commerce.dart';
import 'package:coinbase_commerce/returnObjects/statusObject.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatefulWidget {
  @override
  _ExampleScreenState createState() => _ExampleScreenState();
}

Coinbase coinbase =
    Coinbase('8884c17e-6854-43a5-9d48-7a8ec885776d', debug: true);
String output = 'Output';

class _ExampleScreenState extends State<ExampleScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 50),
            Text(
              'Coinbase Example App',
              style: TextStyle(fontSize: 30),
            ),
            Wrap(
              children: [
                TextButton(
                  onPressed: () async {
                    ChargeObject image = await coinbase.createCharge(
                        name: 'Record Me',
                        description: 'description',
                        currency: CurrencyType.usd,
                        pricingType: PricingType.fixedPrice,
                        amount: 40);

                    StatusObject status =
                        StatusCheck().checkChargeStatus(image);
                    setState(() {
                      output = status.status.toString();
                    });
                  },
                  child: Text('Create a Charge'),
                ),
                TextButton(
                  onPressed: () async {
                    ChargeObject image =
                        await coinbase.cancelCharge('MJ7ED8BQ');
                    StatusObject status =
                        StatusCheck().checkChargeStatus(image);
                    setState(() {
                      output = status.status.toString();
                    });
                  },
                  child: Text('Cancel a Charge'),
                ),
                TextButton(
                  onPressed: () async {
                    ChargeObject image = await coinbase.viewCharge('RLWADR5Z');
                    setState(() {
                      output = image.toString();
                    });
                  },
                  child: Text('View a Charge'),
                ),
                TextButton(
                  onPressed: () async {
                    CheckoutObject image = await coinbase.createCheckout(
                        description: 'description',
                        name: 'name',
                        pricingType: PricingType.noPrice,
                        // amount: 30,
                        currency: CurrencyType.usd);

                    setState(() {
                      output = image.toString();
                    });
                  },
                  child: Text('Create a Checkout'),
                ),
                TextButton(
                  onPressed: () async {
                    CheckoutObject image = await coinbase.updateCheckout(
                        checkoutID: 'c4357d83-42d4-4d7b-bc44-d0262b1efd25',
                        description: 'description',
                        name: 'Silver Gold',
                        pricingType: PricingType.noPrice,
                        currency: CurrencyType.usd);
                    setState(() {
                      output = image.toString();
                    });
                  },
                  child: Text('Update a Checkout'),
                ),
                TextButton(
                  onPressed: () async {
                    CheckoutObject image = await coinbase
                        .viewCheckout('e8e6d87c-d591-4ff4-bff6-0c8aaa161f29');
                    setState(() {
                      output = image.toString();
                    });
                  },
                  child: Text('View  Checkout'),
                ),
                TextButton(
                  onPressed: () async {
                    CheckoutObject image = await coinbase.deleteCheckout(
                        checkoutID: 'e8e6d87c-d591-4ff4-bff6-0c8aaa161f29');
                    setState(() {
                      output = image.toString();
                    });
                  },
                  child: Text('Delete checkout'),
                ),
                TextButton(
                  onPressed: () async {
                    InvoiceObject image = await coinbase.createInvoice(
                      businessName: 'businessName',
                      customerEmail: 'onuohasilver9@gmail.com',
                      customerName: 'Onuoha Silver',
                      currency: CurrencyType.usd,
                      amount: 20,
                    );
                    setState(() {
                      output = image.toString();
                    });
                  },
                  child: Text('Create an Invoice'),
                ),
                TextButton(
                  onPressed: () async {
                    InvoiceObject image =
                        await coinbase.voidInvoice(code: 'ZY259PAT');
                    setState(() {
                      output = image.toString();
                    });
                  },
                  child: Text('Void an Invoice'),
                ),
                TextButton(
                  onPressed: () async {
                    InvoiceObject image = await coinbase
                        .viewInvoice('2a4aeb3e-a12b-4728-9c88-297dea5d2adb');
                    setState(() {
                      output = image.toString();
                    });
                  },
                  child: Text('View an Invoice'),
                ),
                TextButton(
                  onPressed: () async {
                    List<ChargeObject> image =
                        await coinbase.retrieveAllCharges;
                    setState(() {
                      output = image.length.toString();
                    });
                  },
                  child: Text('List all charges'),
                ),
                TextButton(
                  onPressed: () async {
                    List<CheckoutObject> image =
                        await coinbase.retrieveAllCheckouts;
                    setState(() {
                      output = image.length.toString();
                    });
                  },
                  child: Text('List all checkouts'),
                ),
              ],
            ),
            Text(
              output,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
