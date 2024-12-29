import 'package:calculadora_imc/model/medida_sqlite.dart';
import 'package:calculadora_imc/repositories/sqlite/database.dart';

class MedidasRepository {
  Future<List<MedidaSqlite>> obterDados() async{
    List<MedidaSqlite> medidas = [];
    var db = await SQLiteDatabase().obterDatabase();
    var result = await db.rawQuery("SELECT id,altura, peso, imc FROM IMCs");

    for(var element in result){
      medidas.add(
        MedidaSqlite(
          double.parse(element['peso'].toString()),
          double.parse(element['altura'].toString()), 
          element['imc'].toString()
        )
      );
    }

    return medidas;
  }

  Future<void> salvarMedida(MedidaSqlite medida) async{
    var db = await SQLiteDatabase().obterDatabase();
    await db.rawInsert("INSERT INTO IMCs (peso,altura,imc) VALUES(?,?,?)",[medida.peso,medida.altura,medida.classificacao]);
  }
}