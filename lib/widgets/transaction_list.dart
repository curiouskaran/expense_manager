import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;
  TransactionList({@required this.userTransactions, @required this.deleteTransaction});

  Widget build(BuildContext context) {
    return Container(
        child: userTransactions.isNotEmpty
            ? ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Container(
                              height: 20,
                              child: FittedBox(
                                  child: Text(
                                      '${userTransactions[index].amount.toStringAsFixed(2)}₹')),
                            )),
                      ),
                      title: Text(
                        userTransactions[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Text(DateFormat.yMMMd()
                          .format(userTransactions[index].date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => deleteTransaction(userTransactions[index].id),
                      ),
                    ),
                  );
                },
                itemCount: userTransactions.length,
              )
            : Column(
                children: <Widget>[
                  Text(
                    "No Transaction added yet!",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 150,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ],
              ));
  }
}
