import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:kratos_pdd/Participacion/model/propuesta.dart';
import 'package:kratos_pdd/Participacion/repository/rep_cloud_part.dart';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:kratos_pdd/User/model/user.dart';

class PartBloc implements Bloc {
  final _cloudPartRepo = RepCloudPart();
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  void updatePropuestaDB(Propuesta prop) =>
      _cloudPartRepo.updatePropuestaDB(prop);

  Stream<QuerySnapshot> get propuestasStream => _cloudPartRepo.propuestasStream;
  Future<QuerySnapshot<Map<String, dynamic>>> get  getpropfuture => _cloudPartRepo.getpropfuture;

  List<Propuesta> buildPropuestas(List<DocumentSnapshot> propssnapshot) {
    bool apoyo = false;
    bool meencanta = false;
    bool revisar = false;
    bool noapoyo = false;
    int numapoyo = 0;
    int numencanta = 0;
    int numrevisar = 0;
    int numnoapoyo = 0;

    auth.User? usuario = _auth.currentUser;
    List<Propuesta> propuestas = [];
    propssnapshot.forEach((p) {
      List apoyos = p.get('Apoyo');
      apoyos.forEach((us) {
        numapoyo++;
        if (us.id == usuario!.uid) {
          apoyo = true;
          
        }
      });

      List encantas = p.get('Me encanta');
      encantas.forEach((us) {
        numencanta++;
        if (us.id == usuario!.uid) {
          meencanta = true;
          
        }
      });

      List revisores = p.get('Revisar');
      revisores.forEach((us) {
        numrevisar++;
        if (us.id == usuario!.uid) {
          revisar = true;
          
        }
      });

      List noapoyos = p.get('No Apoyo');
      noapoyos.forEach((us) {
        numnoapoyo++;
        if (us.id == usuario!.uid) {
          noapoyo = true;
          
        }
      });

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
          comentarios: p.get('comentarios'),
          apoyo: apoyo,
          meencanta: meencanta,
          revisar: revisar,
          noapoyo: noapoyo,
          numapoyo: numapoyo,
          numencanta: numencanta,
          numrevisar: numrevisar,
          numnoapoyo: numnoapoyo,
          pid: p.id);
      propuestas.add(prop);

      apoyo = false;
      meencanta = false;
      revisar = false;
      noapoyo = false;
      numapoyo = 0;
      numencanta = 0;
      numrevisar = 0;
      numnoapoyo = 0;
    });

    return propuestas;
  }

  Future<void> reaccionarProp(String pid, User user, int index) =>
      _cloudPartRepo.reaccionarProp(pid, user, index);

  Future<void> borrarReacdeProp(String pid, User user) =>
      _cloudPartRepo.borrarReacdeProp(pid, user);

  getstring() {
    return 'patata';
  }

  @override
  void dispose() {}
}
