import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/routes/app_routes.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/project/request/projects_request.dart';
import 'package:aim/src/domain/entities/filter/end_user.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/project/project.dart';
import 'package:aim/src/presentation/bloc/projects/projects_bloc.dart';
import 'package:aim/src/presentation/screens/projects/utils/open_projects_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/projects/widgets/project_card_widget.dart';
import 'package:aim/src/presentation/screens/projects/widgets/skeleton_project_card_widget.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsScreen extends BaseStatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() {
    return _ProjectsScreenState();
  }
}

class _ProjectsScreenState extends BaseState<ProjectsScreen> {
  ProjectsBloc get _projectsBloc => BlocProvider.of<ProjectsBloc>(context);
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  List<Project> _projects = [];
  bool _isFilteredSelected = true;
  ProjectsRequest _projectsRequest = ProjectsRequest();
  Sort _selectedSort = sorts.first;
  Phase _selectedPhase = const Phase();
  EndUser _selectedEndUser = const EndUser();
  ProjectType _selectedProjectType = const ProjectType();
  DateTime? _selectedFromDate;
  DateTime? _selectedToDate;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    print('object');
    _init();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<ProjectsBloc, ProjectsState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetProjectsSuccessState) {
          _projects = state.projects;
        } else if (state is GetProjectsFailState) {
        } else if (state is SearchProjectsState) {
          _projectsRequest =
              _projectsRequest.copyWith(keyword: state.keyword, pageNo: 1);
          _getProjects(request: _projectsRequest);
        } else if (state is SelectSortState) {
          _selectedSort = state.sort;
          _projectsRequest = _projectsRequest.copyWith(
              sortColumn: state.sort.sortColumn,
              colDir: state.sort.columnDirection,
              pageNo: 1);
          _getProjects(request: _projectsRequest);
        } else if (state is GetPhasesSuccessState) {
          _projectsBloc.add(const GetProjectTypesEvent());
        } else if (state is GetProjectTypesSuccessState) {
          _projectsBloc.add(const GetEndUsersEvent());
        } else if (state is GetPhasesFailState) {
        } else if (state is GetEndUsersSuccessState) {
          openProjectsFilterBottomSheet(
            context: context,
            height: 420,
            phases: _projectsBloc.phases,
            selectedPhase: _selectedPhase,
            onTap: (phase, projectType, fromDate, toDate, endUser) {
              _selectedFromDate = fromDate;
              _selectedToDate = toDate;
              _projectsBloc.add(SelectFromDateEvent(fromDateTime: fromDate));
              _projectsBloc.add(SelectToDateEvent(toDateTime: toDate));
              _projectsBloc.add(SelectPhaseEvent(phase: phase));
              _projectsBloc
                  .add(SelectProjectTypeEvent(projectType: projectType));
              _projectsBloc.add(SelectEndUserEvent(endUser: endUser));

              _projectsBloc.add(const NavigateBackEvent());
            },
            selectedFromDate: _selectedFromDate,
            selectedToDate: _selectedToDate,
            projectTypes: _projectsBloc.projectTypes,
            selectedProjectType: _selectedProjectType,
            selectedEndUser: _selectedEndUser,
            endUsers: state.endUsers,
          );
        } else if (state is GetEndUsersFailState) {
        } else if (state is SelectEndUserState) {
          _selectedEndUser = state.endUser;
        } else if (state is SelectPhaseState) {
          _selectedPhase = state.phase;
        } else if (state is SelectProjectTypeState) {
          _selectedProjectType = state.projectType;
        } else if (state is NavigateBackState) {
          _navigateBack();
          _projectsRequest = _projectsRequest.copyWith(
            projectPhaseId: _selectedPhase.id.toString() == "0"
                ? ""
                : _selectedPhase.id.toString(),
            projectTypeId: _selectedProjectType.id ?? "",
            endUser: _selectedEndUser.id ?? "",
            pageNo: 1,
          );
          _getProjects(
            request: _projectsRequest,
          );
        } else if (state is NavigateToProjectDetailsScreenState) {
          _navigateToProjectDetailsScreen(state.project);
        }
      },
      builder: (context, state) {
        return SharedScreen(
          title: S.of(context).projects,
          searchLabel: S.of(context).searchProject,
          isFilterSelected: _isFilteredSelected,
          searchTextEditingController: _searchTextEditingController,
          onChange: (value) {
            _projectsBloc.add(SearchProjectsEvent(keyword: value));
          },
          onSubmit: (value) {
            _projectsBloc.add(SearchProjectsEvent(keyword: value));
          },
          clearActionButton: () {
            _searchTextEditingController.clear();
            _projectsBloc.add(const SearchProjectsEvent(keyword: ""));
          },
          onFilterTab: () {
            setState(() {
              _isFilteredSelected = true;
            });
            _projectsBloc.add(const GetPhasesEvent());
          },
          onSortTab: () async {
            setState(() {
              _isFilteredSelected = false;
            });
            openSortBottomSheet(
                height: 300,
                context: context,
                sorts: sorts,
                selectedSort: _selectedSort,
                selectSortEvent: _selectSortEvent);
          },
          content: state is ShowSkeletonState
              ? const SkeletonProjectCardWidget()
              : _buildScreenContent(),
        );
      },
    );
  }

  //Helper Widgets//
  Widget _buildScreenContent() {
    return _projects.isEmpty
        ? const Expanded(
            child: EmptyDataWidget(),
          )
        : _buildProjects();
  }

  Expanded _buildProjects() {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: _projects.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: ProjectCardWidget(
              project: _projects[index],
              onPressed: () {
                BlocProvider.of<ProjectsBloc>(context).add(
                  NavigateToProjectDetailsScreenEvent(
                      project: _projects[index]),
                );
              },
            ),
          );
        },
      ),
    );
  }

  //Helper Function//
  void _init() {
    _selectedSort = _projectsBloc.selectedSort;
    _selectedPhase = _projectsBloc.selectedPhase;
    _selectedProjectType = _projectsBloc.selectedProjectType;
    _selectedFromDate = _projectsBloc.selectedFromDatetime;
    _selectedToDate = _projectsBloc.selectedToDatetime;
    _selectedEndUser = _projectsBloc.selectedEndUser;
    _projectsRequest = ProjectsRequest(
      keyword: "",
      projectPhaseId: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
      sectorId: _selectedProjectType.id ?? "",
      sortColumn: _selectedSort.sortColumn,
      colDir: _selectedSort.columnDirection,
      endUser: _selectedEndUser.id ?? "",
      pageNo: 1,
      pageSize: pageSize,
    );
    _getProjects(
      request: _projectsRequest,
    );
    _addScrollListener();
  }

  void _addScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          isLoading == false) {
        _projectsRequest =
            _projectsRequest.copyWith(pageNo: _projectsRequest.pageNo! + 1);
        _projectsBloc.add(GetProjectsEvent(request: _projectsRequest));
      }
    });
  }

  void _selectSortEvent(Sort sort) {
    _projectsBloc.add(SelectSortEvent(sort: sort));
  }

  void _getProjects({required ProjectsRequest request}) {
    _projectsBloc.add(GetProjectsEvent(request: request));
  }

  void _navigateToProjectDetailsScreen(Project project) {
    Navigator.pushNamed(context, AppRoutes.projectDetails,
        arguments: project.id ?? "");
  }

  void _navigateBack() {
    Navigator.pop(context);
  }
}
