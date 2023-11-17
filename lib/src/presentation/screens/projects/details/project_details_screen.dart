// ignore_for_file: deprecated_member_use

import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/routes/app_routes.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/get_status_color.dart';
import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/domain/entities/project/attachment.dart';
import 'package:aim/src/domain/entities/project/project_details.dart';
import 'package:aim/src/presentation/bloc/details/project_details_bloc.dart';
import 'package:aim/src/presentation/screens/projects/details/widgets/download_button_widget.dart';
import 'package:aim/src/presentation/screens/projects/details/widgets/skeleton_project_details_screen.dart';
import 'package:aim/src/presentation/screens/projects/utils/open_phases_bottom_sheet.dart';
import 'package:aim/src/presentation/widgets/app_bar_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class ProjectDetailsScreen extends BaseStatefulWidget {
  final String projectId;

  const ProjectDetailsScreen({
    Key? key,
    required this.projectId,
  }) : super(key: key);

  @override
  BaseState<ProjectDetailsScreen> baseCreateState() =>
      _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends BaseState<ProjectDetailsScreen> {
  ProjectDetailsBloc get _projectsDetailsBloc =>
      BlocProvider.of<ProjectDetailsBloc>(context);
  ProjectDetails projectDetails = const ProjectDetails();
  String selectedPhaseId = "";

  @override
  void initState() {
    super.initState();
    _getProjectDetails(widget.projectId ?? "");
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<ProjectDetailsBloc, ProjectDetailsState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetProjectDetailsSuccessState) {
          selectedPhaseId = state.projectDetails.id ?? "";
          projectDetails = state.projectDetails;
        } else if (state is GetProjectDetailsFailState) {
        } else if (state is GetPhaseSuccessState) {
          projectDetails = state.projectDetails;
        } else if (state is GetPhasesFailState) {
        } else if (state is DownloadGalleryState) {
          _downloadImages(state.images);
        } else if (state is DownloadDocumentsState) {
          _downloadDocuments(state.documents);
        } else if (state is GetPhasesSuccessState) {
        } else if (state is GetProjectDetailsPhasesSuccessState) {
          openPhasesBottomSheet(
              context: context,
              height: 200,
              phases: state.phases,
              selectIdEvent: (
                String id,
              ) {
                selectedPhaseId = id;
                _projectsDetailsBloc.add(GetPhaseEvent(id: id));
              });
        } else if (state is GetProjectDetailsPhasesFailState) {
        } else if (state is GetPhasesFailState) {
          _navigateBack();
        } else if (state is NavigateBackState) {
          _navigateBack();
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorSchema.screenBackground,
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    AppBarWidget(
                      title: projectDetails.projectName ?? "",
                      isHaveBackButton: true,
                      isHaveForms: true,
                      onFormsTab: () {
                        if (selectedPhaseId.isNotEmpty) {
                          Navigator.pushNamed(
                              context, AppRoutes.projectDetailsForm,
                              arguments: {
                                "id": widget.projectId,
                                "phaseId": selectedPhaseId,
                              });
                        }
                      },
                      imagePath: ImagePaths.arrowBack,
                      onTap: () {
                        _projectsDetailsBloc.add(const NavigateBackEvent());
                      },
                    ),
                    const SizedBox(height: 24),
                    state is ShowSkeletonState
                        ? const SkeletonProjectDetailsScreen()
                        : buildContent(),
                    const SizedBox(height: 22),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _downloadDocuments(List<Attachment> documents) async {
    if (await requestPermission()) {
      if (documents.isNotEmpty) {
        downloadAttachments(documents);
      } else {
        Fluttertoast.showToast(
            msg: "There is no documents",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  Future<void> _downloadImages(List<Attachment> images) async {
    if (await requestPermission()) {
      if (images.isNotEmpty) {
        downloadAttachments(images);
      } else {
        Fluttertoast.showToast(
            msg: "There is no photos",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  Column buildContent() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildProjectItem(
              title: S.of(context).agreementNumber,
              value: projectDetails.agreementNumber ?? "",
              imagePath: ImagePaths.agreementMore,
            ),
            InkWell(
              onTap: () {
                _projectsDetailsBloc.add(
                  // GetPhasesEvent(id: widget.projectId ?? ""),
                  GetProjectDetailsPhases(id: widget.projectId),
                );
              },
              child: _buildProjectItem(
                title: S.of(context).phase,
                value: projectDetails.phaseName ?? "",
                imagePath: ImagePaths.phase,
                // color: ColorSchema.orange,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).projectEngineer,
            value: projectDetails.projectEngineerName ?? "",
            imagePath: ImagePaths.projectEngineer,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).endUser,
            value: projectDetails.endUser ?? "",
            imagePath: ImagePaths.endUser,
          ),
        ),
        const SizedBox(height: 16),
        _buildRowWithPadding(
          firstItem: _buildProjectItem(
            title: S.of(context).headOfDepartment,
            value: projectDetails.headofDepartment ?? "",
            imagePath: ImagePaths.headOfDepartment,
          ),
          secondItem: _buildProjectItem(
            title: S.of(context).status,
            value: projectDetails.statusName ?? "",
            imagePath: ImagePaths.status,
            color: getStatusColor(projectDetails.statusName ?? ""),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildProjectItem(
              title: S.of(context).sector,
              value: projectDetails.sector ?? "",
              imagePath: ImagePaths.sector,
            ),
          ],
        ),
        const SizedBox(height: 32),
        GridView.count(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildProjectDetailsWidget(
              cardTitle: S.of(context).monthlyReports,
              cardCount: (projectDetails.monthlyReportsCount ?? 0).toString(),
              imagePath: ImagePaths.monthlyReport,
            ),
            _buildProjectDetailsWidget(
                cardTitle: S.of(context).consultantAgreements,
                cardCount: projectDetails.designContractNumber ?? "0",
                imagePath: ImagePaths.agreements),
            _buildProjectDetailsWidget(
                cardTitle: S.of(context).payments,
                cardCount:
                    (projectDetails.projectPaymentsCount ?? 0).toString(),
                imagePath: ImagePaths.payments),
            _buildProjectDetailsWidget(
                cardTitle: S.of(context).risks,
                cardCount:
                    (projectDetails.activeProjectRisksCount ?? 0).toString(),
                imagePath: ImagePaths.risks),
            _buildProjectDetailsWidget(
                cardTitle: S.of(context).issues,
                cardCount:
                    (projectDetails.activeProjectIssuesCount ?? 0).toString(),
                imagePath: ImagePaths.issues),
            _buildProjectDetailsWidget(
                cardTitle: S.of(context).milestones,
                cardCount: (projectDetails.milestonesCount ?? 0).toString(),
                imagePath: ImagePaths.milestones),
            _buildProjectDetailsWidget(
                cardTitle: S.of(context).warranties,
                cardCount: (projectDetails.warrantiesCount ?? 0).toString(),
                imagePath: ImagePaths.warranties),
            _buildProjectDetailsWidget(
                cardTitle: S.of(context).variationOrdersCard,
                cardCount:
                    (projectDetails.sumOfVariationOrdersValues ?? 0).toString(),
                imagePath: ImagePaths.variationOrders),
            _buildProjectDetailsWidget(
                cardTitle: S.of(context).penalties,
                cardCount: (projectDetails.totalPenalties ?? 0).toString(),
                imagePath: ImagePaths.penaltiesMore),
          ],
        ),
        const SizedBox(height: 36),
        Row(
          children: [
            Expanded(
              child: DownloadButtonWidget(
                buttonText: S.of(context).downloadGallery,
                imagePath: ImagePaths.gallery,
                onTap: () {
                  _projectsDetailsBloc.add(DownloadGalleryEvent(
                      images: projectDetails.images ?? []));
                },
              ),
            ),
            Expanded(
              child: DownloadButtonWidget(
                onTap: () {
                  _projectsDetailsBloc.add(DownloadDocumentsEvent(
                      documents: projectDetails.files ?? []));
                },
                buttonText: S.of(context).downloadDocuments,
                imagePath: ImagePaths.documents,
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildProjectDetailsWidget({
    required String cardTitle,
    required String cardCount,
    required String imagePath,
  }) {
    return Container(
      width: 210,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 16,
              color: ColorSchema.black.withOpacity(0.1))
        ],
        color: ColorSchema.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorSchema.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
                width: 42,
                height: 42,
                child: Center(
                  child: SvgPicture.asset(
                    imagePath,
                    color: Colors.white,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Text(
                cardCount,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      letterSpacing: -0.36,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Text(
              cardTitle,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    letterSpacing: -0.26,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildRowWithPadding({
    required ProjectItemWidget firstItem,
    required ProjectItemWidget secondItem,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        firstItem,
        secondItem,
      ],
    );
  }

  ProjectItemWidget _buildProjectItem({
    required String title,
    required value,
    required String imagePath,
    Color color = ColorSchema.primary,
  }) {
    return ProjectItemWidget(
      title: title,
      value: value,
      imagePath: imagePath,
      color: color,
    );
  }

  void _getProjectDetails(String projectId) {
    _projectsDetailsBloc.add(GetProjectDetailsEvent(projectId: projectId));
  }

  String _formatDateText(String date) {
    if (date.isNotEmpty) {
      return DateFormat("dd-MM-yyyy").format(DateTime.parse(date));
    } else {
      return "";
    }
  }

  void _navigateBack() {
    Navigator.pop(context);
  }
}
