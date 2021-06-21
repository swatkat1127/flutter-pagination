import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Connection {
  static void check() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      Fluttertoast.showToast(msg: 'online');
    } else if (connectivityResult == ConnectivityResult.wifi) {
      Fluttertoast.showToast(msg: 'online');
    } else {
      Fluttertoast.showToast(msg: 'check your internet connection');
    }
  }
}
