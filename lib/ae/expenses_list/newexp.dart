import 'package:flutter/material.dart';
import 'package:aetracker/models/expenses.dart';

class NewExp extends StatefulWidget {
  const NewExp({super.key, required this.addnewexp});

  final void Function(Expenses expenses) addnewexp;

  @override
  State<StatefulWidget> createState() {
    return _NewExpState();
  }
}

class _NewExpState extends State<NewExp> {
  final _ttlctrl = TextEditingController();
  final _mntctrl = TextEditingController();
  Category _sc = Category.gamed;
  DateTime? _sdt;

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_mntctrl.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_ttlctrl.text.trim().isEmpty || amountIsInvalid || _sdt == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Warnning..."),
          content: const Text(
            "Complete The Data ,Please...",
            textAlign: TextAlign.center,
          ),
          icon: const Icon(Icons.error_outline_rounded),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Ok"),
            )
          ],
        ),
      );
      return;
    } else {
      widget.addnewexp(
        Expenses(
          title: _ttlctrl.text,
          category: _sc,
          amount: enteredAmount,
          date: _sdt!,
        ),
      );
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Succecful..."),
          content: const Text(
            "Data is Recorded Succecful...",
            textAlign: TextAlign.center,
          ),
          icon: const Icon(Icons.done_outline_rounded),
          actions: [
            TextButton(
              onPressed: hm,
              child: const Text("Done"),
            )
          ],
        ),
      );
      return;
    }
  }

  void dt() async {
    final now = DateTime.now();
    final firstDate = DateTime(
      now.year - 1,
      now.month,
      now.day,
    );
    final lastDate = DateTime(
      now.year + 976,
      now.month,
      now.day,
    );
    final pdt = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);
    setState(() {
      _sdt = pdt;
    });
  }

  void clr() {
    setState(() {
      _sdt = null;
      _ttlctrl.clear();
      _mntctrl.clear();
    });
  }

  void hm() {
    setState(() {
      for (var i = 0; i < 2; i++) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _ttlctrl.dispose();
    _mntctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final key = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(13, 13, 13, key + 13),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close_rounded),
                  ),
                  ElevatedButton(
                    onPressed: _submitExpenseData,
                    child: const Text("Save"),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              TextField(
                controller: _ttlctrl,
                maxLength: 186,
                decoration: const InputDecoration(
                  label: Text("Title"),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _mntctrl,
                      decoration: const InputDecoration(
                        label: Text("Amount"),
                        prefixText: 'L.E  ',
                        prefixStyle: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: dt,
                        icon: const Icon(Icons.date_range),
                      ),
                      Text(
                        _sdt == null
                            ? "(No Date Selected)"
                            : "(${frmt.format(_sdt!)})",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
              DropdownButton(
                value: _sc,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _sc = value;
                  });
                  // print(value);
                },
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: clr,
                    child: const Text("Clear All"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
