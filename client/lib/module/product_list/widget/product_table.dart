import 'package:client/core.dart';
import 'package:flutter/material.dart';

class ProductTable extends StatelessWidget {
  final List items;

  const ProductTable({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ProductListController.instance;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DataTable(
        columnSpacing: 16.0,
        columns: const [
          DataColumn(
            label: Text('ID'),
          ),
          DataColumn(
            label: Text('Product Name'),
          ),
          DataColumn(
            label: Text('Price'),
          ),
          DataColumn(
            label: Text('Action'),
          ),
        ],
        rows: List<DataRow>.generate(
          items.length,
          (index) {
            var item = items[index];
            return DataRow(
              color: MaterialStateColor.resolveWith((states) =>
                  index % 2 == 0 ? Colors.grey[200]! : Colors.white),
              cells: [
                DataCell(
                  Text(item['id'].toString()),
                ),
                DataCell(
                  Text(item['product_name']),
                ),
                DataCell(
                  Text(item['price'].toString()),
                ),
                DataCell(
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => controller.doUpdate(item),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => controller.doDelete(item["id"]),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
