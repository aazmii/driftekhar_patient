import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/services/models/service.model.dart';
import 'package:flutter/material.dart';

import '../providers/services.dart';
import 'components/service.detail.page.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Services'),
      ),
      body: FutureBuilder<List<Service>>(
        future: getServicesWithDescriptions(),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => context.push(ServiceDetailPage(service: snapshot.data![index])),
                    child: Card(
                      child: Column(
                        children: [
                          Expanded(
                              child: Hero(
                                  tag: snapshot.data![index].image ?? '',
                                  child: Image.asset(snapshot.data![index].image ?? '', fit: BoxFit.cover))),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              snapshot.data![index].title ?? '',
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
