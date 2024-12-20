import 'package:calculadora_imc/services/calculo_imc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    var pesoController = TextEditingController(text: "");
    var alturaController = TextEditingController(text: "");
    double imc;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Calculadora IMC"),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Expanded(
            flex: 1,
            child: Column(
              children: [
                Column(
                  children: [
                
                    Container(
                      width: double.infinity,
                      child: const Text(
                        "Peso(kg): ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900
                        ),
                      ),
                    ),
                    TextField(
                      controller: pesoController,
                    ),
                
                    const SizedBox(height: 30,),
                
                    Container(
                      width: double.infinity,
                      child: const Text(
                        "Altura(m): ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900
                        ),
                      ),
                    ),
                    TextField(
                      controller: alturaController,
                    ),
                    const SizedBox(height: 20,),
                
                    TextButton(
                      onPressed: (){
                        if(alturaController.text=='' || pesoController.text == ""){
                          showModalBottomSheet(
                            context: context, 
                            builder: (BuildContext bc){
                              return Container(
                                width: 350,
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                child: const Text(
                                  "Preencha os campos!!",
                                  textAlign: TextAlign.center,
                                ),
                              );
                            });
                        } else{
                          imc = double.parse(pesoController.text) / (double.parse(alturaController.text) * double.parse(alturaController.text));
                          String classificacao = getClassificacao(imc);
                          showModalBottomSheet(
                            context: context, 
                            builder: (BuildContext bc){
                              return Container(
                                width: 350,
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      "Seu IMC é de ${imc.toStringAsFixed(2)}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900
                                      ),
                                    ),
                                    Text(
                                      classificacao, 
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900
                                      )
                                    ),
                                  ],
                                )
                              );
                            });
                        }
                      }, 
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                        minimumSize: WidgetStatePropertyAll(Size(80,40))
                      ),
                      child: const Text(
                        "Calcular",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white
                        ),
                      )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}