import 'package:allo_urgence_pro/app/data/repositories/urgence/base_urgence_repository.dart';
import 'package:allo_urgence_pro/app/modules/auth/models/urgence_model.dart';
import 'package:allo_urgence_pro/app/services/api_service.dart';

class UrgenceRepository implements BaseUrgenceRepository {
  ApiService apiService = ApiService();
  @override
  Future<UrgenceModel?> createUrgence(UrgenceModel urgence) async {
    return await apiService.registerUrgence(urgence);
  }

  @override
  Future<UrgenceModel?> updateUrgence(UrgenceModel urgence) async {
    return await apiService.updateUrgence(urgence);
  }

  @override
  Future<UrgenceModel?> getUrgence(String idUrgentiste) async {
    return await apiService.getUrgence(idUrgentiste);
  }
}
