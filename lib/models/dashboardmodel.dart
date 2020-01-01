import 'package:json_annotation/json_annotation.dart';

part 'dashboardmodel.g.dart';

@JsonSerializable()
class DashboardModel {
  int totalProduct;
  int totalSoldProduct;
  int totalPendingProduct;
  int totalApprovedProduct;
  int totalInActiveProduct;
  int totalDeletedProduct;
  String totalProductAmount;
  String totalSoldProductAmount;
  int totalUser;
  int totalMessage;

  DashboardModel(
      {this.totalProduct,
      this.totalSoldProduct,
      this.totalPendingProduct,
      this.totalApprovedProduct,
      this.totalInActiveProduct,
      this.totalDeletedProduct,
      this.totalProductAmount,
      this.totalSoldProductAmount,
      this.totalUser,
      this.totalMessage});

   factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);
      
  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);
}
