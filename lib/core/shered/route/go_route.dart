import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

class GoTo {
  void route(BuildContext context, String route) async {
    await AutoRouter.of(context).pushNamed(route);
  }

  void replace(BuildContext context, String route) async {
    await AutoRouter.of(context).replaceNamed(route);
  }

  void back(BuildContext context) {
    AutoRouter.of(context).back();
  }
}
