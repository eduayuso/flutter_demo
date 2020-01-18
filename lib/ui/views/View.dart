import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_demo/ui/models/ViewModel.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class View<T extends ViewModel> extends StatefulWidget {

  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;

  View({this.builder, this.onModelReady});

  @override
  ViewState<T> createState() => ViewState<T>();
}

class ViewState<T extends ViewModel> extends State<View<T>> {

  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<T>(
        create: (context) => model,
        child: Consumer<T>(builder: widget.builder));
  }
}