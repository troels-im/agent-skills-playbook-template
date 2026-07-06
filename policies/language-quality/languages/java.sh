#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/../../.."
. policies/language-quality/languages/_lib.sh

has_language_files '\.java$' || { note "No Java files found."; exit 0; }

if [ -x ./gradlew ] && grep -Eq 'checkstyle|spotbugs|pmd' build.gradle build.gradle.kts settings.gradle settings.gradle.kts 2>/dev/null; then
  ./gradlew check
elif has_command mvn && grep -Eq 'maven-checkstyle-plugin|spotbugs|pmd' pom.xml 2>/dev/null; then
  mvn -q -DskipTests verify
else
  note "Java lint skipped: no configured Gradle/Maven static-analysis task."
fi

if [ -x ./gradlew ] && grep -q javadoc build.gradle build.gradle.kts 2>/dev/null; then
  ./gradlew javadoc
elif has_command mvn && grep -q maven-javadoc-plugin pom.xml 2>/dev/null; then
  mvn -q -DskipTests javadoc:javadoc
else
  note "Java documentation check skipped: no configured Javadoc task."
fi
