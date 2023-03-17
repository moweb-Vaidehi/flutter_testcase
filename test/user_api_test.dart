import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testcase/repository/api_provider.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_testcase/model/item_model.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('ApiProvider tests', () {
    late ApiProvider apiProvider;
    late http.Client httpClient;

    setUp(() {
      httpClient = MockHttpClient();
      apiProvider = ApiProvider(client: httpClient);
    });

    test('Returns success', () async {
      const responseBody =
          '{"userId": 1, "id": 1, "title": "Test Title", "body": "Test Body"}';
      final response = http.Response(responseBody, 200);

      when(() => httpClient
              .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1")))
          .thenAnswer((_) async => response);

      final result = await apiProvider.fetchPosts();

      expect(result, isA<ItemModel>());
      expect(result.userId, 1);
      expect(result.title, "Test Title");
    });

    test('throws an Exception ', () async {
      when(() => httpClient
              .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1")))
          .thenThrow(Exception("Failed to load data"));

      expect(() => apiProvider.fetchPosts(), throwsException);
    });
  });

  //thenReturn
  //thenThrow
  //thenAnswer
  //when(mockCalculator.add(1, 2)).thenReturn(3);
}
