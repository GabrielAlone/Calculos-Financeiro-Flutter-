import 'dart:math';

import 'package:flutter/material.dart';
import "widgets/botoes.dart";
import "widgets/campo_texto.dart";

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MinhaTela(),
    );
  }
}

class MinhaTela extends StatefulWidget {
  @override
  State<MinhaTela> createState() => _MinhaTelaState();
}

class _MinhaTelaState extends State<MinhaTela> {
  final TextEditingController valorController = TextEditingController();
  final TextEditingController aporteController = TextEditingController();
  final TextEditingController taxaController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();
  final TextEditingController metaController = TextEditingController();

  double resultado = 0;
  double investido = 0;
  double lucro = 0;
  double objetivo = 0;

  String mensagemMeta = "";

  void total() {
    double valor = double.tryParse(valorController.text) ?? 0;
    double aporte = double.tryParse(aporteController.text) ?? 0;
    double taxa = double.tryParse(taxaController.text) ?? 0;
    double quantidade = double.tryParse(quantidadeController.text) ?? 0;
    double meta = double.tryParse(metaController.text) ?? 0;

    setState(() {
      resultado = valor * pow((1 + taxa), quantidade).toDouble();

      investido = valor + (aporte * quantidade);

      lucro = resultado - investido;

      if (resultado >= meta) {
        mensagemMeta = "Meta alcançada";
      } else {
        objetivo = meta - resultado;
        mensagemMeta =
            "Faltam R\$ ${objetivo.toStringAsFixed(2)} para atingir a meta";
      }
    });
  }

  void limpar() {
    valorController.clear();
    aporteController.clear();
    taxaController.clear();
    quantidadeController.clear();
    metaController.clear();

    setState(() {
      resultado = 0;
      investido = 0;
      lucro = 0;
      objetivo = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculo Financeiro"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: const Color.fromARGB(255, 33, 87, 126),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            meuTextField("Valor Inicial", Icons.attach_money),
            meuTextField(" Aporte Mensal", Icons.calendar_month),
            meuTextField(" Taxa de Juros", Icons.percent_outlined),
            meuTextField("Quantidade de Meses", Icons.calendar_month),
            meuTextField(
              "Meta Financeira ",
              Icons.track_changes,
              senha: true,
            ),

            const SizedBox(height: 25),

            meuBotao(
              "Calcular",
              const Color.fromARGB(255, 33, 87, 126),
              total,
            ),

            meuBotao(
              "Limpar Dados",
              const Color.fromARGB(255, 33, 87, 126),
              limpar,
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
