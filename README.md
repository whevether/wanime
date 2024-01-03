# wanime
## 动漫之家
`更新依赖`
### 更新日志
[2023-01-03] 增加多语言 命令 1: `dart run intl_translation:extract_to_arb --output-dir=i10n-arb lib/i18n/localization_intl.dart`  命令 2: `dart run intl_translation:generate_from_arb --output-dir=lib/i18n --no-use-deferred-loading lib/i18n/localization_intl.dart i10n-arb/intl_*.arb`