import 'package:animation_flutter/module/animations/helpers/curve.helper.dart';
import 'package:animation_flutter/module/animations/widgets/select.widget.dart';
import 'package:animation_flutter/module/animations/widgets/shape_animation.widget.dart';
import 'package:animation_flutter/widget/icon_theme.widget.dart';
import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  Curve curve = Curves.bounceIn;
  final TextEditingController _durationController =
      TextEditingController(text: "3000");

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: int.parse(_durationController.text)),
    );
    startAnimation();
  }

  void startAnimation() {
    animation = animationController.drive(CurveTween(curve: curve));

    animation.addListener(() => setState(() => {}));
    animation.addStatusListener((status) {
      Future.delayed(const Duration(seconds: 1)).then((value) {
        setState(() {
          if (status == AnimationStatus.completed) {
            animationController.reverse();
          } else if (status == AnimationStatus.dismissed) {
            animationController.forward();
          }
        });
      });
    });

    animationController.forward();
  }

  void onChangeCurve(String value) {
    setState(() {
      String key = curves.keys.singleWhere((curve) => curve == value);
      curve = curves[key]!;
      startAnimation();
    });
  }

  void onChangeDuration(String value) {
    setState(() {
      animationController.duration = Duration(milliseconds: int.parse(value));
      animationController.forward();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation demo"),
        actions: const [IconThemeWidget()],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Animações",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: "3000",
              onChanged: onChangeDuration,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Duração",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.timer),
              ),
            ),
            const SizedBox(height: 5),
            SelectWidget(
              selected: "bounceIn",
              items: curves.keys
                  .map((key) => SelectItem(value: key, label: key))
                  .toList(),
              onChange: onChangeCurve,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            ShapeAnimationWidget(
                              offsetY: animation.value,
                              containerSize:
                                  MediaQuery.of(context).size.width / 2.4,
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Transition",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          children: [
                            ShapeAnimationWidget(
                              rotate: animation.value,
                              containerSize:
                                  MediaQuery.of(context).size.width / 2.4,
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Rotation",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            ShapeAnimationWidget(
                              size: animation.value,
                              containerSize:
                                  MediaQuery.of(context).size.width / 2.4,
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Scale",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          children: [
                            ShapeAnimationWidget(
                              opacity: animation.value,
                              containerSize:
                                  MediaQuery.of(context).size.width / 2.4,
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Opacity",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
