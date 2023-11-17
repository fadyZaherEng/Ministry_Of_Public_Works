part of 'agreement_form_bloc.dart';

abstract class AgreementFormEvent extends Equatable {
  const AgreementFormEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}



class GetAgreementByIdEvent extends AgreementFormEvent {
  final String id;

  const GetAgreementByIdEvent({
    required this.id,
  });
}
