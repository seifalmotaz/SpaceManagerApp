part of widgets_group;

class WDialog extends StatelessWidget {
  const WDialog({
    Key? key,
    required this.body,
    this.width = 500,
  }) : super(key: key);

  final double width;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Stack(
        children: [
          SizedBox.expand(
            child: GestureDetector(onTap: () => Get.back()),
          ),
          Center(
            child: Container(
              width: width,
              child: body,
              clipBehavior: Clip.antiAlias,
              padding: const EdgeInsets.all(23),
              decoration: BoxDecoration(
                color: colorDarkLight,
                borderRadius: BorderRadius.circular(27),
              ),
            ),
          )
        ],
      ),
    );
  }
}
