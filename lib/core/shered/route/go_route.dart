import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

class GoTo {
  void route(BuildContext context, PageRouteInfo route) async {
    await AutoRouter.of(context).push(route);
  }
  void back(BuildContext context){
    AutoRouter.of(context).back();
  }
}
