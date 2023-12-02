String calculateBMI(double height, int weight) {
  double heightInMeters = height / 100;
  double bmi = weight / (heightInMeters * heightInMeters);
  return bmi.toStringAsFixed(1);
}

String getResult(String bmi) {
  double bmiValue = double.parse(bmi);
  if (bmiValue < 18.5) {
    return 'Underweight';
  } else if (bmiValue < 24.9) {
    return 'Normal';
  } else if (bmiValue < 29.9) {
    return 'Overweight';
  } else {
    return 'Obese';
  }
}

String getInterpretation(String bmi) {
  double bmiValue = double.parse(bmi);
  if (bmiValue < 18.5) {
    return 'You have a lower than normal body weight. Try to eat a bit more and make eat some snack from our snacks recipes in our application .';
  } else if (bmiValue < 24.9) {
    return 'You have a normal body weight. Keep it up And Make Some Healty food from the recipes in OUR Application!';
  } else if (bmiValue < 29.9) {
    return 'You have a higher than normal body weight. Try to exercise more From OUR Application.';
  } else {
    return 'You have an obese body weight. It\'s important to consult with a healthcare professional From OUR Application.';
  }
}