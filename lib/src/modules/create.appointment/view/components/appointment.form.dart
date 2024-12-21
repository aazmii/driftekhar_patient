import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:driftekhar_patient/src/modules/create.appointment/providers/new.appointment.provider.dart';
import 'package:driftekhar_patient/src/modules/create.appointment/providers/patient.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppointmentForm extends ConsumerWidget {
  const AppointmentForm({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final patientNotifier = ref.watch(patientProvider.notifier);
    // final apptNotifier = ref.watch(newAppointmentProvider.notifier);
    // final selectedDt =
    //     ref.watch(newAppointmentProvider.select((v) => v.dateTime));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 10.toHeight,
          const TextWithAstrics('Phone Number'),
          TextField(
            onChanged: (phone) => patientNotifier.setPhone = phone,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              prefix: Text('+88'),
              // hintText: 'Phone Number',
              // label: TextWithAstrics('Phone Number'),
            ),
          ),
          10.toHeight,
          const TextWithAstrics('Patient Name'),
          TextField(
            onChanged: (name) => patientNotifier.setName = name,
          ),
          10.toHeight,
          const TextWithAstrics('Age'),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (age) =>
                      patientNotifier.setAge = int.tryParse(age),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              5.toWidth,
              const Text('Y/O'),
            ],
          ),
          10.toHeight,
          const TextWithAstrics('Gender'),
          const GenderPicker(),
          10.toHeight,
          //
          // Row(
          //   children: [
          //     const Icon(Icons.calendar_month),
          //     8.toWidth,
          //     Text('Select Visit Time', style: context.text.titleMedium),
          //     20.toWidth,
          //     TextButton(
          //       onPressed: () async {
          //         final dateTime = await showDateTimePicker(context: context);
          //         if (dateTime == null) return;
          //         apptNotifier.setTime = dateTime;
          //       },
          //       child: Text(
          //           selectedDt != null ? selectedDt.toDateAndTime : 'Select'),
          //     ),
          //   ],
          // ),
          const TextWithAstrics('Type'),
          const VisitTypePicker(),
        ],
      ),
    );
  }
}

class VisitTypePicker extends ConsumerWidget {
  const VisitTypePicker({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final newAppt = ref.watch(newAppointmentProvider);
    // const types = AppointmentType.values;

    return SizedBox(
      width: context.isTabletWidth ? context.width * 0.4 : context.width,
      child: SegmentedButton<AppointmentType>(
        showSelectedIcon: false,
        style: ButtonStyle(
          padding:
              WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 20)),
          backgroundColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> state) {
            if (state.contains(WidgetState.selected)) {
              return context.theme.primaryColor;
            }
            return Colors.white;
          }),
          foregroundColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> state) {
            if (state.contains(WidgetState.selected)) {
              return Colors.white;
            }
            return context.theme.primaryColor;
          }),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        segments: const [
          ButtonSegment<AppointmentType>(
            value: AppointmentType.firstTime,
            label: Text('New'),
            // icon: const Icon(Icons.male),
          ),
          ButtonSegment<AppointmentType>(
            value: AppointmentType.followUp,
            label: Text('Follow-Up'),
            // icon: const Icon(Icons.female),
          ),
          ButtonSegment<AppointmentType>(
            value: AppointmentType.report,
            label: Text('Report'),
            // icon: const Icon(Icons.other_houses),
          ),
        ],
        selected: {newAppt.type!},
        onSelectionChanged: (type) => ref
            .read(newAppointmentProvider.notifier)
            .update(newAppt.copyWith(type: type.first)),
        // onSelectionChanged: (type) => ref
        //     .read(newAppointmentProvider.notifier)
        //     .update(newAppt.copyWith(type: type.first)),
      ),
    );
  }
}

class GenderPicker extends StatefulWidget {
  const GenderPicker({super.key});

  @override
  GenderPickerState createState() => GenderPickerState();
}

class GenderPickerState extends State<GenderPicker> {
  String? selectedGender; // Stores the selected gender option
  List<String> genderOptions = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.isTabletWidth ? context.width * 0.4 : context.width,
      child: SegmentedButton(
        showSelectedIcon: false,
        style: ButtonStyle(
          padding:
              WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 20)),
          backgroundColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> state) {
            if (state.contains(WidgetState.selected)) {
              return context.theme.primaryColor;
            }
            return Colors.white;
          }),
          foregroundColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> state) {
            if (state.contains(WidgetState.selected)) {
              return Colors.white;
            }
            return context.theme.primaryColor;
          }),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        segments: const [
          ButtonSegment<String>(
            value: 'Male',
            label: Text('Male'),
            // icon: const Icon(Icons.male),
          ),
          ButtonSegment<String>(
            value: 'Female',
            label: Text('Female'),
            // icon: const Icon(Icons.female),
          ),
          ButtonSegment<String>(
            value: 'Other',
            label: Text('Other'),
            // icon: const Icon(Icons.other_houses),
          ),
        ],
        selected: {selectedGender},
        onSelectionChanged: (value) {
          setState(() {
            selectedGender = value.first;
          });
        },
      ),
    );
  }
}

class TextWithAstrics extends StatelessWidget {
  const TextWithAstrics(this.label, {super.key});
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          const SizedBox(width: 5),
          Text(label ?? ''),
        ],
        const Text(
          '*',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
