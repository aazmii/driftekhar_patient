import 'package:driftekhar_patient/src/modules/chembers/providers/chembers.provider.dart';
import 'package:driftekhar_patient/src/modules/home/components/chember.tab/chember.container.dart';
import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChembersView extends ConsumerWidget {
  const ChembersView({super.key, this.title, this.onSelectChember});
  final String? title;
  final ValueSetter<Chember>? onSelectChember;

  @override

  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ref.watch(chembersProvider).when(
                  data: (chembers) => Expanded(
                    child: ListView(
                      children: chembers.map((e) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: InkWell(
                            onTap: () => onSelectChember?.call(e),
                            child: ChemberContainer(chember: e),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  error: (e, s) =>
                      const Center(child: Text('Could not get chember data')),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
          ],
        ),
      ),
    );
  }
}
