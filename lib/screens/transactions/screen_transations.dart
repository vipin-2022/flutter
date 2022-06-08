import 'package:flutter/material.dart';
import 'package:personal_money_manager/db/category/category_db.dart';
import 'package:personal_money_manager/models/category/category_model.dart';

class ScreenTransactions extends StatelessWidget {
  const ScreenTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (BuildContext ctx, int index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                child: Text(
                  "23\nMar",
                  textAlign: TextAlign.center,
                ),
              ),
              title: Text("₹ 23550"),
              subtitle: Text("Dividend"),
            ),
          );
        },
        separatorBuilder: (BuildContext ctx, int index) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: 10,
      )),
    );
  }
}
