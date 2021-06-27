import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kratos_pdd/Participacion/model/propuesta.dart';
import 'package:kratos_pdd/Participacion/repository/rep_cloud_part.dart';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class PartBloc implements Bloc {
  final _cloudPartRepo = RepCloudPart();

  void updatePropuestaDB(Propuesta prop) =>
      _cloudPartRepo.updatePropuestaDB(prop);

  Stream<QuerySnapshot> get propuestasStream => _cloudPartRepo.propuestasStream;

  List<Propuesta> buildPropuestas(List<DocumentSnapshot> propssnapshot) {
    List<Propuesta> propuestas = [];
    propssnapshot.forEach((p) {
      Propuesta prop = Propuesta(
          orden: p.get('orden'),
          nomprop: p.get('nomprop'),
          problema: p.get('problema'),
          solucion: p.get('solucion'),
          argumento: p.get('argumento'),
          categoria: p.get('categoria'),
          ownerTipo: p.get('ownerTipo'),
          ownerName: p.get('ownerName'),
          ownerUid: p.get('owner').id,
          pid: p.id);
      propuestas.add(prop);
    });

    return propuestas;
  }

  getstring() {
    return 'patata';
  }

  @override
  void dispose() {}
}
