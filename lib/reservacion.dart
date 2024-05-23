import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:proyecto_hoteles/constantes.dart' as cons;

class Reservacion extends StatefulWidget {
  final Map<String, dynamic> dataHotel;
  const Reservacion({required this.dataHotel, Key? key}) : super(key: key);

  @override
  State<Reservacion> createState() => _ReservacionState();
}

class _ReservacionState extends State<Reservacion> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _startDate = '';
  String _endDate = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
        _startDate = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)}';
        _endDate =
            '${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MaterialApp(
        home: Scaffold(
            body: Stack(
      children: [
        Column(
          children: [
            Container(
              height: size.height * 0.1,
              color: cons.blanco,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text(
                      'Nombre_APP',
                      style: TextStyle(
                          color: cons.gris,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Image(
                    image: AssetImage('imagenes/logo.png'),
                    height: 60,
                  ),
                ],
              ),
            ),
            Container(
              color: cons.colorPrincipal,
              height: 5,
            ),
            Column(
              children: [
                Text(
                  "${widget.dataHotel['name']}",
                  style: TextStyle(
                      color: cons.gris,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  "Selecciona un rango de fechas", style: TextStyle(fontSize: 20),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SfDateRangePicker(
                    onSelectionChanged: _onSelectionChanged,
                    selectionMode: DateRangePickerSelectionMode.range,
                    headerStyle: DateRangePickerHeaderStyle(
                      backgroundColor: cons.colorPrincipal,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: cons.blanco,
                    selectionColor: cons.colorPrincipal,
                    startRangeSelectionColor: cons.colorPrincipal,
                    endRangeSelectionColor: cons.colorPrincipal,
                    rangeSelectionColor: cons.colorSecundario.withOpacity(0.5),
                    monthCellStyle: DateRangePickerMonthCellStyle(
                      textStyle: TextStyle(color: Colors.black),
                      todayTextStyle: TextStyle(color: cons.colorPrincipal),
                      leadingDatesTextStyle: TextStyle(color: Colors.grey),
                      trailingDatesTextStyle: TextStyle(color: Colors.grey),
                    ),
                    //showActionButtons: true,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  width: size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Incio: $_startDate\nFin: $_endDate', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    ],
                  ),
                )
                ,
              ],
            )
          ],
        )
      ],
    )));
  }
}
