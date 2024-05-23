import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_hoteles/database_helper.dart';
import 'package:proyecto_hoteles/detalles.dart';
import 'package:proyecto_hoteles/main.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:proyecto_hoteles/constantes.dart' as cons;

class Reservacion extends StatefulWidget {
  final Map<String, dynamic> dataUser;
  final Map<String, dynamic> dataHotel;

  const Reservacion({required this.dataHotel, required this.dataUser, Key? key}) : super(key: key);

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
  String? _selectedRoomType;
  String _roomPrice = '';

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
    int _availavilityS = widget.dataHotel['availavilityS'];
    int _availavilityD = widget.dataHotel['availavilityD'];

    print(widget.dataUser);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
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
                            fontWeight: FontWeight.bold,
                          ),
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
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      "Selecciona un rango de fechas",
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
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
                        rangeSelectionColor:
                        cons.colorSecundario.withOpacity(0.5),
                        monthCellStyle: DateRangePickerMonthCellStyle(
                          textStyle: TextStyle(color: Colors.black),
                          todayTextStyle: TextStyle(color: cons.colorPrincipal),
                          leadingDatesTextStyle: TextStyle(color: Colors.grey),
                          trailingDatesTextStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Text(
                      'Inicio: $_startDate --- Fin: $_endDate',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      "Selecciona el tipo de habitación",
                      style: TextStyle(fontSize: 20),
                    ),
                    DropdownButton<String>(
                      value: _selectedRoomType,
                      items: <String>['Sencilla', 'Doble'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text("Selecciona el tipo de habitación"),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedRoomType = newValue!;
                          _roomPrice = newValue == 'Sencilla'
                              ? widget.dataHotel['priceS'].toString()
                              : widget.dataHotel['priceD'].toString();
                        });
                      },
                    ),
                    if (_selectedRoomType != null)
                      Text(
                        "Precio $_roomPrice",
                        style: TextStyle(fontSize: 18),
                      ),
                    SizedBox(height: size.height * 0.02),
                    ElevatedButton(
                      onPressed: () async {
                        if (_selectedRoomType != null &&
                            _startDate.isNotEmpty &&
                            _endDate.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Reservación confirmada para habitación $_selectedRoomType del $_startDate al $_endDate'),
                            ),
                          );
                          print(widget.dataUser);
                          Map<String, dynamic> reservacionRow = {
                            ReservacionTableHelper.columnHotelId: widget.dataHotel['_id'],
                            ReservacionTableHelper.columnUserId: widget.dataUser['_id'],
                            ReservacionTableHelper.columnFechaInicio: _startDate,
                            ReservacionTableHelper.columnFechaFin: _endDate,
                            ReservacionTableHelper.columnTipoHabitacion: _selectedRoomType,
                            ReservacionTableHelper.columnActiva: 1,
                          };

                          _selectedRoomType=='Sencilla' ? _availavilityS-- : _availavilityD--;
                          Map<String, dynamic> hotelRow = {
                            HotelTableHelper.columnId: widget.dataHotel['_id'],
                            HotelTableHelper.columnAvailabilityS: _availavilityS,
                            HotelTableHelper.columnAvailabilityD: _availavilityD,
                          };
                          try {
                            final reservacionId = await reservacionDBHelper.insert(reservacionRow);
                            debugPrint('inserted row id: $reservacionId');

                            final hotelId = await hotelDBHelper.update(hotelRow);
                            debugPrint('inserted row id: $hotelId');

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Detalles(dataHotel: widget.dataHotel, dataUser: widget.dataUser,)));


                          } catch (e) {
                            debugPrint('Error inserting reservation: $e');
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Por favor selecciona el tipo de habitación y las fechas'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cons.colorPrincipal,
                      ),
                      child: Text(
                        'Confirmar Reservación',
                        style: TextStyle(
                          color: cons.blanco,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
