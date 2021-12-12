package_watch:
	flutter packages pub run build_runner watch --delete-conflicting-outputs

package_build:
	flutter packages pub run build_runner build --delete-conflicting-outputs

run:
	flutter run 

tests:
	flutter test