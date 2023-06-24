import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myBMI',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key : key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var weightController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var bgcolor = Colors.white;
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Your BMI App')),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style:TextStyle(fontSize: 34, fontWeight: FontWeight.w900,)),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your weight in kilograms',
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: ftController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your Height in feet',
                    prefixIcon: Icon(Icons.height),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: inController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your Height in inches',
                    prefixIcon: Icon(Icons.height),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: (){
                  var wt = weightController.text.toString();
                  var ft = ftController.text.toString();
                  var inc = inController.text.toString();

                  if(wt!="" && ft!="" && inc!="")
                    {
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iinc = int.parse(inc);

                      var tinch = (ift*12) + iinc;
                      var tcm = tinch*2.54;
                      var tm = tcm/100;

                      var bmi = iwt/(tm*tm);

                      var msg="";
                      if (bmi>25){
                        msg = "You are overweight!!";
                        bgcolor = Colors.red.shade700;
                      }else if (bmi<18){
                        msg = "You are underweight!!";
                        bgcolor = Colors.red.shade200;
                      }else{
                        msg = "You are healthy!!";
                        bgcolor = Colors.green.shade400;
                      }

                      setState(() {
                        result = "$msg \nYour BMI is : ${bmi.toStringAsFixed(2)}";
                      });
                    }
                  else
                    {
                      setState(() {
                        result = "Please fill all the required blanks!!";
                      });
                    }
                }, child: Text('Calculate BMI'),),
                SizedBox(
                  height: 20,
                ),
                Text(result, style: TextStyle(fontSize: 20,),),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
