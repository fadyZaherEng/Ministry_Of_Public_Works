import 'package:aim/src/domain/entities/package/package.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_package.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemotePackage extends Package {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'projectName')
  final String? projectName;
  @JsonKey(name: 'contractNumber')
  final String? agreementNumber;
  @JsonKey(name: 'finalHandOverCertificationstr')
  final String? finalHandOverCertificationstr;
  @JsonKey(name: 'finalPaymentIssuedstr')
  final String? finalPaymentIssuedstr;
  @JsonKey(name: 'initialHandOverCertificationstr')
  final String? initialHandOverCertificationstr;
  @JsonKey(name: 'finalInsuranceReleasedstr')
  final String? finalInsuranceReleasedstr;
  @JsonKey(name: 'releasedReservedWarrantystr')
  final String? releasedReservedWarrantystr;
  @JsonKey(name: 'pbkpi')
  final int? pbkpi;



  RemotePackage(
      this.id,
      this.projectName,
      this.agreementNumber,
      this.finalHandOverCertificationstr,
      this.finalPaymentIssuedstr,
      this.initialHandOverCertificationstr,
      this.finalInsuranceReleasedstr,
      this.releasedReservedWarrantystr,
      this.pbkpi,
      ) : super(
    id: id ?? "",
    projectName: projectName ?? "",
    agreementNumber: agreementNumber ?? "",
    finalHandOverCertificationstr: finalHandOverCertificationstr ?? "",
    finalPaymentIssuedstr: finalPaymentIssuedstr ?? "",
    initialHandOverCertificationstr: initialHandOverCertificationstr ?? "",
    finalInsuranceReleasedstr: finalInsuranceReleasedstr ?? "",
    releasedReservedWarrantystr: releasedReservedWarrantystr ?? "",
    pbkpi: pbkpi ?? 0,
  );

  factory RemotePackage.fromJson(Map<String, dynamic> json) =>
      _$RemotePackageFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePackageToJson(this);
}
