import 'package:http/http.dart' as http;
import 'package:test/test.dart';
import '../Services/app_services.dart';

void main() {
  test(
    'Currencies Symbols Tests',
    () async {
      bool done = false;
      var fetch = await AppServices().getCurrenciesSymbols();
      if (fetch.success) {
        done = true;
      }
      expect(done, true);
    },
  );
}
