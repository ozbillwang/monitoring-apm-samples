#!/usr/bin/env bash
pkill -15 agent
service datadog-agent start || true 
sleep 5
catalina.sh run
