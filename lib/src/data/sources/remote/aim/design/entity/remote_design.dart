import 'package:aim/src/domain/entities/design/design.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_design.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteDesign extends Design {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'projectName')
  final String? projectName;
  @JsonKey(name: 'contractNumber')
  final String? agreementNumber;
  @JsonKey(name: 'planningPlanned')
  final double? planningPlanned;
  @JsonKey(name: 'planningActual')
  final double? planningActual;
  @JsonKey(name: 'designTenderingPlanned')
  final double? designTenderingPlanned;
  @JsonKey(name: 'designTenderingActual')
  final double? designTenderingActual;
  @JsonKey(name: 'dataCollectingPlanned')
  final double? dataCollectingPlanned;
  @JsonKey(name: 'dataCollectingActual')
  final double? dataCollectingActual;
  @JsonKey(name: 'conceptDesignPlanned')
  final double? conceptDesignPlanned;
  @JsonKey(name: 'conceptDesignActual')
  final double? conceptDesignActual;
  @JsonKey(name: 'designDevelopmentPlanned')
  final double? designDevelopmentPlanned;
  @JsonKey(name: 'designDevelopmentActual')
  final double? designDevelopmentActual;
  @JsonKey(name: 'preliminaryDesignPlanned')
  final double? preliminaryDesignPlanned;
  @JsonKey(name: 'preliminaryDesignActual')
  final double? preliminaryDesignActual;
  @JsonKey(name: 'finalDesignPlanned')
  final double? finalDesignPlanned;
  @JsonKey(name: 'finalDesignActual')
  final double? finalDesignActual;
  @JsonKey(name: 'constructionTenderPlanned')
  final double? constructionTenderPlanned;
  @JsonKey(name: 'constructionTenderActual')
  final double? constructionTenderActual;
  @JsonKey(name: 'totalDelay') //Can be pbkpi
  final double? designKPI;

  const RemoteDesign(
    this.id,
    this.projectName,
    this.agreementNumber,
    this.finalDesignActual,
    this.constructionTenderActual,
    this.constructionTenderPlanned,
    this.finalDesignPlanned,
    this.preliminaryDesignActual,
    this.preliminaryDesignPlanned,
    this.designDevelopmentActual,
    this.designDevelopmentPlanned,
    this.conceptDesignActual,
    this.conceptDesignPlanned,
    this.designTenderingActual,
    this.dataCollectingActual,
    this.dataCollectingPlanned,
    this.designKPI,
    this.designTenderingPlanned,
    this.planningActual,
    this.planningPlanned,
  ) : super(
          id: id ?? "",
          projectName: projectName ?? "",
          agreementNumber: agreementNumber ?? "",
    finalDesignActual: finalDesignActual ?? 0.0,
    constructionTenderActual: constructionTenderActual ?? 0.0,
    constructionTenderPlanned: constructionTenderPlanned ?? 0.0,
    finalDesignPlanned: finalDesignPlanned ?? 0.0,
    preliminaryDesignActual: preliminaryDesignActual ?? 0.0,
    preliminaryDesignPlanned: preliminaryDesignPlanned ?? 0.0,
    designDevelopmentActual: designDevelopmentActual ?? 0.0,
    designDevelopmentPlanned: designDevelopmentPlanned ?? 0.0,
    conceptDesignActual: conceptDesignActual ?? 0.0,
    conceptDesignPlanned: conceptDesignPlanned ?? 0.0,
    designTenderingActual: designTenderingActual ?? 0.0,
    dataCollectingActual: dataCollectingActual ?? 0.0,
    dataCollectingPlanned: dataCollectingPlanned ?? 0.0,
    designKPI: designKPI ?? 0.0,
    designTenderingPlanned: designTenderingPlanned ?? 0.0,
    planningActual: planningActual ?? 0.0,
    planningPlanned: planningPlanned ?? 0.0,


        );

  factory RemoteDesign.fromJson(Map<String, dynamic> json) =>
      _$RemoteDesignFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteDesignToJson(this);
}
