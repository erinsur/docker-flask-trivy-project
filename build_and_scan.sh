#!/bin/bash
docker build -t my-first-app .
trivy image --exit-code 1 --severity HIGH,CRITICAL my-first-app