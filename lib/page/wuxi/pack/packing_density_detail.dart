import 'package:flutter/material.dart';

class PackingDensityDetail extends StatefulWidget {

  static final String sName = 'packing_density_detail';
  
  @override
  _PackingDensityDetailState createState() => _PackingDensityDetailState();
}

class _PackingDensityDetailState extends State<PackingDensityDetail> {

  int _defaultRowPageCount = 5;
  MyTable table = MyTable();

  List<DataColumn> getColumns() {
    return [
      DataColumn(
        label: Text('编号'),
      ),
      DataColumn(
        label: Text('密度1'),
      ),
      DataColumn(
        label: Text('密度2'),
      ),
      DataColumn(
        label: Text('密度3'),
      ),
      DataColumn(
        label: Text('平均密度'),
      ),
    ];
  }

  Widget getPaginatedDataTable() {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: Text('密度清单'), 
        columns: getColumns(),
        source: table,
        rowsPerPage: _defaultRowPageCount,
        onRowsPerPageChanged: (value) {
          setState(() {
            _defaultRowPageCount = value;
          });
        },
        availableRowsPerPage: [
          5,10,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('打包密度清单'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: getPaginatedDataTable(),
      ),
    );
  }
}

class MyTable extends DataTableSource {

  List<Pack> posts = <Pack>[
    Pack(
        no: '1',
        density1: '1.00',
        density2: '1.00',
        density3: '4.00',
        avgDensity: '2.00'
    ),
    Pack(
        no: '2',
        density1: '2.00',
        density2: '4.00',
        density3: '3.00',
        avgDensity: '3.00'
    ),
    Pack(
        no: '3',
        density1: '6.00',
        density2: '3.00',
        density3: '3.00',
        avgDensity: '4.00'
    ),
    Pack(
        no: '4',
        density1: '3.00',
        density2: '3.00',
        density3: '3.00',
        avgDensity: '3.00'
    ),
    Pack(
        no: '5',
        density1: '5.00',
        density2: '2.00',
        density3: '8.00',
        avgDensity: '5.00'
    ),
    Pack(
        no: '6',
        density1: '1.00',
        density2: '1.00',
        density3: '1.00',
        avgDensity: '1.00'
    ),
  ];

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if(index >= posts.length)
      return null;
    Pack pack = posts[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(pack.no)),
        DataCell(Text(double.parse(pack.density1).toStringAsFixed(2))),
        DataCell(Text(double.parse(pack.density2).toStringAsFixed(2))),
        DataCell(Text(double.parse(pack.density3).toStringAsFixed(2))),
        DataCell(Text(double.parse(pack.avgDensity).toStringAsFixed(2))),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => posts.length;

  @override
  int get selectedRowCount => 0;

}

class Pack {
  Pack({
    this.no,
    this.density1,
    this.density2,
    this.density3,
    this.avgDensity
  });
  final String no;
  final String density1;
  final String density2;
  final String density3;
  final String avgDensity;
  bool selected = false;
}