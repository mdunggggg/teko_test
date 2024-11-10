ifeq ($(OS),Windows_NT)
    BUILD_CMD=.\build_and_run_app.bat
    METRICS_CMD=.\tools\dart_code_metrics.bat
    COMMIT_CHECK_CMD=.\tools\check_commit_message.bat
else
    BUILD_CMD=./build_and_run_app.sh
    METRICS_CMD=./tools/dart_code_metrics.sh
    COMMIT_CHECK_CMD=./tools/check_commit_message.sh
endif

get:
	flutter pub get

clean:
	flutter clean

reload_package:
	flutter clean && flutter pub get

run:
	dart run build_runner build --delete-conflicting-outputs

build_apk:
	flutter build apk --dart-define=DART_DEFINES_BASE_URL_HTTP="https://hiring-test.stag.tekoapis.net"

