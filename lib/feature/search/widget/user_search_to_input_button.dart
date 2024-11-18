import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/device_size.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:flutter/material.dart';

class UserSearchToInputButton extends StatelessWidget {
  const UserSearchToInputButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingInsets().medium,
      child: ElevatedButton(
        onPressed: () => context.router.push(const SearchInputRoute()),
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all<Size>(
            Size(DeviceSize.width(context) / 1.7, 45),
          ),
          maximumSize: WidgetStateProperty.all<Size>(
            Size(DeviceSize.width(context) / 1.7, 45),
          ),
          elevation: WidgetStateProperty.all<double>(0),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
            Colors.grey.shade600,
          ),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: Text(
                  'goSearchService'.tr(),
                  style: context.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w300, color: Colors.white),
                )),
            const Expanded(
                child: Icon(
              Icons.navigate_next_sharp,
              size: 25,
              color: Colors.white,
            )),
          ],
        ),
      ),
    );
  }
}
