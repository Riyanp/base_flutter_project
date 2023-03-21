build_apk_develop:
	@echo "╠ Building DEVELOP APK"
	@flutter build apk --release --flavor develop --target lib/main_develop.dart --target-platform android-arm,android-arm64

build_aab_develop:
	@echo "╠ Building DEVELOP AAB"
	@flutter build appbundle --release --flavor develop --target lib/main_develop.dart --target-platform android-arm,android-arm64

build_apk_staging:
	@echo "╠ Building Staging APK"
	@flutter build apk --release --flavor staging --target lib/main_staging.dart --target-platform android-arm,android-arm64

build_aab_staging:
	@echo "╠ Building STAGING AAB"
	@flutter build appbundle --release --flavor staging --target lib/main_staging.dart --target-platform android-arm,android-arm64

build_apk_prod:
	@echo "╠ Building PRODUCTION APK"
	@flutter build apk --release --flavor production --target-platform android-arm,android-arm64

build_aab_production:
	@echo "╠ Building PRODUCTION AAB"
	@flutter build appbundle --release --flavor production --target-platform android-arm,android-arm64