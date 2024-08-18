import 'package:bmi_calculator/bmi_provider%20data.dart';
import 'package:bmi_calculator/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  bool isMale = false;

  @override
  Widget build(BuildContext context) {

    var bmiProvider = Provider.of<BMIProviderData>(context);

    return Scaffold(
      backgroundColor: darkScaffoldColor,
      appBar: AppBar(
        backgroundColor: darkScaffoldColor,
        centerTitle: true,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12,),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: InkWell(
                      onTap: () {
                        isMale = true;
                        setState(() {});
                      },
                      child: Card(
                        color: isMale ? Colors.teal : darkCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 80,
                              color: Colors.white,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: GestureDetector(
                      onTap: () {
                        isMale = false;
                        setState(() {});
                      },
                      child: Card(
                        color: isMale ? darkCardColor : Colors.teal,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 80,
                              color: Colors.white,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 16),
                color: darkCardColor,
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Height",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "${bmiProvider.height} cm",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      Slider(
                          min: 90,
                          max: 225,
                          value: bmiProvider.height.toDouble(),
                          onChanged: (value) {
                            bmiProvider.changeHeight(value.toInt());
                          }),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                      flex: 10,
                      child: Card(
                        color: darkCardColor,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Weight',
                                style: TextStyle(
                                    fontSize: 25, color: textColorDark2),
                              ),
                              Text(
                                '${bmiProvider.weight}',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      bmiProvider.decrementWeight();
                                    },
                                    backgroundColor: Colors.white,
                                    mini: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80),
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                     bmiProvider.incrementWeight();
                                    },
                                    backgroundColor: Colors.white,
                                    mini: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 10,
                      child: Card(
                        color: darkCardColor,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Age',
                                style: TextStyle(
                                    fontSize: 25, color: textColorDark2),
                              ),
                              Text(
                                '${bmiProvider.age}',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      bmiProvider.decrementAge();
                                    },
                                    backgroundColor: Colors.white,
                                    mini: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80),
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      bmiProvider.incrementAge();
                                    },
                                    backgroundColor: Colors.white,
                                    mini: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(height: 12,),
            MaterialButton(
              onPressed: (){
                bmiProvider.calculateBMI();

                showDialog(context: context, builder: (BuildContext context){
                  return Dialog(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Your BMI is ${bmiProvider.bmi.toStringAsFixed(2)}'),
                          Text('Your are ${bmiProvider.suggation}'),
                        ],
                      ),
                    ),
                  );
                });
              },
              height: 50,
              minWidth: double.infinity,
              color: Colors.teal,
              child: Text('Calculator', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}
