part of 'agreement_form_bloc.dart';

abstract class AgreementFormState extends Equatable {
  const AgreementFormState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class AgreementFormInitial extends AgreementFormState {}


class ShowLoadingState extends AgreementFormState {}

class HideLoadingState extends AgreementFormState {}

class GetAgreementByIdSuccessState extends AgreementFormState {
  final Agreement agreement;

  const GetAgreementByIdSuccessState({
    required this.agreement,
  });
}

class GetAgreementByIdFailState extends AgreementFormState {
  final String errorMessage;

  const GetAgreementByIdFailState({
    required this.errorMessage,
  });
}
