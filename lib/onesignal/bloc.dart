import 'package:onesignal_flutter/onesignal_flutter.dart';

class BlocHome {
  void initOneSignal() {
    OneSignal.shared.init("29c0fefe-e1a3-4f21-887b-f403ef8bc506");
    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.none);
  }
}
