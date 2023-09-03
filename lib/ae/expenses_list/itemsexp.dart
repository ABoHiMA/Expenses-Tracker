import 'package:aetracker/models/expenses.dart';
import 'package:flutter/material.dart';

class ItemsExp extends StatelessWidget {
  const ItemsExp({super.key, required this.expn});

  final Expenses expn;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expn.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Text(
                  expn.amount.toStringAsFixed(2),
                  style: TextStyle(
                    color: Theme.of(context).textTheme.titleLarge!.color,
                  ),
                ),
                Text(
                  'L.E',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).textTheme.titleLarge!.color,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      expn.fdate,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.titleLarge!.color,
                      ),
                    ),
                    Icon(
                      categoryIcons[expn.category],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
