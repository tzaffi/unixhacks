#Environment variables that are provided by Jenkins:
JOB_URL=http://YOUR_JENKINS_URL/job/YOUR_JOB_NAME/
echo "JOB_URL=$JOB_URL"

BUILD_NUMBER=15
echo "BUILD_NUMBER=$BUILD_NUMBER"

#Subtract one (without bc):
PREV_BUILD_NUMBER=$((BUILD_NUMBER - 1))
echo "PREV_BUILD_NUMBER=$PREV_BUILD_NUMBER"

#Build Jenkin's API Query URL
PREV_BUILD_TIME_URL="${JOB_URL}${PREV_BUILD_NUMBER}/api/json?tree=timestamp"
echo "PREV_BUILD_TIME_URL=$PREV_BUILD_TIME_URL"

#Use Jenkins API to get last build time (in millesconds since epoch):
#  * curl to query the api
#  * use jq to parse the json value based on the key ".timestamp"
PREV_BUILD_TIME=`curl -s $PREV_BUILD_TIME_URL | jq -r '.timestamp'`
echo "PREV_BUILD_TIME=$PREV_BUILD_TIME"

#Use bc to convert that timestamp to seconds since the beginning of our epoch:
PREV_BUILD_TIME_SECS=`echo "(${PREV_BUILD_TIME} + 500) / 1000" | bc`
echo "PREV_BUILD_TIME_SECS=$PREV_BUILD_TIME_SECS"

#Use date to display the epoch time as a human readable date-time string
PREV_BUILD_TIME_HUMAN=`date -d @$PREV_BUILD_TIME_SECS`
echo "PREV_BUILD_TIME_HUMAN=$PREV_BUILD_TIME_HUMAN"

#Use date to current time in seconds since the beginning of the epoch:
CURR_TIME=`date +%s`
echo "CURR_TIME=$CURR_TIME"

#Simple math to get time span in seconds since last build:
SECONDS_SINCE_LAST_BUILD=$((CURR_TIME - PREV_BUILD_TIME_SECS))
echo "SECONDS_SINCE_LAST_BUILD=$SECONDS_SINCE_LAST_BUILD sec"
