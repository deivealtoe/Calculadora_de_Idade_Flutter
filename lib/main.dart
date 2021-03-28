import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(
      MaterialApp(
        localizationsDelegates: [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        title: 'Calculadora de Idade',
        home: FormAndLabels(),
      ),
    );

class FormAndLabels extends StatefulWidget {
  @override
  _FormAndLabelsState createState() {
    return _FormAndLabelsState();
  }
}

class _FormAndLabelsState extends State<FormAndLabels> {
  DateTime _birthdayDate;

  String _birthdayDateButtonText = 'Sua Data de Nascimento';

  int _timeAliveInDays = 0;
  int _timeAliveInHours = 0;
  int _timeAliveInMinutes = 0;
  int _timeAliveInSeconds = 0;
  int _timeAliveInMilliseconds = 0;
  int _timeAliveInMicroseconds = 0;

  Future<void> _getBirthdayDate() async {
    _birthdayDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now(),
        locale: Locale('pt', 'BR'));

    DateTime rightNow = new DateTime.now();

    _timeAliveInDays = rightNow.difference(_birthdayDate).inDays;
    _timeAliveInHours = rightNow.difference(_birthdayDate).inHours;
    _timeAliveInMinutes = rightNow.difference(_birthdayDate).inMinutes;
    _timeAliveInSeconds = rightNow.difference(_birthdayDate).inSeconds;
    _timeAliveInMilliseconds =
        rightNow.difference(_birthdayDate).inMilliseconds;
    _timeAliveInMicroseconds =
        rightNow.difference(_birthdayDate).inMicroseconds;

    _birthdayDateButtonText =
        '${_birthdayDate.day}/${_birthdayDate.month}/${_birthdayDate.year}';

    print('Birth date chosen: $_birthdayDateButtonText');

    setState(() {});
  }

  void _resetField() {
    _birthdayDateButtonText = 'Sua Data de Nascimento';

    _timeAliveInDays = 0;
    _timeAliveInHours = 0;
    _timeAliveInMinutes = 0;
    _timeAliveInSeconds = 0;
    _timeAliveInMilliseconds = 0;
    _timeAliveInMicroseconds = 0;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Calculadora de Idade',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                onPressed: _getBirthdayDate,
                child: Container(
                  padding: EdgeInsets.only(top: 13, bottom: 13),
                  color: Colors.orange,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          _birthdayDateButtonText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getTextLabeled('Dias: $_timeAliveInDays'),
                    getTextLabeled('Horas: $_timeAliveInHours'),
                    getTextLabeled('Minutos: $_timeAliveInMinutes'),
                    getTextLabeled('Segundos: $_timeAliveInSeconds'),
                    getTextLabeled('Milisegundos: $_timeAliveInMilliseconds'),
                    getTextLabeled('Microsegundos: $_timeAliveInMicroseconds'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 30,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.orange,
                  ),
                  onPressed: _resetField,
                  iconSize: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getTextLabeled(String labelString) {
  return Container(
    padding: EdgeInsets.only(left: 30, top: 25, bottom: 25),
    child: Text(
      '$labelString',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
  );
}
