import 'package:coinbase_commerce/enums.dart';
import 'package:coinbase_commerce/returnObjects/chargeObject.dart';

import 'customFunctions/switchFunctions.dart';
import 'returnObjects/statusObject.dart';

class StatusCheck {
  ///Checks the current status of a charge object
  ///A status Object containing only [TransactionStatus.none] means the charge doesn't exist
  StatusObject checkChargeStatus(ChargeObject chargeObject) {
    if (chargeObject.isSuccessful!) {
      ///Maps the retutrning status value of the charge to a [TransactionStatus] enum.
      TransactionStatus? status =
          getTransactionStatus(chargeObject.timeline!.last['status']);

      ///Gets the time at which the charge status was updated
      DateTime? dateTime =
          DateTime.tryParse(chargeObject.timeline!.last['time']);

      ///Gets the context message where available
      String? context = chargeObject.timeline!.last['context'];
      return StatusObject(status: status, time: dateTime, context: context);
    } else {
      ///A none transaction is returned when there is no charge associated with the  requested
      return StatusObject(
          status: TransactionStatus.none, time: null, context: null);
    }
  }
}
