import 'dart:async';
import 'dart:math';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:zapp_vpn/src/ui/common/zapp_string_constants.dart';
import 'package:zapp_vpn/src/ui/common/zapp_text_styles.dart';
import 'package:zapp_vpn/src/ui/pages/speedtest_page/widgets/speedtest_result_widget.dart';
import 'package:zapp_vpn/src/utils/zapp_enums.dart';

class ZappSpeedTestPage extends StatefulWidget {
  const ZappSpeedTestPage({super.key});

  @override
  State<ZappSpeedTestPage> createState() => _ZappSpeedTestPageState();
}

class _ZappSpeedTestPageState extends State<ZappSpeedTestPage> {
  final double maxSpeed = 200.0;
  int speed = 0;
  SpeedtestStatus speedtestStatus = SpeedtestStatus.notStarted;
  Timer? timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: const BackButton(),
        title: Column(
          children: [
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'SPEEDTEST',
                style: ZappFontStyles.bodyMediumS(
                  color: theme.textTheme.bodyLarge!.color,
                ),
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                      text: 'by',
                      style: ZappFontStyles.bodyMediumXs(
                        color: theme.secondaryHeaderColor,
                      ))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${ZappStringConstants.thunder}ZAPP VPN',
                  style: ZappFontStyles.custom(
                    fontSize: 26,
                    weight: FontWeight.w900,
                    color: theme.textTheme.bodyLarge!.color,
                  ),
                ),
                const SizedBox(width: 30),
              ],
            ),
          ],
        ),
        actions: const [SizedBox(width: 50)],
      ),
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SfRadialGauge(
                enableLoadingAnimation: true,
                animationDuration: 300,
                axes: <RadialAxis>[
                  RadialAxis(
                    showAxisLine: true,
                    radiusFactor: 0.7,
                    minimum: 0,
                    maximum: maxSpeed,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: speed.toDouble(),
                        color: theme.primaryColor,
                        endWidth: 20,
                        startWidth: 20,
                      ),
                      GaugeRange(
                        startValue: speed.toDouble(),
                        endValue: maxSpeed,
                        color: theme.secondaryHeaderColor,
                        endWidth: 20,
                        startWidth: 20,
                      )
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        enableAnimation: true,
                        animationDuration: 200,
                        // animationType: AnimationType.bounceOut,
                        value: speed.toDouble(),
                        knobStyle: const KnobStyle(
                          knobRadius: 0,
                          sizeUnit: GaugeSizeUnit.logicalPixel,
                        ),
                        needleLength: maxSpeed / 2,
                        needleEndWidth: 15,
                        needleStartWidth: 10,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Text(speed.toString(),
                            style: ZappFontStyles.bodyBoldL()),
                        angle: 90,
                        positionFactor: 0.7,
                      ),
                      GaugeAnnotation(
                        widget: Text(
                          'Mbps',
                          style: ZappFontStyles.bodyMediumS(
                            color: theme.secondaryHeaderColor,
                          ),
                        ),
                        angle: 90,
                        positionFactor: 0.9,
                      ),
                    ],
                  )
                ],
              ),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 700),
                crossFadeState: speedtestStatus.isCompleted
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: speedtestStatus.isRunning
                      ? const SizedBox.shrink()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          onPressed: () async {
                            setState(() {
                              speedtestStatus = SpeedtestStatus.running;
                            });
                            timer = Timer.periodic(
                                const Duration(milliseconds: 600), (timer) {
                              setState(() {
                                speed += Random().nextInt(20);
                                if (speed > 250) speed = 40;
                              });
                            });
                            await Future.delayed(const Duration(seconds: 5));
                            setState(() {
                              speedtestStatus = SpeedtestStatus.completed;
                            });
                            timer!.cancel();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Check now!',
                              style: ZappFontStyles.bodyMediumM(),
                            ),
                          ),
                        ),
                ),
                secondChild: Column(
                  children: [
                    SpeedtestResultWidget(
                      theme: theme,
                      downloadSpeed: speed,
                      uploadSpeed: speed,
                    ),
                    const SizedBox(height: 5),
                    InkWell(
                      onTap: () {
                        setState(() {
                          speedtestStatus = SpeedtestStatus.notStarted;
                          speed = 0;
                        });
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Ink(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Reset',
                              style: ZappFontStyles.bodyMediumS(
                                color: theme.primaryColor,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Icon(
                              EvaIcons.refresh,
                              size: 16,
                              color: theme.primaryColor,
                            ),
                          ],
                        ),
                      )),
                    )
                  ],
                ),
              ),
              // const SizedBox(height: 30),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(context).size.width,
                height: 160,
                child: const Placeholder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
