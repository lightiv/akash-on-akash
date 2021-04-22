#!/usr/bin/env bash
docker run \
  --env-file env/definet \
  --publish-all \
  --name desmos-on-akash \
  --rm \
  desmos-on-akash:local
