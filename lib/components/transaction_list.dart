import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, this.onRemove, {Key? key})
      : super(key: key);

  final List<Transaction> transactions;
  final void Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constrains) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: constrains.maxHeight * 0.135,
                  child: Text(
                    'Nenhuma transação cadastrada',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(height: constrains.maxHeight * 0.135),
                SizedBox(
                  height: constrains.maxHeight * 0.73,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final tr = transactions[index];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 35,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text('R\$${tr.value}'),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                  trailing: MediaQuery.of(context).size.width > 300
                      ? TextButton.icon(
                          onPressed: () => onRemove(tr.id),
                          icon: const Icon(Icons.delete),
                          label: const Text('Excluir'))
                      : IconButton(
                          onPressed: () => onRemove(tr.id),
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).colorScheme.error,
                        ),
                ),
              );
            },
          );
  }
}
