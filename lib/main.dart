import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction(
    //   id: 1,
    //   title: 'Novo Tênis de Corrida',
    //   value: 310.67,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 2,
    //   title: 'Conta de Luz',
    //   value: 211.35,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 3,
    //   title: 'Novo Tênis de Corrida',
    //   value: 310.67,
    //   date: DateTime.now(),
    // ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionForm(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Despesas Pessoais',
          style: TextStyle(
            fontFamily: 'OpenSans-Bold',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionForm(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                child: Text('Gráfico'),
                elevation: 5,
                color: Colors.purple,
              ),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionForm(context),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
