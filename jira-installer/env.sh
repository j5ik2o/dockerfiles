NAME=jira

mkdir -p files/dl && cd files/dl
[ -e atlassian-jira-6.2.5-x64.bin ] || wget http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-6.2.5-x64.bin
cd ../../
