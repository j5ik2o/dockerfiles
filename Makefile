DOCKER=sudo docker
DOCKER_BUILD=$(DOCKER) build
DOCKER_BUILD_NOCACHE=$(DOCKER) build --no-cache=true
BASE_NAME = $(patsubst .%.d,%, $(1)) 

.%.d:
	$(DOCKER_BUILD) -t j5ik2o/$(call BASE_NAME, $@) $(call BASE_NAME, $@)
	touch $@

all: .crowd.d .jira.d .confluence.d .stash.d

.base-with-tomcat7.d: .base.d

.base.d:

.crowd.d: .base-with-tomcat7.d

.jira.d: .base-with-tomcat7.d

.confluence.d: .base-with-tomcato7.d

.stash.d: .base-with-tomcat7.d



