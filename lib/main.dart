import 'package:flutter/material.dart';
import "widgets/botoes.dart";
import "widgets/campo_texto.dart";

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MinhaTela());
  }
}

  final TextEditingController valorController = TextEditingController();
  final TextEditingController aporteController = TextEditingController();
  final TextEditingController taxaController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();
  final TextEditingController metaController = TextEditingController();

  double resultado = 0;

  void total(){
    double valor=double.tryParse(valorController.text) ?? 0;
    double quantidade=double.tryParse(quantidadeController.text) ?? 0;
  
  
  }

  void limpar(){
    double valor=double.tryParse(valorController.text) ?? 0;
    double aporte=double.tryParse(aporteController.text) ?? 0;
    double taxa=double.tryParse(taxaController.text) ?? 0;
    double quantidade=double.tryParse(quantidadeController.text) ?? 0;
    double meta=double.tryParse(metaController.text) ?? 0;
  }


class MinhaTela extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("Cadastro de Produtos"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.deepOrange,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            meuTextField("Valor Inicial", Icons.attach_money),
            meuTextField(" Aporte Mensal", Icons.calendar_month),
            meuTextField(" Taxa de Juros", Icons.percent_outlined),
            meuTextField("Quantidade de Meses", Icons.calendar_month),
            meuTextField("Meta Financeira ", Icons.lock,senha:true),

            const SizedBox(height: 25),
            meuBotao("Calcular", Colors.deepOrange, total),
            meuBotao("Limpar Dados", Colors.deepOrange, limpar),
        
          ],
        ),
      ),
    );
  }
}