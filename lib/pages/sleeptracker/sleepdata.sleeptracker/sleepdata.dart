class IndividualBar {
  final int x;
  final double y;

  IndividualBar({required this.x, required this.y});
}

class BarData {
  final double sunSleep;
  final double monSleep;
  final double tueSleep;
  final double wedSleep;
  final double thuSleep;
  final double friSleep;
  final double satSleep;

  BarData(
      {required this.sunSleep,
      required this.monSleep,
      required this.tueSleep,
      required this.wedSleep,
      required this.thuSleep,
      required this.friSleep,
      required this.satSleep});
}

List<IndividualBar> barData = [];
