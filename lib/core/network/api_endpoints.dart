class ApiEndpoints {
  /// Authentication [Login]
  static const login = "oauth/token";

  /// User
  static const userDetail = "api/v1/auth/user";
  static const userUpdatePassword = "api/v1/user/update-password";
  static const payslipList = "api/v1/payroll/payslip/user";
  static const downloadPayslip = "api/v1/payroll/payslip/download";

  /// App Version
  static const appVersion = "api/version/index";

  /// Dashboard
  static const dashboardDO = "api/v1/dashboard/delivery-order";
  static const dashboardTMS = "api/v1/dashboard/tms";
  static const dashboardInsurance = "api/v1/dashboard/insurance-submission";
  static const dashboardPurchasing = "api/v1/dashboard/purchasing";
  static const dashboardRepair = "api/v1/dashboard/repair-submission";

  /// DELIVERY ORDER
  static const deliveryOrderList = "api/v1/delivery-order";

  /// TMS
  static const tmsList = "api/v1/tms";
  static const approveTms = "api/v1/tms/update-status";

  /// PURCHASING
  static const purchasingList = "api/v1/purchase";
  static const approvePurchasing = "api/v1/purchase/update-status";

  /// REPAIR
  static const repairList = "api/v1/repair-submission";
  static const approveRepair = "api/v1/repair-submission/update-status";

  /// INSURANCE
  static const insuranceList = "api/v1/insurance";
}