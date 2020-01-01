// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboardmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) {
  return DashboardModel(
    totalProduct: json['totalProduct'] as int,
    totalSoldProduct: json['totalSoldProduct'] as int,
    totalPendingProduct: json['totalPendingProduct'] as int,
    totalApprovedProduct: json['totalApprovedProduct'] as int,
    totalInActiveProduct: json['totalInActiveProduct'] as int,
    totalDeletedProduct: json['totalDeletedProduct'] as int,
    totalProductAmount: json['totalProductAmount'] as String,
    totalSoldProductAmount: json['totalSoldProductAmount'] as String,
    totalUser: json['totalUser'] as int,
    totalMessage: json['totalMessage'] as int,
  );
}

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'totalProduct': instance.totalProduct,
      'totalSoldProduct': instance.totalSoldProduct,
      'totalPendingProduct': instance.totalPendingProduct,
      'totalApprovedProduct': instance.totalApprovedProduct,
      'totalInActiveProduct': instance.totalInActiveProduct,
      'totalDeletedProduct': instance.totalDeletedProduct,
      'totalProductAmount': instance.totalProductAmount,
      'totalSoldProductAmount': instance.totalSoldProductAmount,
      'totalUser': instance.totalUser,
      'totalMessage': instance.totalMessage,
    };
