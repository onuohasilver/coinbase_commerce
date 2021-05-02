import '../enums.dart';

class StatusObject {
  StatusObject({this.status, this.context, this.time});
  final TransactionStatus? status;
  final DateTime? time;
  final String? context;
}
