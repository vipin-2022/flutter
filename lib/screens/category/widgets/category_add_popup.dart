import 'package:flutter/material.dart';
import 'package:personal_money_manager/db/category/category_db.dart';

import 'package:personal_money_manager/models/category/category_model.dart';

ValueNotifier<CategoryType> selectedCategoryNotifier =
    ValueNotifier(CategoryType.income);

Future<void> showCategoryAddPopup(BuildContext context) async {
  final _nameEditingController = TextEditingController();
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          title: Text("Add Category"),
          children: [
            SizedBox(
              height: 17,
            ),
            TextFormField(
              controller: _nameEditingController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Category Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                RadioButton(
                    // selectedCategoryType: CategoryType.income,
                    title: "Income",
                    type: CategoryType.income),
                RadioButton(
                    // selectedCategoryType: CategoryType.expense,
                    title: "Expense",
                    type: CategoryType.expense),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  final _text = _nameEditingController.text;
                  if (_text.isEmpty) {
                    return;
                  }
                  final _categoryType = selectedCategoryNotifier.value;
                  final _dbModel = CategoryModel(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: _text,
                      CategoryType: _categoryType);
                  CategoryDB().insertCategory(_dbModel);
                  CategoryDB().refreshUi();

                  Navigator.of(ctx).pop();
                },
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        );
      });
}

class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;
  // final CategoryType selectedCategoryType;

  const RadioButton({
    Key? key,
    required this.title,
    required this.type,
    // required this.selectedCategoryType
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedCategoryNotifier,
      builder: (BuildContext ctx, CategoryType newcategory, Widget? _) {
        return Row(
          children: [
            Radio<CategoryType>(
              value: type,
              groupValue: newcategory,
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                selectedCategoryNotifier.value = value;
                selectedCategoryNotifier.notifyListeners();
              },
            ),
            Text(title),
          ],
        );
      },
    );
  }
}
