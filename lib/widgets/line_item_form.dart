import 'package:flutter/material.dart';
import '../models/line_item.dart';

class LineItemForm extends StatelessWidget {
  final LineItem item;
  final VoidCallback onRemove;
  final ValueChanged<LineItem> onUpdate;

  const LineItemForm({
    super.key,
    required this.item,
    required this.onRemove,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: item.name,
              decoration: const InputDecoration(
                labelText: 'Product/Service Name',
              ),
              onChanged: (value) {
                item.name = value;
                onUpdate(item);
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: item.quantity.toString(),
                    decoration: const InputDecoration(labelText: 'Quantity'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      item.quantity = int.tryParse(value) ?? 1;
                      onUpdate(item);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    initialValue: item.rate.toString(),
                    decoration: const InputDecoration(labelText: 'Rate'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      item.rate = double.tryParse(value) ?? 0.0;
                      onUpdate(item);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: item.discount.toString(),
                    decoration: const InputDecoration(labelText: 'Discount'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      item.discount = double.tryParse(value) ?? 0.0;
                      onUpdate(item);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    initialValue: item.tax.toString(),
                    decoration: const InputDecoration(labelText: 'Tax %'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      item.tax = double.tryParse(value) ?? 0.0;
                      onUpdate(item);
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: onRemove,
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
