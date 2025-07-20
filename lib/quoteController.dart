import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Quote {
  final String content;
  final String author;

  Quote({required this.content, required this.author});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      content: json['q'] ?? '',
      author: json['a'] ?? '',
    );
  }
}

class QuoteController extends GetxController {
  var quote = ''.obs;
  var author = ''.obs;
  var isLoading = false.obs;

  Future<void> fetchQuotes() async {
    try {
      isLoading.value = true;

      final url = Uri.parse('https://zenquotes.io/api/random');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        final q = Quote.fromJson(data[0]);

        quote.value = q.content;
        author.value = q.author;
      } else {
        quote.value = 'Failed to load quote';
        author.value = '';
      }
    } catch (e) {
      quote.value = 'Something went wrong';
      author.value = '';
    } finally {
      isLoading.value = false;
    }
  }
}
