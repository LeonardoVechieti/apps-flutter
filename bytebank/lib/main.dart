import 'package:flutter/material.dart';

void main() => runApp(const BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  FormularioTransferencia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criando Transferência'),),
      body: Column(
        children: <Widget>[
           Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: const TextStyle(fontSize: 24.0),
              decoration: const InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000',
              ),
              controller: _controladorCampoNumeroConta,
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: const TextStyle(fontSize: 24.0),
              decoration: const InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00',
              ),
              controller: _controladorCampoValor,
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
              final double? valor = double.tryParse(_controladorCampoValor.text);
              if (numeroConta != null && valor != null) {
                final transferenciaCriada = Transferencia(valor, numeroConta);
                debugPrint('$transferenciaCriada');
              }
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget{
  const ListaTransferencias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transferências'),),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 1000)),
          ItemTransferencia(Transferencia(200.0, 2000)),
          ItemTransferencia(Transferencia(300.0, 3000)),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}