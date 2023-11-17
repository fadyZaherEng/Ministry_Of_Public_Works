// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_design.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteDesign _$RemoteDesignFromJson(Map<String, dynamic> json) => RemoteDesign(
      json['id'] as String?,
      json['projectName'] as String?,
      json['contractNumber'] as String?,
      (json['finalDesignActual'] as num?)?.toDouble(),
      (json['constructionTenderActual'] as num?)?.toDouble(),
      (json['constructionTenderPlanned'] as num?)?.toDouble(),
      (json['finalDesignPlanned'] as num?)?.toDouble(),
      (json['preliminaryDesignActual'] as num?)?.toDouble(),
      (json['preliminaryDesignPlanned'] as num?)?.toDouble(),
      (json['designDevelopmentActual'] as num?)?.toDouble(),
      (json['designDevelopmentPlanned'] as num?)?.toDouble(),
      (json['conceptDesignActual'] as num?)?.toDouble(),
      (json['conceptDesignPlanned'] as num?)?.toDouble(),
      (json['designTenderingActual'] as num?)?.toDouble(),
      (json['dataCollectingActual'] as num?)?.toDouble(),
      (json['dataCollectingPlanned'] as num?)?.toDouble(),
      (json['totalDelay'] as num?)?.toDouble(),
      (json['designTenderingPlanned'] as num?)?.toDouble(),
      (json['planningActual'] as num?)?.toDouble(),
      (json['planningPlanned'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RemoteDesignToJson(RemoteDesign instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectName': instance.projectName,
      'contractNumber': instance.agreementNumber,
      'planningPlanned': instance.planningPlanned,
      'planningActual': instance.planningActual,
      'designTenderingPlanned': instance.designTenderingPlanned,
      'designTenderingActual': instance.designTenderingActual,
      'dataCollectingPlanned': instance.dataCollectingPlanned,
      'dataCollectingActual': instance.dataCollectingActual,
      'conceptDesignPlanned': instance.conceptDesignPlanned,
      'conceptDesignActual': instance.conceptDesignActual,
      'designDevelopmentPlanned': instance.designDevelopmentPlanned,
      'designDevelopmentActual': instance.designDevelopmentActual,
      'preliminaryDesignPlanned': instance.preliminaryDesignPlanned,
      'preliminaryDesignActual': instance.preliminaryDesignActual,
      'finalDesignPlanned': instance.finalDesignPlanned,
      'finalDesignActual': instance.finalDesignActual,
      'constructionTenderPlanned': instance.constructionTenderPlanned,
      'constructionTenderActual': instance.constructionTenderActual,
      'totalDelay': instance.designKPI,
    };
