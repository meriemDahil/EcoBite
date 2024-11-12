
enum UserRole{
CUSTOMER, 
RESTAURANT_OWNER
}


extension UserRoleExtension on UserRole {
  String get name {
    switch (this) {
      case UserRole.RESTAURANT_OWNER:
        return 'RESTAURANT_OWNER';
     
      default:
        return 'CUSTOMER';
    }
  }
}