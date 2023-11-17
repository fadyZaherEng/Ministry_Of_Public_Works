import 'package:aim/src/domain/repositories/language_repository.dart';

class GetLanguageUseCase {
  final LanguageRepository languageRepository;

  GetLanguageUseCase(this.languageRepository);

  Future<String> call() async {
    return languageRepository.getLanguage();
  }
}
