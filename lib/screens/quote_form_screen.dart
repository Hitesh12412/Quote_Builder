import 'package:flutter/material.dart';
import '../models/line_item.dart';
import '../widgets/line_item_form.dart';
import '../widgets/quote_preview.dart';

class QuoteFormScreen extends StatefulWidget {
  const QuoteFormScreen({super.key});

  @override
  State<QuoteFormScreen> createState() => _QuoteFormScreenState();
}

class _QuoteFormScreenState extends State<QuoteFormScreen> {
  final List<LineItem> _items = [];

  double get subtotal => _items.fold(0.0, (sum, item) => sum + item.total);

  void _addLineItem() {
    setState(() {
      _items.add(LineItem(name: '', quantity: 1, rate: 0.0));
    });
  }

  void _removeLineItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  void _updateLineItem(int index, LineItem updatedItem) {
    setState(() {
      _items[index] = updatedItem;
    });
  }

  void _goToPreview() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuotePreview(items: _items, subtotal: subtotal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Quote Builder')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return LineItemForm(
                    item: _items[index],
                    onRemove: () => _removeLineItem(index),
                    onUpdate: (updatedItem) =>
                        _updateLineItem(index, updatedItem),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _addLineItem,
              icon: const Icon(Icons.add),
              label: const Text('Add Item'),
            ),
            const SizedBox(height: 16),
            Text(
              'Subtotal: ₹${subtotal.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _items.isNotEmpty ? _goToPreview : null,
              child: const Text('Preview Quote'),
            ),
          ],
        ),
      ),
    );
  }
}
