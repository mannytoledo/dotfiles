function airlock_auth {
    AIRLOCK=$(curl -s -X GET -H "Authorization: token $AIRLOCK_GITHUB_ACCESS_TOKEN" "$AIRLOCK_URL/v1/permissions?component=flight_director&response_type=jwt")
    AUTH=$(echo "$AIRLOCK" | jq -r '.token')
    echo $AUTH
}
