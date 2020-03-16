#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://artem-stackbit.ngrok.io/project/5e6f50e96ef84e7bd3ee5a22/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://artem-stackbit.ngrok.io/pull/5e6f50e96ef84e7bd3ee5a22
curl -s -X POST https://artem-stackbit.ngrok.io/project/5e6f50e96ef84e7bd3ee5a22/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://artem-stackbit.ngrok.io/project/5e6f50e96ef84e7bd3ee5a22/webhook/build/publish > /dev/null
