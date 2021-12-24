import 'package:flutter/material.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/screens/guests/widgets/staff_card_session.dart';
import 'package:spacemanager/services/auth.dart';

class StaffContentWidget extends StatelessWidget {
  const StaffContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StaffCardSessionWidget(
          guest: AuthService.to.guest!,
          session: AuthService.to.session!,
        ),
        SizedBox(
          height: kToolbarHeight,
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Material(
                  color: BaseColors.primary.withOpacity(.91),
                  child: InkWell(
                    onTap: () {},
                    child: const SizedBox.expand(
                      child: Icon(
                        Icons.change_circle,
                        size: 27,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Material(
                  color: BaseColors.primary,
                  child: InkWell(
                    onTap: () {},
                    child: const SizedBox.expand(
                      child: Icon(
                        Icons.change_circle,
                        size: 27,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
