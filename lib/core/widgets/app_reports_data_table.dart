import 'package:flutter/material.dart';

class AppReportsDataTable extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;
  const AppReportsDataTable({
    super.key,
    required this.columns,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            headingRowColor: WidgetStateColor.resolveWith(
              (states) => Colors.grey.shade200,
            ),
            border: TableBorder.all(width: 0.5),
            columns: columns,
            rows: rows,
          ),
        ),
      ),
    );
  }
}
