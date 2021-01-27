import 'dart:math';

class Calculate {
  int height, weight;
  double bmi;

  Calculate(this.weight, this.height);

  String calculateBMI(){
    bmi = weight / pow(height / 100, 2);
    return bmi.round().toString();
  }

  String getOutcome() {
    if ( bmi <= 16.0)
      return 'Wygłodzenie';
    else if (16.0  <= bmi && bmi <= 16.9)
      return 'Wychudzenie';
    else if(17  <= bmi && bmi <= 18.4)
      return'Niedowaga';
    else if (18.5  <= bmi && bmi <= 24.9)
      return'Waga prawidłowa';
    else if (bmi >= 25.0 && bmi <= 29.9)
      return 'Nadwaga';
    else if (bmi >= 30.0 && bmi <= 34.9)
      return'Otyłość 1 stopnia';
    else if(bmi >= 35.0 && bmi <= 39.9)
      return'Otyłość 2 stopnia';
    else
      return'Otyłość 3 stopnia';
  }



  String getDesc() {
    if (bmi >= 25.0) {
      return 'Twoje BMI jest zbyt duże. Postaraj się więcej ćwiczyć.';
    } else if (bmi >= 18.5) {
      return 'Masz odpowidnią masę ciała. Tak trzymaj!';
    } else {
      return 'Ważysz zdecydowanei za mało! Postraj się więcej jeść.';
    }
  }




}