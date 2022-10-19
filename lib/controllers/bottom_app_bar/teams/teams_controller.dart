
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:terrasoft/models/bottom_app_bar/teams/customer_model.dart';
import 'package:terrasoft/models/bottom_app_bar/teams/driver_model.dart';
import 'package:terrasoft/models/bottom_app_bar/teams/driving_route_model.dart';
import 'package:terrasoft/models/bottom_app_bar/teams/fuel_model.dart';
import 'package:terrasoft/models/bottom_app_bar/teams/task_model.dart';

class TeamsController extends GetxController{
  // Data yükleniyorsa true, yüklenme bittiyse false
  var isLoading = true.obs;
  // Data varsa true, yoksa false
  var isData = false.obs;
  var task = TaskModel(
    id: 0,
    name: '',
    code: '',
    status: '',
    region: '',
    speedLimit: '',
    chiefDriver: '',
    drivingRoutes: <DrivingRouteModel>[],
    fuels: <FuelModel>[],
    customer: CustomerModel(
        id: 0,
        code: '',
        image: '',
        name: '',
        phone: '',
        mail: '',
    ),
    driver: DriverModel(
      id: 0,
      name: '',
      plate: '',
      phone: '',
      model: '',
    ),
  ).obs;

  @override
  void onInit(){
    fetchTaskData();
    super.onInit();
  }

  // Teams view için gerekli datayların ilgili yerlerden(API, firebase ...)
  // çekilmesini sağlayan asenkron fonksiyon
  Future<void> fetchTaskData() async {
    // Verilerin çekildiği fonksiyon
    task.value = TaskModel(
      id: 1,
      name: 'Kamer Koleji Akşam Servisi',
      code: '2512351',
      status: '2',
      region: '4. Organize',
      speedLimit: '80 KM',
      chiefDriver: 'Mustafa Şahan',
      drivingRoutes: <DrivingRouteModel>[
        DrivingRouteModel(id: 1, name: 'Rölanti', address: '272 westheimer Rd. Santa Ana, 85486', status: '1'),
        DrivingRouteModel(id: 2, name: 'Hızlanma', address: '272 westheimer Rd. Santa Ana, 85486', status: '1'),
        DrivingRouteModel(id: 3, name: 'Hız İhlali', address: '272 westheimer Rd. Santa Ana, 85486', status: '1'),
        DrivingRouteModel(id: 4, name: 'Yavaşlama', address: '272 westheimer Rd. Santa Ana, 85486', status: '1'),
        DrivingRouteModel(id: 5, name: 'Rölanti', address: '', status: '0'),
      ],
      fuels: <FuelModel>[
        FuelModel(id: 1, date: '2022-10-11', fuel: 10, fuel2: 9.5),
        FuelModel(id: 2, date: '2022-10-12', fuel: 10.2, fuel2: 9.7),
        FuelModel(id: 3, date: '2022-10-13', fuel: 10, fuel2: 9.5),
        FuelModel(id: 4, date: '2022-10-14', fuel: 10.2, fuel2: 9.7),
        FuelModel(id: 5, date: '2022-10-15', fuel: 10, fuel2: 9.5),
        FuelModel(id: 6, date: '2022-10-16', fuel: 10.2, fuel2: 9.7),
        FuelModel(id: 7, date: '2022-10-17', fuel: 10.4, fuel2: 9.9),
        FuelModel(id: 8, date: '2022-10-18', fuel: 10.3, fuel2: 9.8),
        FuelModel(id: 9, date: '2022-10-19', fuel: 10.4, fuel2: 9.9),
        FuelModel(id: 10, date: '2022-10-20', fuel: 10.6, fuel2: 10.1),
        FuelModel(id: 11, date: '2022-10-21', fuel: 10.7, fuel2: 10.2),
      ],
      customer: CustomerModel(
        id: 1,
        code: '193133329298',
        image: 'assets/images/profile.jpeg',
        name: 'David Green',
        phone: '409-333-233',
        mail: 'davidgreen@gmail.com',
      ),
      driver: DriverModel(
        id: 1,
        name: 'Ahmet Kırman',
        plate: '42 C 0728',
        phone: '0555 555 55 55',
        model: 'Master',
      ),
    );

    // Circular Progress Barın görüntülenebimesi için 10000 milliseconds atandı
    Future.delayed(const Duration(milliseconds: 10000), () {
      debugPrint('Data Gösteriliyor...');
      isLoading.value = false;
      // alttaki satırı false yaparsak ya da yorum satırına alırsak
      // teams view da buildNotFound() widget'ı çalışacaktır.
      isData.value = true;
    });
  }
}