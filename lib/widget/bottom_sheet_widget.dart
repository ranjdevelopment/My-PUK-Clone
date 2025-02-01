import 'package:flutter/material.dart';

Future bottomSheetWidget(
  BuildContext context, {
  Color? backgroundColor,
  bool showDragHandle = true,
  bool? isScrollControlled,
  ShapeBorder? shape,
  double? elevation,
  bool enableDrag = true,
  double initialChildSize = 0.5,
  double minChildSize = 0.25,
  double maxChildSize = 1.0,
  List<double>? snapSizes,
  Widget Function(BuildContext context, ScrollController scrollController)?
      draggableScrollableBuilder,
}) async =>
    await showModalBottomSheet(
      context: context,
      backgroundColor: backgroundColor,
      enableDrag: enableDrag,
      isScrollControlled: isScrollControlled ?? false,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          snap: snapSizes != null,
          snapSizes: snapSizes,
          builder: draggableScrollableBuilder ??
              (context, scrollController) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (showDragHandle)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Container(
                          width: 38,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
               
                  ],
                );
              },
        );
      },
    );


    // await Get.bottomSheet(
    //   Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       if (showDragHandle)
    //         Padding(
    //           padding: const EdgeInsets.only(top: 16.0),
    //           child: Container(
    //             width: 38,
    //             height: 3,
    //             decoration: BoxDecoration(
    //               color: AppColors.greyscale200,
    //               borderRadius: BorderRadius.circular(12.0),
    //             ),
    //           ),
    //         ),
    //       content,
    //     ],
    //   ),
    //   elevation: elevation ?? 0,
    //   backgroundColor:
    //       backgroundColor ?? Theme.of(context).colorScheme.background,
    //   enterBottomSheetDuration: Durations.short4,
    //   exitBottomSheetDuration: Durations.short4,
    //   isScrollControlled: isScrollControlled ?? false,
    //   shape: shape,
    // );
