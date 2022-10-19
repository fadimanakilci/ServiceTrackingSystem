import 'package:terrasoft/models/bottom_app_bar/teams/customer_model.dart';
import 'package:terrasoft/models/bottom_app_bar/teams/driver_model.dart';
import 'package:terrasoft/models/bottom_app_bar/teams/driving_route_model.dart';
import 'package:terrasoft/models/bottom_app_bar/teams/fuel_model.dart';

class TaskModel{
  final int id;
  String name;
  String code;
  String status;
  String region;
  String speedLimit;
  String chiefDriver;
  List<DrivingRouteModel> drivingRoutes;
  List<FuelModel> fuels;
  CustomerModel customer;
  DriverModel driver;

  TaskModel({
    required this.id,
    required this.name,
    required this.code,
    required this.status,
    required this.region,
    required this.speedLimit,
    required this.chiefDriver,
    required this.drivingRoutes,
    required this.fuels,
    required this.customer,
    required this.driver,
  });
}