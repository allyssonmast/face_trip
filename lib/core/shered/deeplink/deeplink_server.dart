import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/routes/names_routes.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:injectable/injectable.dart';

import 'deeplink_entity.dart';

@injectable
class DeepLinkServer {
  Future<Either<Failure, Uri>> shareDynamic(DeepLinkEntity dynamic) async {
    try {
      final DynamicLinkParameters parameters = DynamicLinkParameters(
        uriPrefix: 'https://facetrip.com',
        link:
            Uri.parse('https://facetrip.com/$DETAILS_CONTACT?id=${dynamic.id}'),
        androidParameters: AndroidParameters(
          packageName: 'com.nobuteco.nobutecoapp',
          fallbackUrl: Uri.parse(
              "https://play.google.com/store/apps/details?id=com.nobuteco.nobutecoapp"),
          minimumVersion: 21,
        ),
        navigationInfoParameters:
            const NavigationInfoParameters(forcedRedirectEnabled: true),
        socialMetaTagParameters: SocialMetaTagParameters(
            title: dynamic.title,
            description: dynamic.body,
            imageUrl: dynamic.url != null ? Uri.parse(dynamic.url!) : null),
        iosParameters: IOSParameters(
            bundleId: 'com.facetrip.nobutecoapp',
            minimumVersion: '11',
            fallbackUrl:
                Uri.parse("https://apps.apple.com/app/id1598747869?mt=8")),
      );

      final ShortDynamicLink shortDynamicLink =
          await FirebaseDynamicLinks.instance.buildShortLink(parameters);
      return Right(shortDynamicLink.shortUrl);
    } catch (e) {
      return Left(Failure.serverError());
    }
  }
}
