import 'package:allo_urgence_pro/app/modules/auth/models/urgence_model.dart';

abstract class BaseUrgenceRepository {
  Future<UrgenceModel?> createUrgence(UrgenceModel urgence);
  Future<UrgenceModel?> getUrgence(String idUrgentiste);
  Future<UrgenceModel?> updateUrgence(UrgenceModel urgence);
}
