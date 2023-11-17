import 'package:equatable/equatable.dart';

class Package extends Equatable {
  final String? id;
  final String? projectName;
  final String? agreementNumber;
  final String? finalHandOverCertificationstr;
  final String? finalPaymentIssuedstr;
  final String? initialHandOverCertificationstr;
  final String? finalInsuranceReleasedstr;
  final String? releasedReservedWarrantystr;
  final int? pbkpi;

  Package({
    this.id = "",
    this.projectName = "",
    this.agreementNumber = "",
    this.finalHandOverCertificationstr = "",
    this.finalPaymentIssuedstr = "",
    this.initialHandOverCertificationstr = "",
    this.finalInsuranceReleasedstr = "",
    this.releasedReservedWarrantystr = "",
    this.pbkpi = 0,
  });

  @override
  List<Object?> get props => [
        id,
        projectName,
        agreementNumber,
        finalHandOverCertificationstr,
        finalPaymentIssuedstr,
        initialHandOverCertificationstr,
        finalInsuranceReleasedstr,
        releasedReservedWarrantystr,
        pbkpi,
      ];
}
