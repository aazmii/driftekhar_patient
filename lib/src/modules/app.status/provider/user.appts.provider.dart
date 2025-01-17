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

  /// Gets all appointments from hive and fetches the associated data from
  /// firestore. Removes any expired or non-existent ids from hive.
  ///
  /// The order of the returned list is first the requested then the approved
  /// appointments.
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
      await _removeNonExistantIds(ids, list);
      return list;
    } catch (e) {
      rethrow;
    }
  }

  Future add(Appointment appt) async {
    // await apptsBox.put(appt.id, appt.id!);
    log('added ${appt.id} to hive', name: 'hive');
    state = const AsyncLoading();
    state = AsyncData(state.value!..add(appt));
  }

  Future _removeNonExistantIds(
      List<String> ids, List<Appointment> appts) async {
    for (var id in ids) {
      if (!apptsBox.values.contains(id)) {
        apptsBox.delete(id);
        log('removed $id from hive', name: 'hive');
      }
    }
  }

  // Future<List<Appointment>> _getAllAppts() async {
  //   final ids = apptsBox.values.toList();
  //   final requesteds = await ApptService.getAllFromCollection(
  //       AppointmentService.reqeusted, ids);
  //   final approved = await ApptService.getAllFromCollection(
  //       AppointmentService.approved, ids);
  //   return [...approved, ...requesteds];
  // }
}
