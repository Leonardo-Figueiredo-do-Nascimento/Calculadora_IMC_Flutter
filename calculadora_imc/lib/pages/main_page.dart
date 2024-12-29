import 'package:calculadora_imc/pages/home_page.dart';
import 'package:calculadora_imc/pages/registers_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  PageController pageController = PageController(initialPage: 0);
  
  int posicaoPagina = 0;
  
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Calculadora IMC"),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: PageView(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                  posicaoPagina = value;
              });
            },
            children: const [
                  HomePage(),
                  RegistersPage(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    currentIndex: posicaoPagina,
                    onTap: (value) {
                      setState(() {
                        pageController.jumpToPage(value);
                      });
                    },
                  backgroundColor: const Color.fromARGB(255, 231, 231, 231),
                  items: const [
                    BottomNavigationBarItem(
                        label: "Home", icon: Icon(Icons.home)),
                    BottomNavigationBarItem(
                      label: "Registros", icon: Icon(Icons.folder)
                    )                  
                  ]
                ),
      ),
    );
  }
}