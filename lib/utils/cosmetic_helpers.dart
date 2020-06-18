import 'dart:math';

double calculateOpacity(double currentPageValue){
  double safeValue = currentPageValue % 1;
  var x = safeValue.abs() * -1;
  var opacity = x < 0.9 ? (1 * x * x * x * x) : 1 - pow(-2 * x + 2, 4) / 2;
  
  if (opacity <= 0.0) {
    return 0.1;
  } else if (opacity >= 1.0) {
    return 1.0;
  } else {
    return opacity;
  }   
}