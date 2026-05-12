import 'dart:developer';

import 'package:news_app/core/shared/shared.dart';
import 'package:news_app/data/models/source_model.dart';
import 'package:news_app/data/repository/source_repository.dart';

class SourceViewModel with ChangeNotifier {
  SourceViewModel(this.sourceRepository);

  final SourceRepository sourceRepository;

  bool isLoading = false;
  String? errorMessage;

  List<SourceModel> sources = [];
Future<void> getSources({required String category}) async {
  isLoading = true;
  notifyListeners();

  try {
    sources = await sourceRepository.getSources(category);
  } catch (e) {
    errorMessage = e.toString();
  }

  isLoading = false;
  notifyListeners();
}    }
