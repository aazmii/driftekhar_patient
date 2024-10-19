
import 'package:doc_appointment/src/models/social.link.model/social.link.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'social.link.providers.g.dart';


@riverpod
List<SocialLink> socialLinksP(SocialLinksPRef ref) => socialLinks;

final socialLinks = <SocialLink>[
  SocialLink(
    name: 'youtube',
    link: 'https://youtube.com',
    icon: 'youtube',
  ),
  SocialLink(
    name: 'insta',
    link: 'https://instagram.com',
    icon: 'insta',
  ),
  SocialLink(
    name: 'snap',
    link: 'https://snapchat.com',
    icon: 'snap',
  ),
  SocialLink(
    name: 'tiktok',
    link: 'https://tiktok.com',
    icon: 'tiktok',
  ),
  SocialLink(
    name: 'whatsapp',
    link: 'https://whatsapp.com',
    icon: 'whatsapp',
  ),
];
