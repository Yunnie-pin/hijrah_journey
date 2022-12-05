import 'package:fpdart/fpdart.dart';
import 'package:hadist/common/failure.dart';
import 'package:hadist/domain/repositories/hadist_repository.dart';

import '../entities/list_hadist.dart';

class GetSurahDetail {
  final SurahRepository repository;

  GetSurahDetail(this.repository);

  Future<Either<Failure, ListHadist>> execute(String id) {
    return repository.getListHadist(id);
  }
}
