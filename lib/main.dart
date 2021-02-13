import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
      id: 1,
      title: 'Novo Tênis de Corrida',
      value: 310.67,
      date: DateTime.now(),
    ),
    Transaction(
      id: 2,
      title: 'Conta de Luz',
      value: 211.35,
      date: DateTime.now(),
    ),
    Transaction(
      id: 3,
      title: 'Cobrança do Agiota',
      value: 677.87,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finanças'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              child: Text(
                'Gráfico',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              elevation: 5,
              color: Colors.purple,
            ),
          ),
          Column(
            children: _transactions.map((tr) {
              return Card(
                child: Text(tr.title),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
