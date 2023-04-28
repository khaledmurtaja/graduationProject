import 'package:flutter/material.dart';

import '../../core/utils/helperFunctions.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: getMediaQueryHeight(context: context, value: 200),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
  }
}
