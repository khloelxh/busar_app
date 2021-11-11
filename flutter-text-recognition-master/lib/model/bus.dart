import 'package:meta/meta.dart';

class Bus {
  Bus({
    @required this.busStop;
    @required this.busService;
});

  final BusStop busStop;
  final BusService busService;

}