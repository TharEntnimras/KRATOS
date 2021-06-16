import 'package:kratos_pdd/Participacion/model/propuesta.dart';
import 'package:kratos_pdd/Participacion/repository/rep_cloud_part.dart';

import 'package:kratos_pdd/User/model/user.dart' as us;
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class PartBloc implements Bloc {
  late us.User user;

  final _cloudPartRepo = RepCloudPart();

  void updatePropuestaDB(Propuesta prop) =>
      _cloudPartRepo.updatePropuestaDB(prop);

  getstring() {
    return 'patata';
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
