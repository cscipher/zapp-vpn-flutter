import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:zapp_vpn/src/ui/common/zapp_string_constants.dart';
import 'package:zapp_vpn/src/ui/common/zapp_text_styles.dart';
import 'package:zapp_vpn/src/ui/pages/speedtest_page/bloc/zapp_speedtest_bloc.dart';
import 'package:zapp_vpn/src/ui/pages/speedtest_page/widgets/speedtest_result_widget.dart';
import 'package:zapp_vpn/src/utils/zapp_enums.dart';

class ZappSpeedTestPage extends StatefulWidget {
  const ZappSpeedTestPage({super.key});

  @override
  State<ZappSpeedTestPage> createState() => _ZappSpeedTestPageState();
}

class _ZappSpeedTestPageState extends State<ZappSpeedTestPage> {
  final double maxSpeed = 100.0;
  final bloc = ZappSpeedtestBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
      body: BlocBuilder<ZappSpeedtestBloc, ZappSpeedtestState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is ZappSpeedtestConnectionState) {
            return SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    if (state.speedtestType != SpeedtestType.none)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          state.speedtestType.name,
                          style: ZappFontStyles.bodyMediumS(
                            color: theme.primaryColor,
                          ),
                        ),
                      ),
                    SfRadialGauge(
                      enableLoadingAnimation: true,
                      animationDuration: 300,
                      axes: <RadialAxis>[
                        RadialAxis(
                          showAxisLine: true,
                          radiusFactor: 0.7,
                          minimum: 0,
                          maximum: maxSpeed,
                          axisLabelStyle: GaugeTextStyle(
                            color: theme.textTheme.headline1!.color,
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                          ),
                          ranges: <GaugeRange>[
                            GaugeRange(
                              startValue: 0,
                              endValue:
                                  state.speedtestType == SpeedtestType.none
                                      ? 0
                                      : state.speedtestType ==
                                              SpeedtestType.downloadTest
                                          ? state.downloadTransferRate
                                          : state.uploadTransferRate,
                              color: theme.primaryColor,
                              labelStyle: GaugeTextStyle(
                                color: theme.textTheme.headline1!.color,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                              endWidth: 20,
                              startWidth: 20,
                            ),
                            GaugeRange(
                              startValue:
                                  state.speedtestType == SpeedtestType.none
                                      ? 0
                                      : state.speedtestType ==
                                              SpeedtestType.downloadTest
                                          ? state.downloadTransferRate
                                          : state.uploadTransferRate,
                              endValue: maxSpeed,
                              labelStyle: GaugeTextStyle(
                                color: theme.textTheme.headline1!.color,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
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
                              value: state.speedtestType ==
                                      SpeedtestType.downloadTest
                                  ? state.downloadTransferRate
                                  : state.uploadTransferRate,
                              knobStyle: const KnobStyle(
                                knobRadius: 0,
                                sizeUnit: GaugeSizeUnit.logicalPixel,
                              ),
                              needleLength: 0.6,
                              needleEndWidth: 10,
                              needleStartWidth: 4,
                              needleColor: theme.textTheme.headline1!.color,
                            ),
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                              widget: Text(
                                  (state.speedtestType == SpeedtestType.none
                                          ? 0
                                          : state.speedtestType ==
                                                  SpeedtestType.downloadTest
                                              ? state.downloadTransferRate
                                              : state.uploadTransferRate)
                                      .toString(),
                                  style: ZappFontStyles.bodyBoldL()),
                              angle: 90,
                              positionFactor: 0.7,
                            ),
                            GaugeAnnotation(
                              widget: Text(
                                state.speedUnit.name,
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
                      crossFadeState: state.speedtestStatus.isCompleted
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      firstChild: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: state.speedtestStatus.isRunning
                            ? const SizedBox.shrink()
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: () async {
                                  bloc.add(
                                    ZappSpeedtestDownloadTestEvent(context),
                                  );
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
                            downloadSpeed: state.downloadTransferRate.ceil(),
                            uploadSpeed: state.uploadTransferRate.ceil(),
                          ),
                          const SizedBox(height: 5),
                          InkWell(
                            onTap: () {
                              bloc.add(ZappSpeedtestResetEvent());
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
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
