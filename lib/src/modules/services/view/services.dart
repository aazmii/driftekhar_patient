import 'package:driftekhar_patient/src/modules/services/models/service.model.dart';
import 'package:flutter/material.dart';

import '../providers/services.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  int? _expandedIndex;
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
            return ListView.builder(
              itemBuilder: (_, index) {
                final service = snapshot.data![index];
                // return Placeholder();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    // collapsedBackgroundColor:
                    //     context.theme.scaffoldBackgroundColor,
                    // backgroundColor: context.theme.scaffoldBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // minTileHeight: 80,
                    leading: Image.asset(
                      width: 40,
                      // height: 10,
                      service.image ?? '',
                      fit: BoxFit.cover,
                    ),
                    key: Key('$index'),
                    title: Text(service.title ?? ''),
                    initiallyExpanded: _expandedIndex == index,
                    onExpansionChanged: (isExpanded) {
                      setState(() {
                        _expandedIndex = isExpanded ? index : null;
                      });
                    },
                    children: [
                      Text(service.description ?? ''),
                    ],
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          }
        },
      ),
    );
  }
}
