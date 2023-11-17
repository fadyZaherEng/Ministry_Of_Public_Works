import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/date_utils.dart';
import 'package:aim/src/config/utils/extensions.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/domain/entities/reports/report.dart';
import 'package:aim/src/presentation/bloc/reports/forms/reports_forms_bloc.dart';
import 'package:aim/src/presentation/widgets/app_bar_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportFormScreen extends BaseStatefulWidget {
  final String id;

  const ReportFormScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _ReportFormScreenState();
}

class _ReportFormScreenState extends BaseState<ReportFormScreen> {
  ReportsFormsBloc get _reportsFormsBloc =>
      BlocProvider.of<ReportsFormsBloc>(context);
  int phaseID = 0;
  Report _report = Report();

  @override
  void initState() {
    super.initState();
    _getReportByIdEvent(widget.id);
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<ReportsFormsBloc, ReportsFormsState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetReportByIdSuccessState) {
          _report = state.report;
          phaseID = state.report.phase?.toInt() ?? 0;
        } else if (state is GetReportByIdFailState) {}
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorSchema.white,
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    _buildAppBar(),
                    const SizedBox(height: 24),
                    _buildProjectInfo(),
                    const SizedBox(height: 6),
                    _buildProjectInformation(),
                    const SizedBox(height: 6),
                    _buildScheduleDetails(),
                    const SizedBox(height: 6),
                    _buildFinancialDetails(),
                    const SizedBox(height: 6),
                    _buildProjectWorks(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  AppBarWidget _buildAppBar() {
    return AppBarWidget(
      title: S.of(context).form,
      isHaveBackButton: true,
      imagePath: ImagePaths.arrowBack,
      isHaveForms: false,
      onFormsTab: () {},
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  Container _buildProjectInfo() {
    if (phaseID == 3) {
      return _buildExecutionProjectInfo();
    }
    return _buildDesignProjectInfo();
  }

  Container _buildDesignProjectInfo() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).projectBasicInformation),
      children: [
        Container(
          height: 4,
          color: ColorSchema.screenBackground,
        ),
        _buildWhiteDivider(10),
        _buildProjectNameText(),
        _buildWhiteDivider(16),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).designContractNumber,
            value: _report.contractNumber ?? "",
            imagePath: ImagePaths.number,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).endUser,
            value: _report.beneficiaryName ?? "",
            imagePath: ImagePaths.endUser,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectPhase,
            value: _report.phaseName ?? "",
            imagePath: ImagePaths.phase,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).projectEngineer,
            value: _report.projectEngineerName ?? "",
            imagePath: ImagePaths.projectEngineer,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectEngineerEmail,
            value: _report.projectEngineerEmail ?? "",
            imagePath: ImagePaths.engineerEmail,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).projectEngineerPhoneNumber,
            value: _report.projectEngineerPhoneNumber ?? "",
            imagePath: ImagePaths.engineerPhone,
            textDirection: TextDirection.ltr,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectEngineerFax,
            value: _report.projectEngineerFax ?? "",
            imagePath: ImagePaths.engineerFax,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).deputyProjectEngineer,
            value: _report.deputyProjectEngineerName ?? "",
            imagePath: ImagePaths.deputyManager,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).deputyProjectEngineerPhoneNumber,
            value: _report.deputyProjectEngineerPhoneNumber ?? "",
            imagePath: ImagePaths.deputyManagerPhone,
            textDirection: TextDirection.ltr,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).deputyProjectEngineerEmail,
            value: _report.deputyProjectEngineerEmail ?? "",
            imagePath: ImagePaths.deputyManagerEmail,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).consultant,
            value: _report.consultantName ?? "",
            imagePath: ImagePaths.consultant,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).consultantPhoneNumber,
            value: _report.consultantPhoneNumber ?? "",
            imagePath: ImagePaths.consultantPhone,
            textDirection: TextDirection.ltr,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).consultantEmail,
            value: _report.consultantEmail ?? "",
            imagePath: ImagePaths.consultantEmail,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).sector,
            value: _report.projectSector ?? "",
            imagePath: ImagePaths.sector,
          ),
        ),
        _buildWhiteDivider(12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProjectItem(
                title: S.of(context).projectNumberFinancial,
                value: _report.projectNumberFinancial ?? "",
                imagePath: ImagePaths.number,
              ),
            ],
          ),
        ),
        _buildWhiteDivider(12),
      ],
    ));
  }

  Container _buildExecutionProjectInfo() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).projectBasicInformation),
      children: [
        Container(
          height: 4,
          color: ColorSchema.screenBackground,
        ),
        _buildWhiteDivider(10),
        _buildProjectNameText(),
        _buildWhiteDivider(16),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).executionContractNumber,
            value: _report.executionContractNumber ?? "",
            imagePath: ImagePaths.number,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).endUser,
            value: _report.beneficiaryName ?? "",
            imagePath: ImagePaths.endUser,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectPhase,
            value: _report.phaseName ?? "",
            imagePath: ImagePaths.phase,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).projectEngineer,
            value: _report.projectEngineerName ?? "",
            imagePath: ImagePaths.projectEngineer,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectEngineerEmail,
            value: _report.projectEngineerEmail ?? "",
            imagePath: ImagePaths.engineerEmail,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).projectEngineerPhoneNumber,
            value: _report.projectEngineerPhoneNumber ?? "",
            imagePath: ImagePaths.engineerPhone,
            textDirection: TextDirection.ltr,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectEngineerFax,
            value: _report.projectEngineerFax ?? "",
            imagePath: ImagePaths.engineerFax,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).headOfDepartment,
            value: _report.headofDepartment ?? "",
            imagePath: ImagePaths.headOfDepartment,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).headOfDepartmentEmail,
            value: _report.headofDepartmentEmail ?? "",
            imagePath: ImagePaths.headOfDepartmentEmail,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).deputyProjectEngineer,
            value: _report.deputyProjectEngineerName ?? "",
            imagePath: ImagePaths.deputyManagerEmail,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).deputyProjectEngineerPhoneNumber,
            value: _report.deputyProjectEngineerPhoneNumber ?? "",
            imagePath: ImagePaths.consultant,
            textDirection: TextDirection.ltr,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).deputyProjectEngineerEmail,
            value: _report.deputyProjectEngineerEmail ?? "",
            imagePath: ImagePaths.consultantPhone,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).consultant,
            value: _report.consultantName ?? "",
            imagePath: ImagePaths.consultant,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).consultantPhoneNumber,
            value: _report.consultantPhoneNumber ?? "",
            imagePath: ImagePaths.sector,
            textDirection: TextDirection.ltr,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).consultantEmail,
            value: _report.consultantEmail ?? "",
            imagePath: ImagePaths.consultantEmail,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).sector,
            value: _report.projectSector ?? "",
            imagePath: ImagePaths.sector,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectNumberFinancial,
            value: _report.projectNumberFinancial ?? "",
            imagePath: ImagePaths.consultantEmail,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).contractor,
            value: _report.contractorName ?? "",
            imagePath: ImagePaths.contractor,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).contractorPhoneNumber,
            value: _report.contractorPhoneNumber ?? "",
            imagePath: ImagePaths.contactorPhone,
            textDirection: TextDirection.ltr,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).contractorFax,
            value: _report.contractorFax ?? "",
            imagePath: ImagePaths.engineerFax,
          ),
        ),
        _buildWhiteDivider(12),
      ],
    ));
  }

  Container _buildProjectInformation() {
    if (phaseID == 2 || phaseID == 3) {
      return _buildTenderingProjectInformation();
    }

    return _buildDesignProjectInformation();
  }

  Container _buildDesignProjectInformation() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).projectInformation),
      children: [
        Container(
          height: 4,
          color: ColorSchema.screenBackground,
        ),
        _buildWhiteDivider(16),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).location,
            value: _report.locationName ?? "",
            imagePath: ImagePaths.location,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).governorate,
            value: _report.governorateName ?? "",
            imagePath: ImagePaths.governorate,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).siteArea,
            value: "${_report.siteAreaDecimal ?? ""}".formatDoubleWithComma(),
            imagePath: ImagePaths.creationDate,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).buildUpArea,
            value:
                "${_report.buildUpAreaDecimal ?? ""}".formatDoubleWithComma(),
            imagePath: ImagePaths.assignedTo,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).designDurationMonth,
            value: "${_report.durationMonth ?? 0}".formatDoubleWithComma(),
            imagePath: ImagePaths.assignedTo,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).designContractSignDate,
            value: formatDateTime(_report.contractSignDate ?? ""),
            imagePath: ImagePaths.assignedTo,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).designCommenceDate,
            value: formatDateTime(_report.commenceDate ?? ""),
            imagePath: ImagePaths.assignedTo,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).executionExpectedTenderingDate,
            value: formatDateTime(_report.expectedTenderingDate ?? ""),
            imagePath: ImagePaths.assignedTo,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).executionExpectedStartDate,
            value: formatDateTime(_report.expectedStartDate ?? ""),
            imagePath: ImagePaths.assignedTo,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).executionExpectedCompletionDate,
            value:
                formatDateTime(_report.executionExpectedCompletionDate ?? ""),
            imagePath: ImagePaths.assignedTo,
          ),
        ),
        _buildWhiteDivider(12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProjectItem(
                title: S.of(context).tenderDate,
                value: formatDateTime(_report.tenderDate ?? ""),
                imagePath: ImagePaths.tenderDate,
              )
            ],
          ),
        ),
        _buildWhiteDivider(12),
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsetsDirectional.only(start: 6),
                child: _buildProjectItem(
                  title: S.of(context).components,
                  value: _report.components ?? "",
                  imagePath: ImagePaths.creationDate,
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }

  Container _buildTenderingProjectInformation() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).projectInformation),
      children: [
        Container(
          height: 4,
          color: ColorSchema.screenBackground,
        ),
        _buildWhiteDivider(16),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).location,
            value: _report.locationName ?? "",
            imagePath: ImagePaths.location,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).governorate,
            value: _report.governorateName ?? "",
            imagePath: ImagePaths.governorate,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).siteArea,
            value: "${_report.siteAreaDecimal ?? ""}".formatDoubleWithComma(),
            imagePath: ImagePaths.creationDate,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).buildUpArea,
            value:
                "${_report.buildUpAreaDecimal ?? ""}".formatDoubleWithComma(),
            imagePath: ImagePaths.assignedTo,
          ),
        ),
        _buildWhiteDivider(12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildProjectItem(
                  title: S.of(context).components,
                  value: _report.components ?? "",
                  imagePath: ImagePaths.creationDate,
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }

  Container _buildScheduleDetails() {
    if (phaseID == 2) return _buildTenderingScheduleDetails();
    if (phaseID == 3) return _buildExecutionScheduleDetails();
    return _buildDesignScheduleDetails();
  }

  Container _buildDesignScheduleDetails() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).scheduleDetails),
      children: [
        Container(
          height: 4,
          color: ColorSchema.screenBackground,
        ),
        _buildWhiteDivider(16),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).designCompletionDate,
            value: formatDateTime(_report.designCompletionDate ?? ""),
            imagePath: ImagePaths.serviceEndDate,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).designFinishDateWithExtension,
            value: formatDateTime(_report.designFinishDatewithExtension ?? ""),
            imagePath: ImagePaths.cosultancyServiceFinishData,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).plannedPercentageOfCompletion,
            value: "${_report.plannedPercentageofCompletion ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.actualPercentageOfComplete,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).actualPercentageOfComplete,
            value: "${_report.actualPercentageofCompletion ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.plannedPercentage,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).contractDurationDay,
            value: "${_report.contractDuration ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.extensionPeriod,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).extensionPeriod,
            value: "${_report.extensionPeriod ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.actualDate,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).elapsedTime,
            value: "${_report.elapsedTime ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.exchangePercentage,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).percentageOfElapsedTime,
            value: "${_report.percentageofElapsedTime ?? 0.0}",
            imagePath: ImagePaths.elapsedTime,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).remainingDuration,
            value:
                "${_report.remainingDuration ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.percentageElapsedTime,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).actualDelayDay,
            value: "${_report.actualdelay ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.countActualDelay,
          ),
        ),
      ],
    ));
  }

  Container _buildTenderingScheduleDetails() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).scheduleDetails),
      children: [
        Container(
          height: 4,
          color: ColorSchema.screenBackground,
        ),
        _buildWhiteDivider(16),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).designFinishDateWithExtension,
            value: formatDateTime(_report.designFinishDatewithExtension ?? ""),
            imagePath: ImagePaths.serviceEndDate,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).tenderDate,
            value: formatDateTime(_report.tenderDate ?? ""),
            imagePath: ImagePaths.cosultancyServiceFinishData,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).closeoutDate,
            value: formatDateTime(_report.closeoutDate ?? ""),
            imagePath: ImagePaths.actualPercentageOfComplete,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).executionExpectedStartDate,
            value: formatDateTime(_report.expectedStartDate ?? ""),
            imagePath: ImagePaths.plannedPercentage,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).executionDurationMonth,
            value: "${_report.durationMonth ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.extensionPeriod,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).executionExpectedCompletionDate,
            value:
                formatDateTime(_report.executionExpectedCompletionDate ?? ""),
            imagePath: ImagePaths.actualDate,
          ),
        ),
        _buildWhiteDivider(12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProjectItem(
                title: S.of(context).executionDurationDay,
                value: "${_report.durationDay ?? 0.0}".formatDoubleWithComma(),
                imagePath: ImagePaths.actualDate,
              ),
            ],
          ),
        )
      ],
    ));
  }

  Container _buildExecutionScheduleDetails() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).scheduleDetails),
      children: [
        Container(
          height: 4,
          color: ColorSchema.screenBackground,
        ),
        _buildWhiteDivider(16),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).contractSigningDate,
            value: formatDateTime(_report.contractSignDate ?? ""),
            imagePath: ImagePaths.serviceEndDate,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).commenceDate,
            value: formatDateTime(_report.commenceDate ?? ""),
            imagePath: ImagePaths.cosultancyServiceFinishData,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).contractualCompletionDate,
            value: formatDateTime(_report.contractualCompletionDate ?? ""),
            imagePath: ImagePaths.actualPercentageOfComplete,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).completionDateAfterExtension,
            value: formatDateTime(_report.completionDateAfterExtension ?? ""),
            imagePath: ImagePaths.plannedPercentage,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).expectedCompletionDateUpdate,
            value: formatDateTime(_report.expectedCompletionDateUpdated ?? ""),
            imagePath: ImagePaths.extensionPeriod,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).contractDurationDay,
            value: "${_report.contractDuration ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.actualDate,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).extensionPeriod,
            value: "${_report.extensionPeriod ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.exchangePercentage,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).delayDay,
            value: "${_report.delay ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.elapsedTime,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).delayPercentage,
            value: "${_report.delayPercentage ?? 0.0}",
            imagePath: ImagePaths.percentageElapsedTime,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).elapsedTime,
            value: "${_report.elapsedTime ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.countActualDelay,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).percentageOfElapsedTime,
            value: "${_report.percentageofElapsedTime ?? 0.0}",
            imagePath: ImagePaths.percentageElapsedTime,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).remainingDurationDay,
            value:
                "${((_report.earlyPlannedPercentageofCompletion ?? 0.0) - (_report.actualPercentageofCompletion ?? 0.0))}"
                    .formatDoubleWithComma(),
            imagePath: ImagePaths.countActualDelay,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).earlyPlannedPercentageOfCompletion,
            value: "${_report.earlyPlannedPercentageofCompletion ?? 0.0}",
            imagePath: ImagePaths.percentageElapsedTime,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).latePlannedPercentageofCompletion,
            value: "${_report.latePlannedPercentageofCompletion ?? 0.0}",
            imagePath: ImagePaths.countActualDelay,
          ),
        ),
        _buildWhiteDivider(12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProjectItem(
                title: S.of(context).actualPercentageOfComplete,
                value: "${_report.actualPercentageofCompletion ?? 0.0}"
                    .formatDoubleWithComma(),
                imagePath: ImagePaths.countActualDelay,
              ),
            ],
          ),
        )
      ],
    ));
  }

  Container _buildFinancialDetails() {
    if (phaseID == 2) return _buildTenderingFinancialDetails();
    if (phaseID == 3) return _buildExecutionFinancialDetails();
    return _buildDesignFinancialDetails();
  }

  Container _buildDesignFinancialDetails() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).financialDetails),
      children: [
        Container(
          height: 4,
          color: ColorSchema.screenBackground,
        ),
        _buildWhiteDivider(16),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).financialProvision,
            value:
                "${_report.financialProvision ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.financialProvision,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).estimatedFinancialProvision,
            value: "${_report.estimatedFinancialProvision ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.estimatedFinancialProvision,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectEstimatedValueKD,
            value: "${_report.theEstimatedValueofTheProject ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.estimatedValueProject,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).designValueKD,
            value: "${_report.designValue ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.lastPaymentCertificateAmount,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).optionalWorksValueKD,
            value:
                "${_report.optionalWorksValue ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.lastPaymentCertificateDate,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).supervisionServicesValueKD,
            value: "${_report.supervisionServicesValue ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.consultingServiceAgreementValue,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).contractTotalAmountKD,
            value:
                "${_report.contractTotalAmount ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.totalValueOfOutgoing,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).latestPaymentCertificateNumber,
            value: _report.latestPaymentCertificateNumber ?? "",
            imagePath: ImagePaths.optionalWorkAmount,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).lastPaymentCertificateDate,
            value: formatDateTime(_report.lastPaymentCertificateDate ?? ""),
            imagePath: ImagePaths.supervisionAmount,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).lastPaymentCertificateAmount,
            value: "${_report.lastPaymentCertificateAmount ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.agreementTotal,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).totalValueOfOutgoingPaymentsKD,
            value: "${_report.totalValueofOutgoingPayments ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.variationOrder,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).exchangePercentage,
            value: _report.exchangePercentage ?? "",
            imagePath: ImagePaths.number,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).contractAmount,
            value: "${_report.contractAmount ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.contractAmount,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).variationOrdersKD,
            value: "${_report.sumOfProjectVariationOrders ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.variationOrdersPercentage,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).variationOrdersPercentage,
            value:
                "${(_report.variationOrdersPercentage ?? "").formatDoubleWithComma()} %",
            imagePath: ImagePaths.totalContractAmountAfterExtension,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).totalContractAmountAfterExtension,
            value: "${_report.totalContractAmountAfterExtension ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.totalContractAmountAfterExtension,
          ),
        ),
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 6),
        //   color: Colors.white,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       _buildProjectItem(
        //         title: S.of(context).totalContractAmountAfterExtension,
        //         value: "${_report.totalContractAmountAfterExtension ?? 0.0}",
        //         imagePath: ImagePaths.totalContractAmountAfterExtension,
        //       ),
        //     ],
        //   ),
        // )
      ],
    ));
  }

  Container _buildTenderingFinancialDetails() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).financialDetails),
      children: [
        Container(
          height: 4,
          color: ColorSchema.screenBackground,
        ),
        _buildWhiteDivider(16),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).financialProvision,
            value:
                "${_report.financialProvision ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.financialProvision,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).estimatedFinancialProvision,
            value: "${_report.estimatedFinancialProvision ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.estimatedFinancialProvision,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectEstimatedValueKD,
            value: "${_report.theEstimatedValueofTheProject ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.estimatedValueProject,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).designValueKD,
            value: "${_report.designValue ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.lastPaymentCertificateAmount,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).optionalWorksValueKD,
            value:
                "${_report.optionalWorksValue ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.lastPaymentCertificateDate,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).supervisionServicesValueKD,
            value: "${_report.supervisionServicesValue ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.consultingServiceAgreementValue,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).contractTotalAmountKD,
            value:
                "${_report.contractTotalAmount ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.totalValueFinancialDepartment,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).latestPaymentCertificateNumber,
            value: _report.latestPaymentCertificateNumber ?? "",
            imagePath: ImagePaths.totalValueOfOutgoing,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).lastPaymentCertificateDate,
            value: formatDateTime(_report.lastPaymentCertificateDate ?? ""),
            imagePath: ImagePaths.optionalWorkAmount,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).lastPaymentCertificateAmount,
            value: "${_report.lastPaymentCertificateAmount ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.supervisionAmount,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).totalValueOfOutgoingPaymentsKD,
            value: "${_report.totalValueofOutgoingPayments ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.agreementTotal,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).exchangePercentage,
            value: _report.exchangePercentage ?? "",
            imagePath: ImagePaths.variationOrder,
          ),
        ),
        _buildWhiteDivider(12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProjectItem(
                title: S.of(context).contractAmountKD,
                value:
                    "${_report.contractAmount ?? 0.0}".formatDoubleWithComma(),
                imagePath: ImagePaths.variationOrder,
              ),
            ],
          ),
        )
      ],
    ));
  }

  Container _buildExecutionFinancialDetails() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).financialDetails),
      children: [
        Container(
          height: 4,
          color: ColorSchema.screenBackground,
        ),
        _buildWhiteDivider(16),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S
                .of(context)
                .theValueOfTheExecutionContractWithoutProtectionWorksKD,
            value:
                "${_report.theValueoftheExecutionContractWithoutProtectionWorks ?? 0.0}"
                    .formatDoubleWithComma(),
            imagePath: ImagePaths.financialProvision,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).inactiveProvisionalSumKD,
            value: "${_report.inactiveProvisionalSum ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.estimatedFinancialProvision,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).inactiveProvisionalSumPercentage,
            value: _report.inactiveProvisionalSumPercentage ?? "",
            imagePath: ImagePaths.estimatedValueProject,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).activeProvisionalSumKD,
            value: "${_report.activeProvisionalSum ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.lastPaymentCertificateAmount,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).activeProvisionalSumPercentage,
            value: _report.activeProvisionalSumPercentage ?? "",
            imagePath: ImagePaths.lastPaymentCertificateDate,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).optionalWorksValueKD,
            value:
                "${_report.optionalWorksValue ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.consultingServiceAgreementValue,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).remeasureItemsAmountKD,
            value: "${_report.remeasureItemsAmount ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.totalValueFinancialDepartment,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).remeasureItemsPercentage,
            value: "${_report.remeasureItemsPercentage ?? 0.0}",
            imagePath: ImagePaths.totalValueOfOutgoing,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).paymentCertificateNumber,
            value: _report.paymentCertificateNumber ?? "",
            imagePath: ImagePaths.optionalWorkAmount,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).paymentCertificate,
            value: "${getPaymentCertificateName()}".formatDoubleWithComma(),
            imagePath: ImagePaths.supervisionAmount,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).completedWorkAmountKD,
            value:
                "${_report.completedWorkAmount ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.agreementTotal,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).completedWorkAmountDate,
            value: formatDateTime(_report.completedWorkAmountDate ?? ""),
            imagePath: ImagePaths.variationOrder,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).completedWorkAndStoredMaterialsKD,
            value: "${_report.completedWorkandStoredMaterials ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.number,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).completedWorkAndStoredMaterialsPercentage,
            value: _report.completedWorkandStoredMaterialsPercentage ?? "",
            imagePath: ImagePaths.contractAmount,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).lastPaymentNetAmountKD,
            value: "${_report.lastPaymentNetAmount ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.variationOrdersPercentage,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).lastPaymentNetAmountDate,
            value: formatDateTime(_report.lastPaymentNetAmountDate ?? ""),
            imagePath: ImagePaths.totalContractAmountAfterExtension,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).totalPaidKD,
            value: "${_report.totalPaidAmount ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.variationOrdersPercentage,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).totalPaidWithAdvancedPaymentKD,
            value: "${_report.totalPaidWithAdvancedPayment ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.totalContractAmountAfterExtension,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).contractAmount,
            value: "${_report.contractAmount ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.variationOrdersPercentage,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).exchangePercentage,
            value: _report.exchangePercentage ?? "",
            imagePath: ImagePaths.totalContractAmountAfterExtension,
          ),
        ),
        _buildWhiteDivider(12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProjectItem(
                title: S.of(context).variationOrdersKD,
                value: "${_report.sumOfProjectVariationOrders ?? 0.0}"
                    .formatDoubleWithComma(),
                imagePath: ImagePaths.totalContractAmountAfterExtension,
              ),
            ],
          ),
        ),
        // _buildRowWithPadding(
        //   firstItem: _buildProjectItem(
        //     title: S.of(context).actualCostKD,
        //     value: "${_report.actualCost ?? 0.0}",
        //     imagePath: ImagePaths.variationOrdersPercentage,
        //   ),
        //   secondItem: _buildProjectItem(
        //     title: S.of(context).variationOrdersKD,
        //     value: "${_report.totalVariationOrders ?? 0.0}",
        //     imagePath: ImagePaths.totalContractAmountAfterExtension,
        //   ),
        // ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).variationOrdersPercentage,
            value:
                "${(_report.variationOrdersPercentage ?? "0.0").formatDoubleWithComma()} %",
            imagePath: ImagePaths.variationOrdersPercentage,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).totalContractAmountAfterExtension,
            value: "${_report.totalContractAmountAfterExtension ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.totalContractAmountAfterExtension,
          ),
        ),
      ],
    ));
  }

  double getPaymentCertificateName() {
    if (_report.paymentCertificate == null) return 0.0;
    if (_report.paymentCertificate == 1.0) {
      return _report.actualPaymentCertificate ?? 0.0;
    }
    if (_report.paymentCertificate == 2.0) {
      return _report.estimatedPaymentCertificate ?? 0.0;
    }
    return 0.0;
  }

  Container _buildExpansionTileContainer(ExpansionTile expansionTile) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            spreadRadius: 0,
            offset: const Offset(0, 4),
            color: ColorSchema.black.withOpacity(0.05),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: expansionTile,
      ),
    );
  }

  Container _buildProjectWorks() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).projectWorks),
      children: [
        Container(
          height: 4,
          color: ColorSchema.screenBackground,
        ),
        _buildWhiteDivider(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsetsDirectional.only(start: 6),
                child: _buildProjectItem(
                  title: S.of(context).completedWorkDuringThisMonth,
                  value: _report.completedWorkDuringthisMonth ?? "",
                  imagePath: ImagePaths.completedWork,
                ),
              ),
            ),
          ],
        ),
        _buildWhiteDivider(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsetsDirectional.only(start: 6),
                child: _buildProjectItem(
                  title: S.of(context).additionalInformation,
                  value: _report.additionalInformation ?? "",
                  imagePath: ImagePaths.completedWork,
                ),
              ),
            ),
          ],
        ),
        _buildWhiteDivider(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsetsDirectional.only(start: 6),
                child: _buildProjectItem(
                  title: S.of(context).reasonForTheDelay,
                  value: _report.reasonsfortheDelay ?? "",
                  imagePath: ImagePaths.reasonDelay,
                ),
              ),
            ),
          ],
        ),
        _buildWhiteDivider(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsetsDirectional.only(start: 6),
                child: _buildProjectItem(
                  title: S.of(context).actionTaken,
                  value: _report.actionsTaken ?? "",
                  imagePath: ImagePaths.actionTaken,
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }

  Row _buildProjectNameText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            color: Colors.white,
            child: Text(
              _report.projectName ?? "",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(letterSpacing: -0.28, fontWeight: medium),
            ),
          ),
        ),
      ],
    );
  }

  Text _buildExpansionTileTitle(String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .displayMedium
          ?.copyWith(letterSpacing: -0.28, fontWeight: semiBold),
    );
  }

  Container _buildWhiteDivider(double height) {
    return Container(
      height: height,
      color: Colors.white,
    );
  }

  Container _buildRowWithPadding({
    required ProjectItemWidget firstItem,
    required ProjectItemWidget secondItem,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: firstItem),
          const SizedBox(
            width: 5,
          ),
          Expanded(child: secondItem),
        ],
      ),
    );
  }

  ProjectItemWidget _buildProjectItem({
    required String title,
    required value,
    required String imagePath,
    Color color = ColorSchema.primary,
    TextDirection? textDirection,
  }) {
    return ProjectItemWidget(
      title: title,
      value: value,
      imagePath: imagePath,
      color: color,
      textDirection: textDirection,
    );
  }

  void _getReportByIdEvent(String id) {
    _reportsFormsBloc.add(GetReportByIdEvent(id: id));
  }
}
