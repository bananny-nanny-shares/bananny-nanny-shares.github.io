import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:gh_bananny/ui_fake.dart' if (dart.library.html) 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find a Family for your Nanny Share - Bananny.org',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x00ffcc33)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Bananny is a nonprofit making nanny shares easier'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    ui.platformViewRegistry.registerViewFactory("webView", (int viewId) {
      html.IFrameElement element = html.IFrameElement();
      element.src = 'https://docs.google.com/forms/d/e/1FAIpQLSe9Xa8b5vcRdtf5Ue7CrRrLNG8UI2YWP67Hbspt0keufwhmtQ/viewform?usp=sf_link';
      element.style.border = 'none';
      return element;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: HtmlElementView(viewType: "webView"),
      ),
    );
  }
}
