// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  final Function _deleteTransaction;

  TransactionList(this._userTransaction,this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      color: Colors.white10,
      width: double.infinity,
      height: 530,
      child: _userTransaction.isEmpty
          ? Column(
              children: [
                Text(
                  'No transaction added yet! ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 40,
                  ),
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 10,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                          child: Text(
                            '\$${_userTransaction[index].amount}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      '${_userTransaction[index].title}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(_userTransaction[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                      ),
                      onPressed: ()=> _deleteTransaction(_userTransaction[index].id),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
              itemCount: _userTransaction.length,
            ),
    );
  }

// Card(
// elevation: 8,
// // margin: EdgeInsets.all(10),
// child: Row(
// children: [
// Container(
// width: 130,
// child: Text(
// // '\$' + tx.amount.toString(),
// '\$ ${_userTransaction[index].amount}',
// style: TextStyle(
// color: Theme.of(context).primaryColor,
// letterSpacing: 1,
// fontSize: 20,
// fontWeight: FontWeight.bold,
// ),
// textAlign: TextAlign.center,
// ),
// padding: EdgeInsets.all(10),
// margin:
// EdgeInsets.symmetric(vertical: 10, horizontal: 5),
// decoration: BoxDecoration(
// color: Colors.white,
// border: Border.all(
// color: Theme.of(context).primaryColor,
// width: 3,
// style: BorderStyle.solid,
// ),
// borderRadius: BorderRadius.circular(2),
// ),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// _userTransaction[index].title,
// style: Theme.of(context).textTheme.titleLarge,
// ),
// Text(
// DateFormat.yMMMMd()
//     .format(_userTransaction[index].date),
// style: TextStyle(
// color: Colors.grey,
// ),
// ),
// ],
// ),
// ],
// ),
// )
}
