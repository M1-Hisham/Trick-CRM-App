// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class MultiSelectDropdown extends StatefulWidget {
//   final String? labelText;
//   final bool isRequired;
//   final bool isChange;
//   final List<dynamic> items;
//   final List<String> initialSelected;
//   final Function(List<String>)? onChanged;

//   const MultiSelectDropdown({
//     super.key,
//     this.labelText,
//     this.isRequired = false,
//     this.isChange = true,
//     required this.items,
//     this.initialSelected = const [],
//     this.onChanged,
//   });

//   @override
//   State<MultiSelectDropdown> createState() => _MultiSelectDropdownState();
// }

// class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
//   late List<String> selectedValues;
//   bool isDropdownOpen = false;

//   final LayerLink _layerLink = LayerLink();
//   OverlayEntry? _overlayEntry;

//   @override
//   void initState() {
//     super.initState();
//     selectedValues = List.from(widget.initialSelected);
//   }

//   void _toggleDropdown() {
//     if (isDropdownOpen) {
//       _removeOverlay();
//     } else {
//       _showOverlay();
//     }
//   }

//   void _removeOverlay() {
//     _overlayEntry?.remove();
//     _overlayEntry = null;
//     setState(() {
//       isDropdownOpen = false;
//     });
//   }

//   @override
//   void didUpdateWidget(covariant MultiSelectDropdown oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.initialSelected != widget.initialSelected) {
//       selectedValues = List.from(widget.initialSelected);
//     }
//   }

//   void _showOverlay() {
//     RenderBox renderBox = context.findRenderObject() as RenderBox;
//     Size size = renderBox.size;
//     Offset offset = renderBox.localToGlobal(Offset.zero);

//     _overlayEntry = OverlayEntry(
//       builder: (context) => Positioned(
//         width: size.width,
//         child: CompositedTransformFollower(
//           link: _layerLink,
//           offset: Offset(0.0, size.height + 5.h),
//           child: Material(
//             elevation: 4,
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white, // لون المينيو أبيض
//             child: ConstrainedBox(
//               constraints: BoxConstraints(maxHeight: 300.h),
//               child: ListView(
//                 padding: EdgeInsets.zero,
//                 shrinkWrap: true,
//                 children: widget.items.map((item) {
//                   String value =
//                       item is Map ? item['id'].toString() : item.toString();
//                   String label =
//                       item is Map ? item['name'].toString() : item.toString();
//                   bool isChecked = selectedValues.contains(value);
//                   return CheckboxListTile(
//                       controlAffinity: ListTileControlAffinity.leading,
//                       contentPadding:
//                           const EdgeInsets.symmetric(horizontal: 16),
//                       title: Text(label),
//                       value: isChecked,
//                       onChanged: (bool? checked) {
//                         if (checked == true) {
//                           selectedValues.add(value);
//                         } else {
//                           selectedValues.remove(value);
//                         }
//                         widget.onChanged?.call(selectedValues);

//                         // تحديث الـ UI الخارجي مباشرة
//                         WidgetsBinding.instance.addPostFrameCallback((_) {
//                           if (mounted) setState(() {});
//                         });
//                       });
//                 }).toList(),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );

//     Overlay.of(context).insert(_overlayEntry!);

//     setState(() {
//       isDropdownOpen = true;
//     });
//   }

//   @override
//   void dispose() {
//     _removeOverlay();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CompositedTransformTarget(
//       link: _layerLink,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (widget.labelText != null)
//             RichText(
//               text: TextSpan(
//                 text: widget.labelText,
//                 style: TextStyle(
//                   color: const Color(0XFF2C2E32),
//                   fontSize: 15.sp,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 children: widget.isRequired
//                     ? const [
//                         TextSpan(
//                             text: ' *', style: TextStyle(color: Colors.red)),
//                       ]
//                     : [],
//               ),
//             ),
//           SizedBox(height: 8.h),
//           GestureDetector(
//             onTap: _toggleDropdown,
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(color: const Color(0xFFE8ECF4)),
//                 borderRadius: BorderRadius.circular(8.r),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       selectedValues.isEmpty
//                           ? 'Select options'
//                           : selectedValues.join(', '),
//                       style: TextStyle(
//                         fontSize: 14.sp,
//                         color:
//                             selectedValues.isEmpty ? Colors.grey : Colors.black,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 2,
//                     ),
//                   ),
//                   Icon(
//                     isDropdownOpen
//                         ? Icons.arrow_drop_up
//                         : Icons.arrow_drop_down,
//                     color: Colors.grey[700],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
