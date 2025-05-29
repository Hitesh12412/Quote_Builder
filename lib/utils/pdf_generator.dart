import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/line_item.dart';

Future<void> generateAndPrintPDF(List<LineItem> items, double subtotal) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text("Quote Summary", style: pw.TextStyle(fontSize: 24)),
            pw.SizedBox(height: 20),
            pw.Table.fromTextArray(
              headers: ['Name', 'Qty', 'Rate', 'Discount', 'Tax %', 'Total'],
              data: items
                  .map(
                    (item) => [
                      item.name,
                      item.quantity.toString(),
                      item.rate.toStringAsFixed(2),
                      item.discount.toStringAsFixed(2),
                      item.tax.toStringAsFixed(1),
                      item.total.toStringAsFixed(2),
                    ],
                  )
                  .toList(),
            ),
            pw.SizedBox(height: 20),
            pw.Text('Grand Total: ₹${subtotal.toStringAsFixed(2)}'),
          ],
        );
      },
    ),
  );

  await Printing.layoutPdf(onLayout: (format) => pdf.save());
}
