import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dateTime;
  var timeStamp;
  var anotherDateTime;
  var newdatetime;

  var selectDate;
  var selectTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /*dateTime=DateTime.now();
    timeStamp=dateTime.millisecondsSinceEpoch;
   //  anotherDateTime=DateFormat('MM/dd/yyyy').format(dateTime);
    anotherDateTime=DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
    newdatetime=DateTime.parse(anotherDateTime);*/
    selectDate= DateTime.now();
    selectTime=TimeOfDay(hour: 23,minute: 23);
  }

  _selectDate(BuildContext context) async{
    final DateTime? picker=await showDatePicker(
        context: context,
        initialDate: selectDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
    if(picker !=null && picker !=selectDate)
      {
        setState(() {
          selectDate=picker;
        });
      }
  }

  _selectTime(BuildContext context) async{
    final TimeOfDay? picker=await showTimePicker(
        context: context,
       initialTime: selectTime);
    if(picker !=null && picker !=selectDate)
    {
      setState(() {
        selectTime=picker;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DatePicke & TimePicker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Center(child: Text('$newdatetime')),*/
           Text('${DateFormat("yyyy-MM-dd").format(selectDate)}'),
           ElevatedButton(onPressed: ()
               {_selectDate(context);}, child: Text("Select Date")),
            Text('${selectTime.hour} hour :${selectTime.minute} min' ),
            ElevatedButton(onPressed: ()
            {_selectTime(context);}, child: Text("Select Time"))
          ],
        ),
      ),
    );
  }
}



