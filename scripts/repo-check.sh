#!/bin/bash
# repo-check.sh — one-line recent-commit summary for each of Jimmy's repos.
# Used by the morning briefing runbook. No personal data in output.
set -u
for repo in James Bran shiny-barnacle DropPilot; do
  line=$(github call-read-tool --name list_commits \
    --arguments-json "{\"owner\":\"s6ggrpgrzf-droid\",\"repo\":\"$repo\",\"perPage\":1}" 2>/dev/null \
    | python3 -c "
import json,sys
try:
    d=json.load(sys.stdin)
    c=json.loads(d['result']['content'][0]['text'])[0]['commit']
    msg=c['message'].split(chr(10))[0][:60]
    print(c['author']['date'][:16].replace('T',' ')+'  '+msg)
except Exception:
    print('no commit info')
")
  printf '%-15s %s\n' "$repo" "$line"
done
