
set -e

for CHART in $(ls -1 charts | grep -v "aws-appmesh-grafana" | grep -v "aws-appmesh-prometheus"); do

  CHART_VERSION=$(cat charts/$CHART/Chart.yaml | sed -n 's/^version: \([0-9]*\.[0-9]*\.[0-9]*\).*$/\1/p')
  REPO_URL=$(cat charts/$CHART/Chart.yaml | sed -n 's/^home: https:\/\/github.com\/\(.*\)$/\1/p')
  REPO_VERSION=$(curl -s https://api.github.com/repos/${REPO_URL}/tags | jq -r first.name | sed 's/^v//')

  if [ "${CHART_VERSION}" == "${REPO_VERSION}" ]; then 
    echo "$CHART is up to date ($CHART_VERSION)";
    continue
  fi

  echo "$CHART needs updating from ${CHART_VERSION} to ${REPO_VERSION}"

done
