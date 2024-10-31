import 'package:doc_appointment/src/modules/patient.modules/services/models/service.model.dart';
import 'package:flutter/services.dart';

// Future<List<Service>> getServicesWithDescriptions() async {
//   List<Service> servicesWithDescription = [];

//   // Use Future.wait to handle async operations in parallel
//   await Future.wait(services.map((s) async {
//     String path = 'assets/texts/services/${s.description}.txt';
//     Service updatedService =
//         s.copyWith(description: await loadServiceDescription(path));
//     servicesWithDescription.add(updatedService);
//   }));

//   return servicesWithDescription;
// }

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
  Service(title: 'কোমর ব্যথা', description: 'low.back.pain'),
  Service(title: 'মেরুদন্ডের ডিস্কজনিত ব্যথা', description: 'disc.pain'),
  Service(title: 'হাঁটু ব্যথা', description: 'knee.pain'),
  Service(title: 'জোঁড়া/অস্থিসন্ধির ব্যথা', description: 'joint.pain'),
  Service(title: 'খেলাধুলাজনিত আঘাত', description: 'sports.injury'),
  Service(title: 'বাতজনিত ব্যথা', description: 'arthritis.pain'),
  Service(title: 'হাত-পায়ের আঘাতজনিত সমস্যা', description: 'injury'),
  Service(title: 'ঘাড় ও কাঁধ ব্যথা', description: 'shoulder.paint'),
];
