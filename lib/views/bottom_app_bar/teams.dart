import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:terrasoft/controllers/bottom_app_bar/teams/teams_controller.dart';
import 'package:terrasoft/helpers/color_helper.dart';
import 'package:terrasoft/helpers/widget_helper.dart';
import 'package:terrasoft/models/bottom_app_bar/teams/fuel_model.dart';
import 'package:terrasoft/widgets/card_widget.dart';
import 'package:timelines/timelines.dart' as t;

class Teams extends StatelessWidget {
  Teams({Key? key}) : super(key: key);
  final TeamsController _controllerTeams = Get.put(TeamsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => _controllerTeams.isLoading.value ? WidgetHelper().buildCircularProgress() :
      _controllerTeams.isData.value ? buildBody() : buildNotFound());
  }

  Widget buildBody(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Görev Detayı',
                  style: TextStyle(
                    color: ColorHelper.secondary,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5
                  ),
                ),
                WidgetHelper().space10Height(),
                Text(
                  _controllerTeams.task.value.name + ' #' + _controllerTeams.task.value.code,
                  style: const TextStyle(
                    color: ColorHelper.primaryDark,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3
                  ),
                ),
                WidgetHelper().space10Height(),
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: InkWell(
                        onTap: (){
                          // Tap Process
                        },
                        child: WidgetHelper().gradientButton('Görevi Yeniden Ekle +'),
                      ),
                    ),
                    WidgetHelper().space20Width(),
                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: (){
                          // Tap Process
                        },
                        child: WidgetHelper().darkButton('Rapor İndir'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          buildStatusBar(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardWidget(
                  title: 'Görev Bilgileri',
                  subtitle1: 'Kodu',
                  subtitle2: 'Bölge',
                  subtitle3: 'Hız Limiti',
                  subtitle4: 'Baş Şoför',
                  data1: _controllerTeams.task.value.code,
                  data2: _controllerTeams.task.value.region,
                  data3: _controllerTeams.task.value.speedLimit,
                  data4: _controllerTeams.task.value.chiefDriver,
                  image: null,
                ),
                WidgetHelper().space20Height(),
                buildDrivingRoute(),
                WidgetHelper().space20Height(),
                buildFuelAnalysis(),
                WidgetHelper().space20Height(),
                CardWidget(
                  title: 'Müşteri Detayları',
                  subtitle1: 'Görüşme Kodu',
                  subtitle2: 'Müşteri Adı',
                  subtitle3: 'Telefon Numarası',
                  subtitle4: 'E-Posta',
                  data1: _controllerTeams.task.value.customer.code,
                  data2: _controllerTeams.task.value.customer.name,
                  data3: _controllerTeams.task.value.customer.phone,
                  data4: _controllerTeams.task.value.customer.mail,
                  image: _controllerTeams.task.value.customer.image,
                ),
                WidgetHelper().space20Height(),
                CardWidget(
                  title: 'Sürücü Bilgileri',
                  subtitle1: 'Sürücü Adı',
                  subtitle2: 'Plaka',
                  subtitle3: 'Telefon Numarası',
                  subtitle4: 'Araç Modeli',
                  data1: _controllerTeams.task.value.driver.name,
                  data2: _controllerTeams.task.value.driver.plate,
                  data3: _controllerTeams.task.value.driver.phone,
                  data4: _controllerTeams.task.value.driver.model,
                  image: null,
                ),
                WidgetHelper().space20Height(),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget buildNotFound(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              Icons.sentiment_dissatisfied,
              color: ColorHelper.lightGrey,
              size: 90,
            ),
          ),
          WidgetHelper().space30Height(),
          const Text(
            'Görev Bulunamadı!',
            style: TextStyle(
                color: ColorHelper.lightGrey,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  Widget buildStatusBar(){
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _controllerTeams.task.value.status == '0' ? WidgetHelper().circularIcon() : const Icon(
                    Icons.check_circle,
                    color: ColorHelper.green,
                    size: 30,
                  ),
                  WidgetHelper().space5Height(),
                  const Text(
                    'Görev Atandı',
                    style: TextStyle(
                        color: ColorHelper.primaryDark,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            WidgetHelper().space5Width(),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _controllerTeams.task.value.status == '0' || _controllerTeams.task.value.status == '1' ? WidgetHelper().circularIcon() : const Icon(
                    Icons.check_circle,
                    color: ColorHelper.green,
                    size: 30,
                  ),
                  WidgetHelper().space5Height(),
                  const Text(
                    'Başladı',
                    style: TextStyle(
                        color: ColorHelper.primaryDark,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            WidgetHelper().space5Width(),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _controllerTeams.task.value.status == '0' || _controllerTeams.task.value.status == '1' || _controllerTeams.task.value.status == '2' ? WidgetHelper().circularIcon() : const Icon(
                    Icons.check_circle,
                    color: ColorHelper.green,
                    size: 30,
                  ),
                  WidgetHelper().space5Height(),
                  const Text(
                    'Müşteriye Gidiliyor',
                    style: TextStyle(
                        color: ColorHelper.primaryDark,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            WidgetHelper().space5Width(),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _controllerTeams.task.value.status == '4' ? const Icon(
                    Icons.check_circle,
                    color: ColorHelper.green,
                    size: 30,
                  ) : WidgetHelper().circularIcon(),
                  WidgetHelper().space5Height(),
                  const Text(
                    'Tamamlandı',
                    style: TextStyle(
                        color: ColorHelper.primaryDark,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildDrivingRoute(){
    return SizedBox(
      width: Get.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetHelper().space30Height(),
              const Text(
                'Sürüş Rota Özeti',
                style: TextStyle(
                    color: ColorHelper.primaryDark,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3
                ),
              ),
              WidgetHelper().space30Height(),
              t.FixedTimeline.tileBuilder(
                /// .connectedFromStyle kullanılacaksa yorum satırlarındaki kodlar açılmalı
                builder: t.TimelineTileBuilder.connected(
                  connectionDirection: t.ConnectionDirection.before,
                  // connectorStyleBuilder: (context, index) {
                  //   return (_controllerTeams.task.value.drivingRoutes[index].status == '0') ? ConnectorStyle.dashedLine : ConnectorStyle.solidLine;
                  // },
                  // firstConnectorStyle: ConnectorStyle.transparent,
                  // lastConnectorStyle: ConnectorStyle.transparent,
                  connectorBuilder: (_, index, connectorType) {
                    return (_controllerTeams.task.value.drivingRoutes[index].status == '0') ? t.DashedLineConnector(
                      indent: connectorType == t.ConnectorType.start ? 4 : 4,
                      endIndent: connectorType == t.ConnectorType.end ? 3 : 4,
                      gap: 3,
                      color: ColorHelper.lightGrey,
                    ) : t.SolidLineConnector(
                      indent: connectorType == t.ConnectorType.start ? 4 : 4,
                      endIndent: connectorType == t.ConnectorType.end ? 4 : 4,
                      color: ColorHelper.primary,
                    );
                  },
                  // indicatorStyleBuilder: (context, index) {
                  //   return (_controllerTeams.task.value.drivingRoutes[index].status == '0') ? IndicatorStyle.outlined : IndicatorStyle.dot;
                  // },
                  indicatorBuilder: (context, index) {
                    return (_controllerTeams.task.value.drivingRoutes[index].status == '0') ? const t.OutlinedDotIndicator(
                      color: ColorHelper.lightGrey,
                      size: 10,
                    ) : const t.DotIndicator(
                      color: ColorHelper.primary,
                      size: 10,
                    );
                  },
                  contentsBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _controllerTeams.task.value.drivingRoutes[index].name,
                          style: const TextStyle(
                            color: ColorHelper.primaryDark,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          _controllerTeams.task.value.drivingRoutes[index].address,
                          style: const TextStyle(
                            color: ColorHelper.grey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  indicatorPositionBuilder: (context, index) => 0,
                  nodePositionBuilder: (context, index) => 0,
                  itemExtent: 65,
                  itemCount: _controllerTeams.task.value.drivingRoutes.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget buildFuelAnalysis(){
    return SizedBox(
      width: Get.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Yakıt Analizi',
                style: TextStyle(
                    color: ColorHelper.primaryDark,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3
                ),
              ),
              WidgetHelper().space10Height(),
              SizedBox(
                height: Get.height * .15,
                child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryXAxis: DateTimeAxis(
                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                    maximumLabelWidth: 0,
                    axisLine: const AxisLine(width: 0),
                    majorTickLines: const MajorTickLines(width: 0),
                    majorGridLines: const MajorGridLines(width: 0),
                  ),
                  primaryYAxis: NumericAxis(
                    // labelFormat: '{value}%',
                    labelStyle: const TextStyle(color: Colors.transparent),
                    maximumLabelWidth: 0,
                    minimum: 9.4,
                    maximum: 11,
                    axisLine: const AxisLine(width: 0),
                    majorTickLines: const MajorTickLines(width: 0),
                    majorGridLines: const MajorGridLines(width: 0),
                  ),
                  series: <ChartSeries<FuelModel, DateTime>>[
                    LineSeries<FuelModel, DateTime>(
                      animationDuration: 0,
                      dataSource: _controllerTeams.task.value.fuels,
                      xValueMapper: (FuelModel fuels, _) => DateTime.parse(fuels.date),
                      yValueMapper: (FuelModel fuels, _) => fuels.fuel,
                      enableTooltip: false,
                      width: 3,
                      color: ColorHelper.primaryDark,
                    ),
                    LineSeries<FuelModel, DateTime>(
                      animationDuration: 2500,
                      dataSource: _controllerTeams.task.value.fuels,
                      xValueMapper: (FuelModel fuels, _) => DateTime.parse(fuels.date),
                      yValueMapper: (FuelModel fuels, _) => fuels.fuel2,
                      width: 3,
                      color: ColorHelper.primary,
                    ),
                  ],
                  tooltipBehavior: TooltipBehavior(enable: true, header: '', canShowMarker: false),
                ),
              ),
              WidgetHelper().space10Height(),
              InkWell(
                onTap: (){
                  // Tap Process
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Detaylı Görüntüle',
                      style: TextStyle(
                          color: ColorHelper.primaryDark,
                          fontSize: 16,
                      ),
                    ),
                    Icon(Icons.chevron_right, color: ColorHelper.primaryDark)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}