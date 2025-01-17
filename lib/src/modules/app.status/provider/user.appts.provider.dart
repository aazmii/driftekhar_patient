import 'dart:developer';

import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:driftekhar_patient/src/db/hive.dart';
import 'package:driftekhar_patient/src/modules/app.status/service/appt.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.appts.provider.g.dart';

@Riverpod(keepAlive: true)
class UserAppts extends _$UserAppts {
  @override
  Future<List<Appointment>> build() async {
    final appts = await getAllAndProcess();
    return appts;
  }

  Future refresh() async {
    state = const AsyncLoading();
    final appts = await getAllAndProcess();
    state = AsyncData(appts);
  }

  Future<List<Appointment>> getAllAndProcess() async {
    final ids = apptsBox.values.toList();
    log('${ids.length} appointment id', name: 'hive');
    try {
      final list = [
        ...await ApptService.getAllFromCollection(
            AppointmentService.reqeusted, ids),
        ...await ApptService.getAllFromCollection(
            AppointmentService.approved, ids)
      ];

      // remove expired ids form hive
      await removeNonExistantIds(ids, list);
      return list;
    } catch (e) {
      rethrow;
    }
  }

  Future removeNonExistantIds(List<String> ids, List<Appointment> appts) async {
    for (var id in ids) {
      if (!apptsBox.containsKey(id)) log('deliting $id', name: 'hive');
      if (!apptsBox.containsKey(id)) apptsBox.delete(id);
    }
  }

  Future<List<Appointment>> getAllAppts() async {
    final ids = apptsBox.values.toList();
    final requesteds = await ApptService.getAllFromCollection(
        AppointmentService.reqeusted, ids);
    final approved = await ApptService.getAllFromCollection(
        AppointmentService.approved, ids);
    return [...approved, ...requesteds];
  }
}
