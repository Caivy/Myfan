import 'package:url_launcher/url_launcher.dart';

Future<void> urllauncher(String url) async {
  await launch(
    url,
    forceSafariVC: false,
    forceWebView: false,
    headers: <String, String>{
      'my_header_key': 'my_header_value'
    },
  );
}
