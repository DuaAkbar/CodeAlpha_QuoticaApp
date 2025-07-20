import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotica/quoteController.dart';

class Quotescreen extends StatefulWidget {
  const Quotescreen({super.key});

  @override
  State<Quotescreen> createState() => _QuotescreenState();
}

class _QuotescreenState extends State<Quotescreen> {
  final QuoteController quoteController = Get.put(QuoteController());

  @override
  void initState() {
    super.initState();
    quoteController.fetchQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          "Quotica",
          style: TextStyle(
            fontFamily: 'DancingScript',
            fontWeight: FontWeight.w500,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Obx(() {
            if (quoteController.isLoading.value) {
              return CircularProgressIndicator();
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '"${quoteController.quote.value}"',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'DancingScript',
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 16),

                Text(
                  "- ${quoteController.author.value}",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'DancingScript',
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 32),

                SizedBox(
                  width: 160,
                  height: 48,
                  child: TextButton(
                    onPressed: () {
                      quoteController.fetchQuotes();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Generate",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),

                SizedBox(height: 150),

                Text(
                  "Powered by ZenQuotes API",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
