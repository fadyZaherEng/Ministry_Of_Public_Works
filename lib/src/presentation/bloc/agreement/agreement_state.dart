part of 'agreement_bloc.dart';

abstract class AgreementState extends Equatable {
  const AgreementState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class AgreementInitial extends AgreementState {
  @override
  List<Object> get props => [];
}

class ShowSkeletonState extends AgreementState {}

class ShowLoadingState extends AgreementState {}

class HideLoadingState extends AgreementState {}

class GetAgreementsSuccessState extends AgreementState {
  final List<Agreement> agreements;

  const GetAgreementsSuccessState({
    required this.agreements,
  });
}

class GetAgreementsFailState extends AgreementState {
  final String errorMessage;

  const GetAgreementsFailState({
    required this.errorMessage,
  });
}

class SearchAgreementState extends AgreementState {
  final String keyword;

  const SearchAgreementState({
    required this.keyword,
  });
}

class SelectSortState extends AgreementState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}


class GetProjectTypesSuccessState extends AgreementState {
  final List<ProjectType> projectTypes;

  const GetProjectTypesSuccessState({
    required this.projectTypes,
  });
}

class GetProjectTypesFailState extends AgreementState {
  final String errorMessage;

  const GetProjectTypesFailState({
    required this.errorMessage,
  });
}

class GetMonthsSuccessState extends AgreementState {
  final List<Month> months;

  const GetMonthsSuccessState({
    required this.months,
  });
}

class GetMonthsFailState extends AgreementState {
  final String errorMessage;

  const GetMonthsFailState({
    required this.errorMessage,
  });
}

class GetYearsSuccessState extends AgreementState {
  final List<Year> years;

  const GetYearsSuccessState({
    required this.years,
  });
}

class GetYearsFailState extends AgreementState {
  final String errorMessage;

  const GetYearsFailState({
    required this.errorMessage,
  });
}

class SelectProjectTypeState extends AgreementState {
  final ProjectType projectType;

  const SelectProjectTypeState({required this.projectType});
}

class SelectMonthState extends AgreementState {
  final Month month;

  const SelectMonthState({required this.month});
}

class SelectYearState extends AgreementState {
  final Year year;

  const SelectYearState({required this.year});
}

class GetAgreementByIdSuccessState extends AgreementState {
  final Agreement agreement;

  const GetAgreementByIdSuccessState({
    required this.agreement,
  });
}

class GetAgreementByIdFailState extends AgreementState {
  final String errorMessage;

  const GetAgreementByIdFailState({
    required this.errorMessage,
  });
}

class NavigateBackState extends AgreementState {
  const NavigateBackState();
}
