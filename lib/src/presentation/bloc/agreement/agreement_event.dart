part of 'agreement_bloc.dart';

abstract class AgreementEvent extends Equatable {
  const AgreementEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetAgreementsEvent extends AgreementEvent {
  final AgreementsRequest request;

  const GetAgreementsEvent({
    required this.request,
  });
}

class SearchAgreementsEvent extends AgreementEvent {
  final String keyword;

  const SearchAgreementsEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends AgreementEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class GetProjectTypesEvent extends AgreementEvent {
  const GetProjectTypesEvent();
}

class GetMonthsEvent extends AgreementEvent {
  const GetMonthsEvent();
}

class GetYearsEvent extends AgreementEvent {
  const GetYearsEvent();
}

class SelectProjectTypeEvent extends AgreementEvent {
  final ProjectType projectType;

  const SelectProjectTypeEvent({required this.projectType});
}

class SelectMonthEvent extends AgreementEvent {
  final Month month;

  const SelectMonthEvent({required this.month});
}

class SelectYearEvent extends AgreementEvent {
  final Year year;

  const SelectYearEvent({required this.year});
}

class GetAgreementByIdEvent extends AgreementEvent {
  final String agreementId;

  const GetAgreementByIdEvent({
    required this.agreementId,
  });
}

class NavigateBackEvent extends AgreementEvent {
  const NavigateBackEvent();
}
