import 'package:flutter/material.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/screens/guests/widgets/staff_card_session.dart';
import 'package:spacemanager/services/auth.dart';

class MainSide extends StatelessWidget {
  const MainSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BaseColors.white,
        border: Border(
          right: BorderSide(
            color: Colors.grey.shade300,
            width: .81,
          ),
        ),
      ),
      child: Column(
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
      ),
    );
  }
}
