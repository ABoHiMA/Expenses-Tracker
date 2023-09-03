import 'package:flutter/material.dart';
import 'package:aetracker/models/expenses.dart';
import 'package:aetracker/ae/expenses_list/listsexp.dart';
import 'package:aetracker/ae/expenses_list/newexp.dart';
// import 'package:aetracker/ae/mapp.dart';

class AEExpenses extends StatefulWidget {
  const AEExpenses({super.key});

  @override
  State<AEExpenses> createState() => _AEExpensesState();
}

class _AEExpensesState extends State<AEExpenses> {
  // void thm() {
  //   setState(() {
  //     var thmstm = thmlit;
  //   });
  // }

  final List<Expenses> rgstrex = [
    Expenses(
      title: "AE",
      category: Category.gamed,
      amount: 18.6,
      date: DateTime.now(),
    ),
  ];

  void addexp(Expenses expenses) {
    setState(() {
      rgstrex.add(expenses);
    });
  }

  void rmvexp(Expenses expenses) {
    final idx = rgstrex.indexOf(expenses);
    setState(() {
      rgstrex.remove(expenses);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Deleted...!"),
        action: SnackBarAction(
          label: "UNDO",
          onPressed: () {
            setState(() {
              rgstrex.insert(idx, expenses);
            });
          },
        ),
      ),
    );
  }

  void addbtn() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExp(addnewexp: addexp),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text(
        'No expenses found...!',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    if (rgstrex.isNotEmpty) {
      mainContent = ListsExp(
        exp: rgstrex,
        rmv: rmvexp,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("AEExpensesTracker..."),
        actions: [
          IconButton(
            onPressed: addbtn,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                // Container(
                //   color: Colors.amberAccent,
                //   child: IconButton(
                //     onPressed: thm,
                //     icon: const Icon(Icons.light_mode_outlined),
                //   ),
                // ),
                const SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                // Container(
                //   color: Colors.amberAccent,
                //   child: IconButton(
                //     onPressed: thm,
                //     icon: const Icon(Icons.light_mode_outlined),
                //   ),
                // ),
                const SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
