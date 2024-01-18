import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../generated/l10n.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultsPage({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         elevation: 0,
         centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('BMI CALCULATOR',
        
            style: TextStyle(
              fontFamily: S.of(context).fontFamily,
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                S.of(context).yourResult,
                style: TextStyle(
                  fontFamily: S.of(context).fontFamily,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      bmiResult,
                      style: TextStyle(
                        fontSize: 50.0,
                        fontFamily: S.of(context).fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      resultText,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 22.0,
                        fontFamily: S.of(context).fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: S.of(context).fontFamily,
                        fontSize: 22.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.scaffoldBackgroundColor,
                backgroundColor:AppColors.bodySmallTextColor,
                padding: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                S.of(context).recalculate,
                style: TextStyle(
                  fontFamily: S.of(context).fontFamily,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
