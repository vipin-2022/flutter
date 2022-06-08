import 'package:flutter/material.dart';
import 'package:personal_money_manager/db/category/category_db.dart';

import 'package:personal_money_manager/screens/category/widgets/expense_category_list.dart';
import 'package:personal_money_manager/screens/category/widgets/income_category_list.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({Key? key}) : super(key: key);

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    CategoryDB().refreshUi();
    print('..................');
    CategoryDB().getCategories().then((value) {
      print(value.toString());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              child: Text(
                "Income",
                style: TextStyle(fontSize: 20, color: Colors.green.shade700),
              ),
            ),
            Tab(
              child: Text(
                "Expense",
                style: TextStyle(fontSize: 20, color: Colors.green.shade700),
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [IncomeCategoryList(), ExpenseCategoryList()],
          ),
        ),
      ],
    );
  }
}
