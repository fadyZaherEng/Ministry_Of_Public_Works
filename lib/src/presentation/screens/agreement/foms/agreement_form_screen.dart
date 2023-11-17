import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/extensions.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/domain/entities/agreement/agreement.dart';
import 'package:aim/src/presentation/bloc/agreement/forms/agreement_form_bloc.dart';
import 'package:aim/src/presentation/widgets/app_bar_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;

class AgreementFormScreen extends BaseStatefulWidget {
  final String id;

  const AgreementFormScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _AgreementFormScreenState();
}

class _AgreementFormScreenState extends BaseState<AgreementFormScreen> {
  AgreementFormBloc get _agreementFormBloc =>
      BlocProvider.of<AgreementFormBloc>(context);

  Agreement _agreement = const Agreement();

  @override
  void initState() {
    super.initState();
    _getAgreementByIdEvent(widget.id);
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<AgreementFormBloc, AgreementFormState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetAgreementByIdSuccessState) {
          _agreement = state.agreement;
        } else if (state is GetAgreementByIdFailState) {}
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
                    _buildComponentsOfTheProject(),
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
            title: S.of(context).supervisionServiceContractNumber,
            value: _agreement.supervisionServiceContractNumber ?? "",
            imagePath: ImagePaths.number,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).endUser,
            value: _agreement.beneficiaryName ?? "",
            imagePath: ImagePaths.endUser,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectEngineer,
            value: _agreement.projectEngineerName ?? "",
            imagePath: ImagePaths.projectEngineer,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).projectEngineerPhoneNumber,
            value: _agreement.projectEngineerPhoneNumber ?? "",
            imagePath: ImagePaths.engineerPhone,
            textDirection: TextDirection.ltr,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectEngineerEmail,
            value: _agreement.projectEngineerEmail ?? "",
            imagePath: ImagePaths.engineerEmail,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).projectEngineerFax,
            value: _agreement.projectEngineerFax ?? "",
            imagePath: ImagePaths.engineerFax,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).deputyProjectEngineer,
            value: _agreement.deputyProjectEngineerName ?? "",
            imagePath: ImagePaths.deputyManager,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).deputyProjectEngineerPhoneNumber,
            value: _agreement.deputyProjectEngineerPhoneNumber ?? "",
            imagePath: ImagePaths.deputyManagerPhone,
            textDirection: TextDirection.ltr,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).deputyProjectEngineerEmail,
            value: _agreement.deputyProjectEngineerEmail ?? "",
            imagePath: ImagePaths.deputyManagerEmail,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).projectNumberFinancial,
            value: "${_agreement.projectNumberFinancial ?? ""}",
            imagePath: ImagePaths.deputyManagerEmail,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).consultant,
            value: _agreement.consultantName ?? "",
            imagePath: ImagePaths.consultant,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).contractor,
            value: _agreement.contractorName ?? "",
            imagePath: ImagePaths.contractor,
          ),
        ),
        _buildWhiteDivider(12),
      ],
    ));
  }

  Container _buildComponentsOfTheProject() {
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
            value: _agreement.locationName ?? "",
            imagePath: ImagePaths.location,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).siteArea,
            value: _agreement.siteArea ?? "",
            imagePath: ImagePaths.creationDate,
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
                  title: S.of(context).buildUpArea,
                  value: _agreement.buildUpArea ?? "",
                  imagePath: ImagePaths.creationDate,
                ),
              ),
            ),
          ],
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
                  value: _agreement.components ?? "",
                  imagePath: ImagePaths.creationDate,
                ),
              ),
            ),
          ],
        ),
        _buildWhiteDivider(12),
      ],
    ));
  }

  Container _buildScheduleDetails() {
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
            value: formatDate(_agreement.contractSignDate ?? ""),
            imagePath: ImagePaths.cosultancyServiceFinishData,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).commenceDate,
            value: formatDate(_agreement.commenceDate ?? ""),
            imagePath: ImagePaths.dataActual,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).contractualFinishDate,
            value: formatDate(_agreement.contractualFinishDate ?? ""),
            imagePath: ImagePaths.agreementSignDate,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).finishDateAfterExtension,
            value: formatDate(_agreement.finishDateAfterExtension ?? ""),
            imagePath: ImagePaths.completionDateAfterExtension,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).executionDurationDay,
            value:
                "${_agreement.executionDuration ?? 0}".formatDoubleWithComma(),
            imagePath: ImagePaths.creationDate,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).extensionPeriod,
            value:
                "${_agreement.extensionPeriod ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.extensionPeriod,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).remainingDuration,
            value: "${_agreement.remainingDuration ?? 0.0}"
                .formatDoubleWithComma(),
            imagePath: ImagePaths.exchangePercentage,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).elapsedTime,
            value: "${_agreement.elapsedTime ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.elapsedTime,
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
                title: S.of(context).percentageOfElapsedTime,
                value: "${_agreement.percentageOfElapsedTime ?? 0.0}",
                imagePath: ImagePaths.percentageElapsedTime,
              ),
            ],
          ),
        ),
        _buildWhiteDivider(12),
      ],
    ));
  }

  String formatDate(String date) {
    if (date.isEmpty) return "";
    // print(date);
    // print(DateFormat("dd-MM-yyyy", "en").add_jm().format(
    //     DateTime.parse(date).toLocal()));

    return intl.DateFormat("dd-MM-yyyy", "en")
        .format(DateTime.parse(date).add(const Duration(hours: 3)));
  }

  Container _buildFinancialDetails() {
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
            title: S.of(context).supervisionContractAmount,
            value:
                "${"${_agreement.supervisionContractAmount ?? 0.0}".formatDoubleWithComma()} ${S.of(context).currency}",
            imagePath: ImagePaths.contractAmount,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).paymentNumber,
            value: "${_agreement.paymentNumber ?? 0.0}",
            imagePath: ImagePaths.variationOrder,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).completedServicesAmount,
            value:
                "${"${_agreement.completedServicesAmount ?? 0.0}".formatDoubleWithComma()} ${S.of(context).currency}",
            imagePath: ImagePaths.totalPaidAmount,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).completedServicesPercentage,
            value: _agreement.completedServicespercentage ?? "",
            imagePath: ImagePaths.variationOrdersPercentage,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).totalPaymentNetAmountKD,
            value:
                "${"${_agreement.totalPaymentNetAmount ?? 0.0}".formatDoubleWithComma()} ${S.of(context).currency}",
            imagePath: ImagePaths.totalPaidAmount,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).lastPaymentNetAmountKD,
            value:
                "${"${_agreement.lastPaymentNetAmount ?? 0.0}".formatDoubleWithComma()} ${S.of(context).currency}",
            imagePath: ImagePaths.totalValueFinancialDepartment,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).lastPaymentNetAmountDate,
            value: formatDate(_agreement.lastPaymentNetAmountDate ?? ""),
            imagePath: ImagePaths.totalValueOfOutgoing,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).totalPaidAmountKD,
            value:
                "${_agreement.totalPaidAmount ?? 0.0}".formatDoubleWithComma(),
            imagePath: ImagePaths.financialProvision,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).totalPaidPercentage,
            value: "${_agreement.totalPaidPercentage ?? 0.0}",
            imagePath: ImagePaths.completeServiceFees,
          ),
          secondItem: _buildProjectItem(
            title: S
                .of(context)
                .contractValueAfterVariationOrderAndExtensionOrders,
            value:
                "${"${_agreement.contractValueAfterVariationOrderandExtensionOrders ?? 0.0}".formatDoubleWithComma()} ${S.of(context).currency}",
            imagePath: ImagePaths.lastPaymentCertificateAmount,
          ),
        ),
        _buildWhiteDivider(12),
        _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).exchangePercentage,
              value: "${_agreement.exchangepercentage ?? 0.0}",
              imagePath: ImagePaths.lastPaymentCertificateDate,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).variationOrdersKD,
              value: "${_agreement.totalVariationOrders ?? 0.0}"
                  .formatDoubleWithComma(),
              imagePath: ImagePaths.financialProvision,
            )),
        _buildWhiteDivider(12),
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsetsDirectional.only(start: 6),
                child: _buildProjectItem(
                  title: S.of(context).variationOrdersPercentage,
                  value: "${_agreement.variationOrdersPercentage ?? 0.0} %",
                  imagePath: ImagePaths.totalContractAmountAfterExtension,
                ),
              ),
            ),
          ],
        ),
        _buildWhiteDivider(12),
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
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsetsDirectional.only(start: 6),
                child: _buildProjectItem(
                  title: S.of(context).completedWorkDuringThisMonth,
                  value: _agreement.completedWorkDuringthisMonth ?? "",
                  imagePath: ImagePaths.actionTaken,
                ),
              ),
            ),
          ],
        ),
        _buildWhiteDivider(16),
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsetsDirectional.only(start: 6),
                child: _buildProjectItem(
                  title: S.of(context).additionalInformation,
                  value: _agreement.additionalInformation ?? "",
                  imagePath: ImagePaths.actionTaken,
                ),
              ),
            ),
          ],
        ),
        _buildWhiteDivider(16),
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsetsDirectional.only(start: 6),
                child: _buildProjectItem(
                  title: S.of(context).actionTaken,
                  value: _agreement.actions ?? "",
                  imagePath: ImagePaths.reasonDelay,
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
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            color: Colors.white,
            child: Text(
              _agreement.projectName ?? "",
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

  void _getAgreementByIdEvent(String id) {
    _agreementFormBloc.add(GetAgreementByIdEvent(id: id));
  }
}
