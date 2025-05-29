import 'package:flutter/material.dart';
import '../models/line_item.dart';
import '../utils/pdf_generator.dart'; // <-- PDF logic

class QuotePreview extends StatelessWidget {
  final List<LineItem> items;
  final double subtotal;

  const QuotePreview({super.key, required this.items, required this.subtotal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quote Preview')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quote Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Table(
              border: TableBorder.all(),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                const TableRow(
                  decoration: BoxDecoration(color: Colors.grey),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Product/Service',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8), child: Text('Qty')),
                    Padding(padding: EdgeInsets.all(8), child: Text('Rate')),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('Discount'),
                    ),
                    Padding(padding: EdgeInsets.all(8), child: Text('Tax %')),
                    Padding(padding: EdgeInsets.all(8), child: Text('Total')),
                  ],
                ),
                ...items.map(
                  (item) => TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(item.name),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(item.quantity.toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text('\₹${item.rate.toStringAsFixed(2)}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text('\₹${item.discount.toStringAsFixed(2)}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text('${item.tax.toStringAsFixed(1)}%'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text('\₹${item.total.toStringAsFixed(2)}'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Grand Total: ₹${subtotal.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => generateAndPrintPDF(items, subtotal),
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('Send as PDF'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
