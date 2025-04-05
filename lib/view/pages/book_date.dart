import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/custom_button.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  TextEditingController notesController = TextEditingController();
  bool isVideoConsultation = false;
  bool isLongPressed = false;

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: context
                  .read<ThemeBloc>()
                  .state
                  .color, // header background color
              onPrimary: Colors.white, // header text color
              onSurface:
                  context.read<ThemeBloc>().state.color, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor:
                    context.read<ThemeBloc>().state.color, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: context
                  .read<ThemeBloc>()
                  .state
                  .color, // header background color
              onPrimary: Colors.white, // header text color
              onSurface:
                  context.read<ThemeBloc>().state.color, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor:
                    context.read<ThemeBloc>().state.color, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _confirmBooking() {
    if (selectedDate == null || selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Select Date And Time"),
        ),
      );
      return;
    }

    String formattedDate = intl.DateFormat('yyyy-MM-dd').format(selectedDate!);
    String formattedTime = selectedTime!.format(context);
    String notes = notesController.text;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: state.color,
            elevation: 0.0,
            leading: Directionality(
              textDirection: CacheHelper.getData(key: 'languageCode') == 'ar'
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.white,
                iconSize: 22.0,
                icon: CacheHelper.getData(key: 'languageCode') == 'ar'
                    ? const Icon(
                        Icons.arrow_forward_ios_rounded,
                      )
                    : const Icon(
                        Icons.arrow_back_ios_new_rounded,
                      ),
              ),
            ),
            toolbarHeight: 75.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
            titleSpacing: 0.0,
            leadingWidth: 65.0,
            title: const Text(
              "Booking Date",
              overflow: TextOverflow.visible,
              softWrap: true,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                CustomButton(
                  width: fullWidth(context),
                  context: context,
                  primaryColor: state.color,
                  hasChild: true,
                  onPressed: () => _selectDate(context),
                  child: Text(
                    selectedDate == null
                        ? "Select Date"
                        : intl.DateFormat('yyyy-MM-dd').format(selectedDate!),
                    style: TextStyle(
                      color: state.color,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                CustomButton(
                  width: fullWidth(context),
                  context: context,
                  primaryColor: state.color,
                  hasChild: true,
                  onPressed: () => _selectTime(context),
                  child: Text(
                    selectedTime == null
                        ? "Select Time"
                        : selectedTime!.format(context),
                    style: TextStyle(
                      color: state.color,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 26.0,
                ),
                const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Notes For Doctor :",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  style: TextStyle(
                    color: state.color,
                    // fontFamily: checkTextFont(workplace.text),
                  ),
                  cursorWidth: 1.0,
                  maxLines: 6,
                  // controller: workplace,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  cursorColor: state.color,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: state.color,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: "Enter your notes here ...",
                  ),
                ),
                const Spacer(),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: isLongPressed
                      ? fullWidth(context) - 100.0
                      : fullWidth(context),
                  height: isLongPressed ? 50.0 : 60.0,
                  child: CustomButton(
                    onHighlightChanged: (isHighlighted) {
                      setState(() {
                        isLongPressed = isHighlighted;
                      });
                    },
                    height: isLongPressed ? 50.0 : 60.0,
                    width: isLongPressed
                        ? fullWidth(context) - 100.0
                        : fullWidth(context),
                    primaryColor: state.color,
                    context: context,
                    onPressed: _confirmBooking,
                    bgColor: state.color,
                    translateKey: 'bookNow',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
