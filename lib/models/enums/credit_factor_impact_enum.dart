enum CreditFactorImpactEnum {
 high,
  medium,
  low,
}

extension CreditFactorImpactEnumExtension on CreditFactorImpactEnum {
  String get name {
    switch (this) {
      case CreditFactorImpactEnum.high:
        return 'High Impact';
      case CreditFactorImpactEnum.medium:
        return 'Medium Impact';
      case CreditFactorImpactEnum.low:
        return 'Low Impact';
      default:
        return '';
    }
  }
}