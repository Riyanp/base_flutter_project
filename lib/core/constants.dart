class LoginConstants {
  static const loginGrantType = "password";
  static const loginScope = "*";
}

class Constants {
  // User
  static const accessToken = "access_token";
  static const userId = "id";
  static const userEmail = "email";
  static const userDisplayName = "display_name";
  static const userRole = "role";
  static const userAvatar = "avatar";
  static const userLoginName = "user_login";
  static const userLoginPassword = "user_password";
  static const userEmployeeNumber = "employeeNumber";
  static const userIdNumber = "idNumber";
  static const userBirthDate = "birthDate";
  static const userBirthPlace = "birthPlace";
  static const userAddress = "address";
  static const userMobilePhone = "mobilePhone";
  static const userNpwp = "npwp";
  static const userEmployeeStatus = "employeeStatus";
  static const userJoinDate = "joinDate";
  static const userContractEndDate = "contractEndDate";
  static const userBankName = "bankName";
  static const userAccountName = "accountName";
  static const userPosition = "userPosition";
  static const userDivisionName = "userDivisionName";

  // Role
  static const hasDashboardAccess = "hasDashboardAccess";
  static const hasDOAccess = "hasDOAccess";
  static const hasPurchasingAccess = "hasPurchasingAccess";
  static const hasTMSAccess = "hasTMSAccess";
  static const hasInsuranceAccess = "hasInsuranceAccess";
  static const hasRepairAccess = "hasRepairAccess";

  // Role - menu name
  static const dashboard = "Dashboard";
  static const deliveryOrder = "Delivery Order";
  static const purchasing = "Pengadaan Barang";
  static const tms = "TMS";
  static const repair = "Perbaikan Kendaraan";
  static const insurance = "Asuransi";

  // Role - menu access
  static const indexAccess = "index";
  static const approvalAccess = "update-status";

  // Role - approval
  static const hasPurchasingApprovalAccess = "hasPurchasingApprovalAccess";
  static const hasTMSApprovalAccess = "hasTMSApprovalAccess";
  static const hasRepairApprovalAccess = "hasRepairApprovalAccess";

  // Dashboard
  static const tmsFilter = "TMS";
  static const purchasingFilter = "Purchasing";
  static const repairFilter = "Repair";
  static const hasDoneDashboardOnBoarding = "has_done_dashboard_on_boarding";
  static const unfinishedDOStatus = 1;
  static const finishedDOStatus = 2;
}

enum SubmissionStatus {
  ALL,
  PENDING,
  REJECT,
  APPROVE,
  SELESAI,
}

extension SubmissionStatusExt on SubmissionStatus {
  String get name {
    switch (this) {
      case SubmissionStatus.PENDING:
        return "PENDING";
      case SubmissionStatus.REJECT:
        return "REJECT";
      case SubmissionStatus.APPROVE:
        return "APPROVE";
      case SubmissionStatus.SELESAI:
        return "SELESAI";
      default:
        return "SEMUA";
    }
  }

  int get asInt {
    switch (this) {
      case SubmissionStatus.PENDING:
        return 1;
      case SubmissionStatus.REJECT:
        return 2;
      case SubmissionStatus.APPROVE:
        return 3;
      case SubmissionStatus.SELESAI:
        return 4;
      default:
        return 0;
    }
  }
}

enum DOStatus {
  ALL,
  UNPAID,
  PAID,
}

extension DOStatusExt on DOStatus {
  String get name {
    switch (this) {
      case DOStatus.UNPAID:
        return "BELUM BAYAR";
      case DOStatus.PAID:
        return "SUDAH BAYAR";
      default:
        return "SEMUA";
    }
  }

  int get asInt {
    switch (this) {
      case DOStatus.UNPAID:
        return 1;
      case DOStatus.PAID:
        return 2;
      default:
        return 0;
    }
  }
}

enum InsuranceStatus {
  ALL,
  ON_PROGRESS,
  FINISHED,
}

extension InsuranceStatusExt on InsuranceStatus {
  String get name {
    switch (this) {
      case InsuranceStatus.ON_PROGRESS:
        return "BELUM SELESAI";
      case InsuranceStatus.FINISHED:
        return "SELESAI";
      default:
        return "SEMUA";
    }
  }

  int get asInt {
    switch (this) {
      case InsuranceStatus.ON_PROGRESS:
        return 1;
      case InsuranceStatus.FINISHED:
        return 2;
      default:
        return 0;
    }
  }
}
