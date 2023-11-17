import 'package:aim/src/domain/repositories/language_repository.dart';

class SetLanguageUseCase {
  final LanguageRepository languageRepository;

  SetLanguageUseCase(this.languageRepository);

  Future<bool> call(String languageCode) async {
    return languageRepository.setLanguage(languageCode);
  }
}
