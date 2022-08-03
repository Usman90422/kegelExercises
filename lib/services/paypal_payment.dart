import 'package:flutter/material.dart';
import 'package:kegel_training/services/payapl_services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaypalPayment extends StatefulWidget {
  const PaypalPayment({Key? key,required this.onFinish,required this.amount}) : super(key: key);

  final String amount;
  final Function onFinish;
  @override
  State<PaypalPayment> createState() => _PaypalPaymentState();
}

class _PaypalPaymentState extends State<PaypalPayment> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   String checkoutUrl='';
   String executeUrl='';
  late String accessToken;
  PaypalServices services = PaypalServices();


  bool isEnableShipping = false;
  bool isEnableAddress = false;

  String returnURL = 'return.example.com';
  String cancelURL= 'cancel.example.com';



  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 0), () async {
      try {
        accessToken = await services.getAccessToken();

        final transactions = getOrderParams();
        final res =
        await services.createPaypalPayment(transactions, accessToken);
        if (res != null) {
          setState(() {
            checkoutUrl = res["approvalUrl"] as String;
            executeUrl = res["executeUrl"] as String;
          });
        }
      } catch (e) {
        print('exception: '+e.toString());
        final snackBar = SnackBar(
          content: Text(e.toString()),
          duration: const Duration(seconds: 10),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        _scaffoldKey.currentState?.showSnackBar(snackBar);
      }
    });
  }

  // String itemName = 'iPhone X';
  // String itemPrice = '1.99';
  // int quantity = 1;

  Map<dynamic,dynamic> defaultCurrency = {"symbol": "USD ", "decimalDigits": 2, "symbolBeforeTheNumber": true, "currency": "USD"};

  Map<String, dynamic> getOrderParams() {

    // checkout invoice details
    // String totalAmount = '1.99';
    // String subTotalAmount = '1.99';
    // String shippingCost = '0';
    // int shippingDiscountCost = 0;
    // String userFirstName = 'Gulshan';
    // String userLastName = 'Yadav';
    // String addressCity = 'Delhi';
    // String addressStreet = 'Mathura Road';
    // String addressZipCode = '110014';
    // String addressCountry = 'India';
    // String addressState = 'Delhi';
    // String addressPhoneNumber = '+919990119091';

    Map<String, dynamic> temp = {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": [
        {
          "amount": {
            "total": widget.amount,
            "currency": defaultCurrency["currency"],
          },
          "description": "The payment transaction description.",
          "payment_options": {
            "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
          },

        }
      ],
      "note_to_payer": "Contact us for any questions on your order.",
      "redirect_urls": {
        "return_url": returnURL,
        "cancel_url": cancelURL
      }
    };
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    print("Checkout $checkoutUrl");
    if (checkoutUrl.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context),
          ),
        ),
        body: WebView(
          initialUrl: checkoutUrl,
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) {
            if (request.url.contains(returnURL)) {
              final uri = Uri.parse(request.url);
              final payerID = uri.queryParameters['PayerID'];
              if (payerID != null) {
                services
                    .executePayment(executeUrl, payerID, accessToken)
                    .then((id) {
                  widget.onFinish(id);
                  Navigator.of(context).pop();
                });
              } else {
                Navigator.of(context).pop();
              }
              Navigator.of(context).pop();
            }
            if (request.url.contains(cancelURL)) {
              Navigator.of(context).pop();
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    } else {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
        body: Center(child: Container(child: const CircularProgressIndicator(color: Colors.red,))),
      );
    }
  }
}


