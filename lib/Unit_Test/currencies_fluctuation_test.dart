import 'package:http/http.dart' as http;
import 'package:test/test.dart';
import '../Services/app_services.dart';

void main() {
  test(
    'Currencies Fluctuation Tests',
    () async {
      bool done = false;
      var fetch = await AppServices().getCurrenciesFluctuation(
        currency: "USD",
        startDate: "2022-05-15",
        endDate: "2023-05-15",
      );
      if (fetch.success) {
        done = true;
      }
      expect(done, true);
    },
  );
}
