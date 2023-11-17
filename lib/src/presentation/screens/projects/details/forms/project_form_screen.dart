// ignore_for_file: deprecated_member_use

import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/date_utils.dart';
import 'package:aim/src/config/utils/extensions.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/domain/entities/project/project_details.dart';
import 'package:aim/src/presentation/bloc/projects/forms/projects_forms_bloc.dart';
import 'package:aim/src/presentation/widgets/app_bar_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectFormScreen extends BaseStatefulWidget {
  final String id;
  final String phaseId;

  const ProjectFormScreen({
    Key? key,
    required this.id,
    required this.phaseId,
  }) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _ProjectFormScreenState();
}

class _ProjectFormScreenState extends BaseState<ProjectFormScreen> {
  ProjectsFormsBloc get _projectsFormsBloc =>
      BlocProvider.of<ProjectsFormsBloc>(context);
  ProjectDetails projectDetails = const ProjectDetails();
  String _language = "";
  int phaseID = 0;

  @override
  void initState() {
    super.initState();
    _projectsFormsBloc.add(GetPhasesEvent(id: widget.id ?? ""));
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<ProjectsFormsBloc, ProjectsFormsState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetPhasesSuccessState) {
          _language = state.language;
          for (var item in state.projectsDetails) {
            if (item.id == widget.phaseId) {
              projectDetails = item;
              phaseID = item.phaseID ?? 0;
              break;
            }
          }
        } else if (state is GetPhasesFailState) {}
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
                    _buildIdentification(),
                    const SizedBox(height: 6),
                    _buildProjectInformation(),
                    const SizedBox(height: 6),
                    _buildTimeInformation(),
                    const SizedBox(height: 6),
                    _buildPaymentInformation(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Container _buildPaymentInformation() {
    if (phaseID == 2) {
      return _buildTenderingPaymentInformation();
    }
    if (phaseID == 3) {
      return _buildExecutionPaymentInformation();
    }
    return _buildDesignPaymentInformation();
  }

  Container _buildTimeInformation() {
    if (phaseID == 2) {
      return _buildTenderingTimeInformation();
    }
    if (phaseID == 3) {
      return _buildExecutionTimeInformation();
    }

    return _buildDesignTimeInformation();
  }

  Container _buildIdentification() {
    if (phaseID == 2) {
      return _buildTenderingIdentification();
    }
    if (phaseID == 3) {
      return _buildExecutionIdentification();
    }
    return _buildDesignIdentification();
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

  //Identification
  Container _buildDesignIdentification() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).identification),
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
            value: projectDetails.designContractNumber ?? "",
            imagePath: ImagePaths.number,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).status,
            value: projectDetails.statusName ?? "",
            imagePath: ImagePaths.status,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).endUser,
            value: projectDetails.endUser ?? "",
            imagePath: ImagePaths.endUser,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).sector,
            value: projectDetails.sector ?? "",
            imagePath: ImagePaths.sector,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectPhase,
            value: projectDetails.phaseName ?? "",
            imagePath: ImagePaths.phase,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).projectEngineer,
            value: projectDetails.projectEngineerName ?? "",
            imagePath: ImagePaths.projectEngineer,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectEngineerPhoneNumber,
            value: projectDetails.projectEngineerPhoneNumber ?? "",
            imagePath: ImagePaths.engineerPhone,
            textDirection: TextDirection.ltr,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).projectEngineerEmail,
            value: projectDetails.projectEngineerEmail ?? "",
            imagePath: ImagePaths.engineerEmail,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectEngineerFax,
            value: projectDetails.projectEngineerFax ?? "",
            imagePath: ImagePaths.engineerFax,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).headOfDepartment,
            value: projectDetails.headofDepartment ?? "",
            imagePath: ImagePaths.headOfDepartment,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).headOfDepartmentEmail,
            value: projectDetails.headOfDepartmentEmail ?? "",
            imagePath: ImagePaths.headOfDepartmentEmail,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).deputyManager,
            value: projectDetails.deputyManager ?? "",
            imagePath: ImagePaths.deputyManager,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).deputyManagerPhoneNumber,
            value: projectDetails.deputyManagerPhoneNumber ?? "",
            imagePath: ImagePaths.deputyManagerPhone,
            textDirection: TextDirection.ltr,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).deputyManagerEmail,
            value: projectDetails.deputyManagerEmail ?? "",
            imagePath: ImagePaths.deputyManagerEmail,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).deputyManagerFax,
            value: projectDetails.deputyManagerFax ?? "",
            imagePath: ImagePaths.deputyManagerFax,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).consultant,
            value: projectDetails.consultant ?? "",
            imagePath: ImagePaths.consultant,
          ),
        ),
      ],
    ));
  }

  Container _buildTenderingIdentification() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).identification),
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
            value: projectDetails.designContractNumber ?? "",
            imagePath: ImagePaths.number,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).executionContractNumber,
            value: projectDetails.executionContractNumber ?? "",
            imagePath: ImagePaths.status,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).status,
            value: projectDetails.statusName ?? "",
            imagePath: ImagePaths.status,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).endUser,
            value: projectDetails.endUser ?? "",
            imagePath: ImagePaths.endUser,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).sector,
            value: projectDetails.sector ?? "",
            imagePath: ImagePaths.sector,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).phase,
            value: projectDetails.phaseName ?? "",
            imagePath: ImagePaths.phase,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectEngineer,
            value: projectDetails.projectEngineerName ?? "",
            imagePath: ImagePaths.projectEngineer,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).projectEngineerPhoneNumber,
            value: projectDetails.projectEngineerPhoneNumber ?? "",
            imagePath: ImagePaths.engineerPhone,
            textDirection: TextDirection.ltr,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectEngineerEmail,
            value: projectDetails.projectEngineerEmail ?? "",
            imagePath: ImagePaths.engineerEmail,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).projectEngineerFax,
            value: projectDetails.projectEngineerFax ?? "",
            imagePath: ImagePaths.engineerFax,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).headOfDepartment,
            value: projectDetails.headofDepartment ?? "",
            imagePath: ImagePaths.headOfDepartment,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).headOfDepartmentEmail,
            value: projectDetails.headOfDepartmentEmail ?? "",
            imagePath: ImagePaths.headOfDepartmentEmail,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).deputyManager,
            value: projectDetails.deputyManager ?? "",
            imagePath: ImagePaths.deputyManager,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).deputyManagerPhoneNumber,
            value: projectDetails.deputyManagerPhoneNumber ?? "",
            imagePath: ImagePaths.deputyManagerPhone,
            textDirection: TextDirection.ltr,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).deputyManagerEmail,
            value: projectDetails.deputyManagerEmail ?? "",
            imagePath: ImagePaths.deputyManagerEmail,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).deputyManagerFax,
            value: projectDetails.deputyManagerFax ?? "",
            imagePath: ImagePaths.deputyManagerFax,
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
                title: S.of(context).consultant,
                value: projectDetails.consultant ?? "",
                imagePath: ImagePaths.consultant,
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Container _buildExecutionIdentification() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).identification),
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
            value: projectDetails.designContractNumber ?? "",
            imagePath: ImagePaths.number,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).supervisionServiceContractNumber,
            value: projectDetails.supervisionServiceContractNumber ?? "",
            imagePath: ImagePaths.status,
          ),
        ),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).executionContractNumber,
            value: projectDetails.executionContractNumber ?? "",
            imagePath: ImagePaths.number,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).status,
            value: projectDetails.statusName ?? "",
            imagePath: ImagePaths.status,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).endUser,
            value: projectDetails.endUser ?? "",
            imagePath: ImagePaths.endUser,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).sector,
            value: projectDetails.sector ?? "",
            imagePath: ImagePaths.sector,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectPhase,
            value: projectDetails.phaseName ?? "",
            imagePath: ImagePaths.phase,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).projectEngineer,
            value: projectDetails.projectEngineerName ?? "",
            imagePath: ImagePaths.projectEngineer,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectEngineerPhoneNumber,
            value: projectDetails.projectEngineerPhoneNumber ?? "",
            imagePath: ImagePaths.engineerPhone,
            textDirection: TextDirection.ltr,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).projectEngineerEmail,
            value: projectDetails.projectEngineerEmail ?? "",
            imagePath: ImagePaths.engineerEmail,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectEngineerFax,
            value: projectDetails.projectEngineerFax ?? "",
            imagePath: ImagePaths.engineerFax,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).headOfDepartment,
            value: projectDetails.headofDepartment ?? "",
            imagePath: ImagePaths.headOfDepartment,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).headOfDepartmentEmail,
            value: projectDetails.headOfDepartmentEmail ?? "",
            imagePath: ImagePaths.headOfDepartmentEmail,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).deputyManager,
            value: projectDetails.deputyManager ?? "",
            imagePath: ImagePaths.deputyManager,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).deputyManagerPhoneNumber,
            value: projectDetails.deputyManagerPhoneNumber ?? "",
            imagePath: ImagePaths.deputyManagerPhone,
            textDirection: TextDirection.ltr,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).deputyManagerEmail,
            value: projectDetails.deputyManagerEmail ?? "",
            imagePath: ImagePaths.deputyManagerEmail,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).contractor,
            value: projectDetails.contractorName ?? "",
            imagePath: ImagePaths.contractor,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).contractorPhoneNumber,
            value: projectDetails.contractorPhoneNumber ?? "",
            imagePath: ImagePaths.consultantPhone,
            textDirection: TextDirection.ltr,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).contractorFax,
            value: projectDetails.contractorFax ?? "",
            imagePath: ImagePaths.contractor,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).consultant,
            value: projectDetails.consultant ?? "",
            imagePath: ImagePaths.consultant,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).directSupervision,
            value: projectDetails.directSupervision ?? "",
            imagePath: ImagePaths.contractor,
          ),
          secondItem: projectDetails.sector == "Sanitary Projects" ||
                  projectDetails.sector == "مشاريع صحيّة"
              ? _buildProjectItem(
                  title: S.of(context).isItanoperationandmaintenancecontract,
                  value: projectDetails.isitanOperationandMaintenanceContract ??
                      "",
                  imagePath: ImagePaths.consultantPhone,
                  textDirection: TextDirection.ltr,
                )
              : _buildProjectItem(
                  title: "",
                  value: "",
                  imagePath: "",
                ),
        ),
      ],
    ));
  }

  //Project Information
  Container _buildProjectInformation() {
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
            value: projectDetails.locationName ?? "",
            imagePath: ImagePaths.location,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).governorate,
            value: projectDetails.governorateName ?? "",
            imagePath: ImagePaths.governorate,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).siteArea,
            value: (projectDetails.siteArea ?? "").formatDoubleWithComma(),
            imagePath: ImagePaths.priority,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).buildUpArea,
            value: (projectDetails.buildUpArea ?? "").formatDoubleWithComma(),
            imagePath: ImagePaths.assignedTo,
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
                  value: projectDetails.components ?? "",
                  imagePath: ImagePaths.creationDate,
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }

  //Time Information
  Container _buildDesignTimeInformation() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).timeInformation),
      children: [
        Container(
          height: 4,
          color: ColorSchema.screenBackground,
        ),
        _buildWhiteDivider(16),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).designContractSignDate,
            value: formatDateTime(projectDetails.contractSigningDate ?? ""),
            imagePath: ImagePaths.creationDate,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).designCommenceDate,
            value: formatDateTime(projectDetails.commenceDate ?? ""),
            imagePath: ImagePaths.actualDate,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).designDurationMonth,
            value:
                "${projectDetails.durationMonth ?? ""}".formatDoubleWithComma(),
            imagePath: ImagePaths.agreementPeriod,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).designDurationDay,
            value:
                "${projectDetails.durationDay ?? ""}".formatDoubleWithComma(),
            imagePath: ImagePaths.agreementSignDate,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).designCompletionDate,
            value: formatDateTime(projectDetails.designCompletionDate ?? ""),
            imagePath: ImagePaths.priority,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).executionExpectedTenderingDate,
            value: formatDateTime(projectDetails.expectedTenderingDate ?? ""),
            imagePath: ImagePaths.plannedDate,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).executionExpectedStartDate,
            value: formatDateTime(projectDetails.expectedStartDate ?? ""),
            imagePath: ImagePaths.serviceEndDate,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).tenderDate,
            value: formatDateTime(projectDetails.tenderDate ?? ""),
            imagePath: ImagePaths.tenderDate,
          ),
        ),
      ],
    ));
  }

  Container _buildTenderingTimeInformation() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).timeInformation),
      children: [
        Container(
          height: 4,
          color: ColorSchema.screenBackground,
        ),
        _buildWhiteDivider(16),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).executionExpectedStartDate,
            value: formatDateTime(projectDetails.expectedStartDate ?? ""),
            imagePath: ImagePaths.creationDate,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).tenderDate,
            value: formatDateTime(projectDetails.tenderDate ?? ""),
            imagePath: ImagePaths.tenderDate,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).executionExpectedCompletionDate,
            value: formatDateTime(
                projectDetails.executionExpectedCompletionDate ?? ""),
            imagePath: ImagePaths.agreementPeriod,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).closeoutDate,
            value: formatDateTime(projectDetails.closeoutDate ?? ""),
            imagePath: ImagePaths.agreementSignDate,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).executionDurationMonth,
            value:
                "${projectDetails.durationMonth ?? ""}".formatDoubleWithComma(),
            imagePath: ImagePaths.priority,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).executionDurationDay,
            value:
                "${projectDetails.durationDay ?? ""}".formatDoubleWithComma(),
            imagePath: ImagePaths.plannedDate,
          ),
        ),
        _buildWhiteDivider(12),
      ],
    ));
  }

  Container _buildExecutionTimeInformation() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).timeInformation),
      children: [
        Container(
          height: 4,
          color: ColorSchema.screenBackground,
        ),
        _buildWhiteDivider(16),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).contractSigningDate,
            value: formatDateTime(projectDetails.contractSigningDate ?? ""),
            imagePath: ImagePaths.creationDate,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).contractualCompletionDate,
            value:
                formatDateTime(projectDetails.contractualCompletionDate ?? ""),
            imagePath: ImagePaths.actualDate,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).executionDurationMonth,
            value:
                "${projectDetails.durationMonth ?? ""}".formatDoubleWithComma(),
            imagePath: ImagePaths.agreementPeriod,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).commenceDate,
            value: formatDateTime(projectDetails.commenceDate ?? ""),
            imagePath: ImagePaths.agreementSignDate,
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
                value: "${projectDetails.durationDay ?? ""}"
                    .formatDoubleWithComma(),
                imagePath: ImagePaths.serviceEndDate,
              ),
            ],
          ),
        )
      ],
    ));
  }

  Container _buildDesignPaymentInformation() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).paymentsInformation),
      children: [
        Container(
          height: 4,
          color: ColorSchema.screenBackground,
        ),
        _buildWhiteDivider(16),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectNumberFinancial,
            value: projectDetails.projectNumberFinancial ?? "",
            imagePath: ImagePaths.number,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).contractAmount,
            value: "${projectDetails.contractAmount ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.contractAmount,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).optionalWorksAmountKD,
            value: "${projectDetails.optionalWorksAmount ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.estimatValueProject,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).projectEstimatedValueKD,
            value: "${projectDetails.theEstimatedValueOfTheProject ?? 0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.totalOptionalAmount,
          ),
        ),
      ],
    ));
  }

  Container _buildTenderingPaymentInformation() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).paymentsInformation),
      children: [
        Container(
          height: 4,
          color: ColorSchema.screenBackground,
        ),
        _buildWhiteDivider(16),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectNumberFinancial,
            value: projectDetails.projectNumberFinancial ?? "",
            imagePath: ImagePaths.number,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).contractAmount,
            value: "${projectDetails.contractAmount ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.contractAmount,
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
                title: S.of(context).projectEstimatedValueKD,
                value: "${projectDetails.theEstimatedValueOfTheProject ?? 0.0}"
                    .formatDoubleWithComma(),
                imagePath: ImagePaths.estimatValueProject,
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Container _buildExecutionPaymentInformation() {
    return _buildExpansionTileContainer(ExpansionTile(
      collapsedBackgroundColor: ColorSchema.projectNameSectionGray,
      backgroundColor: ColorSchema.projectNameSectionGray,
      expandedAlignment: Alignment.centerLeft,
      title: _buildExpansionTileTitle(S.of(context).paymentsInformation),
      children: [
        Container(
          height: 4,
          color: ColorSchema.screenBackground,
        ),
        _buildWhiteDivider(16),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectNumberFinancial,
            value: projectDetails.projectNumberFinancial ?? "",
            imagePath: ImagePaths.number,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).contractAmount,
            value: "${projectDetails.contractAmount ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.contractAmount,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).totalReserveItemsAmount,
            value: "${projectDetails.totalReserveItemsAmount ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.estimatValueProject,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).totalOptionalItemsAmount,
            value: "${projectDetails.totalOptionalItemsAmount ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.totalOptionalAmount,
          ),
        ),
      ],
    ));
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

  Row _buildProjectNameText() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            color: Colors.white,
            child: Text(
              _language == "en"
                  ? projectDetails.projectName ?? ""
                  : projectDetails.projectNameArabic ?? "",
              style: Theme.of(context)
                  .textTheme
                  .headline2
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
          .headline2
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
      value: "$value",
      imagePath: imagePath,
      color: color,
      textDirection: textDirection,
    );
  }
}
