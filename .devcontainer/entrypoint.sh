#!/bin/bash
rm -f /app/tmp/pids/server.pid
exec "$@"
