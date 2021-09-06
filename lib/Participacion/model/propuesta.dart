class Propuesta {
  String pid;
  final String nomprop;
  final String problema;
  final String solucion;
  final String argumento;
  final String categoria;
  final String orden;
  final String ownerTipo;
  final String ownerUid;
  final String ownerName;
  final String? imageUrl;
  int estlike;
  int doclike;
  int adlike;
  int exlike;
  int estno;
  int docno;
  int exno;
  int adno;
  final String? fecha;
  int comentarios;

  int numapoyo;
  int numencanta;
  int numrevisar;
  int numnoapoyo;
  bool apoyo;
  bool meencanta;
  bool revisar;
  bool noapoyo; 

  bool isExpanded;


  Propuesta({
    this.pid = '123',
    required this.orden,
    required this.nomprop,
    required this.problema,
    required this.solucion,
    required this.argumento,
    required this.categoria,
    required this.ownerTipo,
    required this.ownerName,
    required this.ownerUid,
    this.estlike = 0,
    this.doclike = 0,
    this.adlike = 0,
    this.exlike = 0,
    this.estno = 0,
    this.docno = 0,
    this.adno = 0,
    this.exno = 0,
    this.imageUrl,
    this.fecha,
    this.comentarios = 0,
    this.numapoyo=0,
    this.numencanta=0,
    this.numnoapoyo=0,
    this.numrevisar=0,
    this.apoyo=false,
    this.meencanta=false,
    this.noapoyo=false,
    this.revisar=false,
    this.isExpanded=false
  }
  );
}
