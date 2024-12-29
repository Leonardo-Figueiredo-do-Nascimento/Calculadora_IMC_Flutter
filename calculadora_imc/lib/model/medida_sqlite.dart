class MedidaSqlite {
  int _id = 0;

  double _peso = 0;
  
  double _altura = 0;

  String _classificacao = "";

  MedidaSqlite(this._peso,this._altura,this._classificacao);

  String get classificacao => _classificacao;

  set classificacao(String value) {
    _classificacao = value;
  }

  double get altura => _altura;

  set altura(double value) {
    _altura = value;
  }
  
  double get peso => _peso;

  set peso(double value) {
    _peso = value;
  }
  
  int get id => _id;

  set id(int value) {
    _id = value;
  }
}