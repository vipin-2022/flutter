import 'package:flutter/material.dart';
import 'package:personal_money_manager/db/category/category_db.dart';
import 'package:personal_money_manager/models/category/category_model.dart';

import 'package:personal_money_manager/screens/category/screen_catagory.dart';
import 'package:personal_money_manager/screens/category/widgets/category_add_popup.dart';
import 'package:personal_money_manager/screens/home/widgets/bottom_navigation.dart';
import 'package:personal_money_manager/screens/transactions/screen_transations.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final _pages = [
    const ScreenTransactions(),
    const ScreenCategory(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          "Finace Manager",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: selectedIndexNotifier,
            builder: (BuildContext ctx, int updatedIndex, Widget? _) {
              return _pages[selectedIndexNotifier.value];
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            //Transaction add
          } else {
            showCategoryAddPopup(context);
            // final _sample = CategoryModel(
            //     id: DateTime.now().millisecondsSinceEpoch.toString(),
            //     name: "Book",
            //     CategoryType: CategoryType.expense);
            // CategoryDB().insertCategory(_sample);
          }
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
    );
  }
}
