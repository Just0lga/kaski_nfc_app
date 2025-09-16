import 'package:json_annotation/json_annotation.dart';

enum OperationType {
  @JsonValue('None')
  none,
  @JsonValue('AddCredit')
  addCredit,
  @JsonValue('ClearCredits')
  clearCredits,
  @JsonValue('SetCredit')
  setCredit,
}

extension OperationTypeExtension on OperationType {
  String get displayName {
    switch (this) {
      case OperationType.none:
        return 'None';
      case OperationType.addCredit:
        return 'Add Credit';
      case OperationType.clearCredits:
        return 'Clear Credits';
      case OperationType.setCredit:
        return 'Set Credit';
    }
  }
}

enum ResultCode {
  success,
  failed,
  cardReaded,
  cardNotReadYet,
  readCardAgain,
  nfcReaderActivated,
  nfcReaderDeactive,
}

enum LicenseResultCode {
  licenseIsValid,
  licenseIsInvalid,
  licenseExpired,
  licenseNotFound,
}
