import 'package:aim/src/data/sources/remote/aim/agreements/entity/remote_agreement.dart';
import 'package:aim/src/domain/entities/agreement/agreements_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_agreements_data.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteAgreementsData extends AgreementsData {
  @JsonKey(name: 'projectSupervisionServicelist')
  final List<RemoteAgreement>? agreements;
  @JsonKey(name: 'recordsTotal')
  final int? recordsTotal;

  RemoteAgreementsData(
    this.agreements,
    this.recordsTotal,
  ) : super(
          agreements: agreements ?? [],
          recordsTotal: recordsTotal ?? 0,
        );

  factory RemoteAgreementsData.fromJson(Map<String, dynamic> json) =>
      _$RemoteAgreementsDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAgreementsDataToJson(this);
}
