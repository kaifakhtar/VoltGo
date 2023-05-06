import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/start_point_repo.dart';

final starPointControllerProvider = Provider<StarPointController>((ref) {
  return StarPointController(starPointRepo: ref.read(starPointRepoProvider));
});

class StarPointController {
  StarPointRepo starPointRepo;
  StarPointController({
    required this.starPointRepo,
  });

  incrementStarPointControllermethod(
    ref,
    String collecName,
    String docId,
  ) {
    starPointRepo.incrementStarPoint(ref, collecName, docId);
  }
}
