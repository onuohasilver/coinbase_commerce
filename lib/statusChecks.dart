import 'package:coinbase_commerce/enums.dart';
import 'package:coinbase_commerce/returnObjects/chargeObject.dart';

import 'customFunctions/switchFunctions.dart';
import 'returnObjects/statusObject.dart';

class StatusCheck {
  ///Checks the current status of a charge object
  StatusObject checkChargeStatus(ChargeObject chargeObject) {
    TransactionStatus status =
        getTransactionStatus(chargeObject.timeline!.last['status']);
    DateTime dateTime = chargeObject.timeline!.last['time'];
    String context = chargeObject.timeline!.last['context'];
    return StatusObject(status: status, time: dateTime, context: context);
  }
}
