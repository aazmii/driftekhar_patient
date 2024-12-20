import 'package:com.codeconnect.driftekhar.patient/src/extensions/extensions.dart';
import 'package:com.codeconnect.driftekhar.patient/src/modules/create.appointment/view/components/custom.bottom.bar.dart';
import 'package:flutter/material.dart';

class OnlineConsultationPage extends StatelessWidget {
  const OnlineConsultationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consultation Request"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DoctorInfo(),
              const SizedBox(height: 20),
              AppointmentForma(),
              const SizedBox(height: 20),
              // const SubmitButton(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PayAndConfimButton(
        fee: 700,
        confirmText: 'Request Appointment',
        onConfirm: () {},
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                height: 60,
                width: 60,
                'https://driftekharalam.com/wp-content/uploads/2024/09/IF.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
                loadingBuilder: (context, child, loadingProgress) =>
                    loadingProgress == null
                        ? child
                        : const CircularProgressIndicator(),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Dr. Md. Iftekhar Alam",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  "Orthopedic & Trauma Surgeon",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentForma extends StatefulWidget {
  @override
  _AppointmentFormState createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForma> {
  String? selectedGender;
  List<String> genderOptions = ['Male', 'Female', 'Other'];
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  TextEditingController reasonController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Date",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              selectedDate == null
                  ? "Select Date"
                  : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text("Select Time",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _selectTime(context),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              selectedTime == null
                  ? "Select Time"
                  : "${selectedTime!.format(context)}",
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text("Reason for Consultation",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          controller: reasonController,
          maxLines: 3,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Describe your symptoms or reason",
          ),
        ),
      ],
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Handle submission logic here
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Appointment Requested")),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: context.theme.primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        ),
        child: const Text(
          "Request Appointment",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
