import 'package:doc_appointment/src/gen/assets.gen.dart';
import 'package:doc_appointment/src/modules/home/components/services/models/service.model.dart';
import 'package:flutter/services.dart';

Future<List<Service>> getServicesWithDescriptions() async {
  List<Service> servicesWithDescription = [];
  await Future.forEach(services, (s) async {
    String path = 'assets/texts/services/${s.description}.txt';
    servicesWithDescription
        .add(s.copyWith(description: await loadServiceDescription(path)));
  });

  return servicesWithDescription;
}

Future<String> loadServiceDescription(String path) async {
  return await rootBundle.loadString(path);
}

final services = [
  Service(
    title: 'কোমর ব্যথা',
    description: 'low.back.pain',
    image: Assets.images.service.lowback.path,
  ),
  Service(
      title: 'মেরুদন্ডের ডিস্কজনিত ব্যথা',
      description: 'disc.pain',
      image: Assets.images.service.slippedDisc.path),
  Service(
      title: 'হাঁটু ব্যথা',
      description: 'knee.pain',
      image: Assets.images.service.knee.path),
  Service(
    title: 'জোঁড়া/অস্থিসন্ধির ব্যথা',
    description: 'joint.pain',
    image: Assets.images.service.jointPain.path,
  ),
  Service(
    title: 'খেলাধুলাজনিত আঘাত',
    description: 'sports.injury',
    image: Assets.images.service.sportsInjury.path,
  ),
  Service(
    title: 'বাতজনিত ব্যথা',
    description: 'arthritis.pain',
    image: Assets.images.service.arthritis.path,
  ),
  Service(
    title: 'হাত-পায়ের আঘাতজনিত সমস্যা',
    description: 'injury',
    image: Assets.images.service.injury.path,
  ),
  Service(
    title: 'ঘাড় ও কাঁধ ব্যথা',
    description: 'shoulder.paint',
    image: Assets.images.service.shoulder.path,
  ),
];
