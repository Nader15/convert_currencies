import 'package:http/http.dart' as http;
import 'package:test/test.dart';
import '../Services/app_services.dart';

void main() {
  test(
    'Currencies Converter Tests',
    () async {
      bool done = false;
      var fetch = await AppServices().getCurrenciesConverter(
        fromCurrencyName: "USD",
        toCurrencyName: "EGP",
        amount: 1,
        date: "2023-05-15",
      );
      if (fetch.success) {
        done = true;
      }
      expect(done, true);
    },
  );
}
