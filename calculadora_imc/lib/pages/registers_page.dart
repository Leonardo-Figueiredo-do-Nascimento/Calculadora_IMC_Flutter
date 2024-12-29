import 'package:calculadora_imc/model/medida_sqlite.dart';
import 'package:calculadora_imc/repositories/medidas_repository.dart';
import 'package:flutter/material.dart';

class RegistersPage extends StatefulWidget {
  const RegistersPage({super.key});

  @override
  State<RegistersPage> createState() => _RegistersPageState();
}

class _RegistersPageState extends State<RegistersPage> {

  MedidasRepository medidasRepository = MedidasRepository();
  var _medidas = const <MedidaSqlite>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterMedidas();
  }

  void obterMedidas() async{
    _medidas = await medidasRepository.obterDados();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Linha da legenda
        const Row(
          children: [
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Text("Peso(kg)",style: TextStyle(fontSize: 16),),
                  SizedBox(width: 20,),
                  Text("Altura(m)",style: TextStyle(fontSize: 16)),
                ]
              )
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Text("IMC",style: TextStyle(fontSize: 16)),
                ]
              )
            )
            
          ],
        ),
        const Divider(),
        // Lista de medidas
      Expanded(
        child: ListView.builder(
          itemCount: _medidas.length,
          itemBuilder: (context, index) {
            final medida = _medidas[index];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        Text("${medida.peso.toStringAsFixed(1)} kg",
                            style: const TextStyle(fontSize: 16)),
                        const SizedBox(width: 20),
                        Text("${medida.altura.toStringAsFixed(2)} m",
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(medida.classificacao,
                        style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            );
          },
        ),)
      ],
    );
  }
}