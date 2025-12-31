import 'package:intl/intl.dart';
import 'package:mbayat_user_app/utils/allExport.dart';

class CustomTextFormField extends StatefulWidget {
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final Color? fillColor;
  final String? label;
  final bool showLabel;
  final bool? filled;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int? maxLines;
  final String hintText;
  final String? labelText;
  final String? counterText;
  final bool enabled;
  final bool isPasswordField;
  final Widget? prefixIconWidget;
  final Widget? prefix;
  final IconData? suffixIcon;
  final IconButton? suffixIconButton;
  final Function(String?)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final double fieldHeight;
  final Color? textColor;
  final int? maxLength;
  final void Function(String)? onChanged;
  final bool isDatePicker;
  final bool isTimePicker;

  const CustomTextFormField({
    super.key,
    this.focusNode,
    this.textColor,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.enabled,
    this.onFieldSubmitted,
    this.counterText,
    this.filled,
    this.fillColor = AppColors.white,
    this.onChanged,
    this.maxLines = 1,
    this.labelText,
    this.textInputAction,
    this.inputFormatters,
    this.validator,
    this.fieldHeight = 40.0,
    this.maxLength,
    this.prefix,
    this.label,
    this.showLabel = true,
    this.isPasswordField = false,
    this.prefixIconWidget,
    this.suffixIcon,
    this.suffixIconButton,
    this.isDatePicker = false,
    this.isTimePicker = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final bool _obscureText = true;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        widget.controller.text = DateFormat('dd MMM yyyy').format(pickedDate);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        widget.controller.text = pickedTime.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showLabel && widget.label != null)
          TextWidget(text: widget.label!, color: widget.textColor),

        if (widget.showLabel && widget.label != null) kHeightGap(4),
        GestureDetector(
          onTap: widget.isDatePicker
              ? () {
                  FocusScope.of(context).unfocus();
                  _selectDate(context);
                }
              : widget.isTimePicker
              ? () {
                  FocusScope.of(context).unfocus();
                  _selectTime(context);
                }
              : null,
          child: AbsorbPointer(
            absorbing: widget.isDatePicker || widget.isTimePicker,
            child: TextFormField(
              maxLines: widget.maxLines,
              cursorColor: AppColors.primary900,
              maxLength: widget.maxLength,
              readOnly: !widget.enabled,
              focusNode: widget.focusNode,
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              obscureText: widget.isPasswordField ? _obscureText : false,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: widget.textColor ?? AppColors.black,
              ),
              inputFormatters: widget.inputFormatters,
              decoration: InputDecoration(
                fillColor: widget.fillColor,
                filled: widget.filled ?? false,
                hintText: widget.hintText,
                labelText: widget.labelText,
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textFieldColor,
                ),
                labelStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textFieldColor,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),

                // 👇 Show counter unless overridden
                counterText: widget.counterText ?? "",

                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.textFieldColor),
                  borderRadius: BorderRadius.circular(86),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.primary500),
                  borderRadius: BorderRadius.circular(86),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(86),
                  borderSide: const BorderSide(color: AppColors.textFieldColor),
                ),
                prefix: widget.prefix,
                prefixStyle: GoogleFonts.poppins(
                  fontSize: 20,
                  color: AppColors.textFieldColor,
                ),
                prefixIcon: widget.prefixIconWidget,
                suffixIcon:
                    widget.suffixIconButton ??
                    (widget.suffixIcon != null
                        ? Icon(widget.suffixIcon, color: AppColors.primary900)
                        : null),
              ),
              onFieldSubmitted: widget.onFieldSubmitted,
              validator: widget.validator,
              onChanged: widget.onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
