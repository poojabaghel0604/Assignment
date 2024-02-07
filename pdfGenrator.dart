import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:printing/printing.dart';

class QuotationTemplate extends StatefulWidget {
  @override
  State<QuotationTemplate> createState() => _QuotationTemplateState();
}

class _QuotationTemplateState extends State<QuotationTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotation Template'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Retrieve data from Firebase
            Map<String, dynamic> quotationData = await retrieveQuotationData();
            // Generate PDF
            final pdfLib.Document pdf = pdfLib.Document();
            pdf.addPage(
              pdfLib.Page(
                build: (pdfLib.Context context) {
                  return pdfLib.Center(
                    child: pdfLib.Text('Quotation: ${quotationData.toString()}'),
                  );
                },
              ),
            );
            // Print or share PDF
            await Printing.sharePdf(bytes: await pdf.save(), filename: 'quotation.pdf');
          },
          child: Text('Generate Quotation PDF'),
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>> retrieveQuotationData() async {
  // Retrieve data from Firebase
  // Example: DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('quotation').doc('quotation_id').get();
  // Map<String, dynamic> quotationData = snapshot.data() as Map<String, dynamic>;
  Map<String, dynamic> quotationData = {'customer': 'John Doe', 'product': 'Product A', 'price': 100};
  return quotationData;
}
