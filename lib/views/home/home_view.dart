import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization_task/views/home/home_controller.dart';
import 'package:localization_task/views/home/widgets/dropdown_widget.dart';

class HomeView extends StatefulWidget {
  final Function setLocale;

  const HomeView({super.key, required this.setLocale});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomeController(context: context, setLocale: widget.setLocale);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _controller.translate('hello')!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              LanguageDropdown(controller: _controller),
            ],
          ),
        ),
      ),
    );
  }
}
