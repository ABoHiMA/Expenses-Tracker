import 'package:aetracker/ae/expenses_list/itemsexp.dart';
import 'package:aetracker/models/expenses.dart';
import 'package:flutter/material.dart';

class ListsExp extends StatelessWidget {
  const ListsExp({
    super.key,
    required this.exp,
    required this.rmv,
  });

  final List<Expenses> exp;
  final void Function(Expenses expenses) rmv;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: exp.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(exp[index]),
        background: Container(
          color: Theme.of(context).appBarTheme.backgroundColor,
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            vertical: Theme.of(context).cardTheme.margin!.vertical,
          ),
          child: const Icon(Icons.delete_outline_rounded),
        ),
        onDismissed: (direction) {
          rmv(exp[index]);
        },
        child: ItemsExp(expn: exp[index]),
      ),
    );
  }
}
