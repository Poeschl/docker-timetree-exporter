#!/usr/bin/env sh
set -e

EXPORT_FILE="/data/timetree_export.ical"

if [ -z "$TIMETREE_EMAIL" ] || [ -z "$TIMETREE_PASSWORD" ]; then
  echo "TIMETREE_EMAIL and TIMETREE_PASSWORD must both be set. Exiting."
  exit 1
fi

EXTRA_ARGS=""
if [ -n "$TIMETREE_CALENDER_CODE" ]; then
  echo "Using calendar code: $TIMETREE_CALENDER_CODE"
  EXTRA_ARGS="--calendar_code $TIMETREE_CALENDER_CODE"
fi

# Email and password are passed as environment variables.
timetree-exporter \
  --output "$EXPORT_FILE" \
  $EXTRA_ARGS
