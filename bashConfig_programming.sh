# Java
alias cu="gradle cucumber"
alias gbuild="gradle build"
alias gclean="gradle clean"

jrun() {
	javac $1.java && java $1 && rm $1.class
}

gtest() {
	if [ -z "$1" ]; then
		gradle test

	else
		gradle test --tests *${1}*
	fi
}

# display when testing
# the following goes in a gradle file

#test {
#    testLogging {
#        events "passed", "failed", "standardOut", "standardError"
#    }
#}

# tasks.withType(JavaExec) {
#    if (System.getProperty('DEBUG', 'false') == 'true') {
#        jvmArgs '-Xdebug', '-Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005'
#    }
#}

# gradle test --debug-jvm

# C# --------------------------------------------------------------------------------------
alias .run='dotnet run'
alias .build='dotnet build'
alias .clean='dotnet clean'
alias .restore='dotnet restore'
alias .test='dotnet test'
alias .init='dotnet new console && dotnet restore'
alias .console='dotnet new console'
alias .watch_build='dotnet watch build'
alias .watch_test='dotnet watch test'
alias .debugon='export VSTEST_HOST_DEBUG=1'
alias .debugoff='export VSTEST_HOST_DEBUG=0'

.testp() { .test --filter Priority=${1:-1} --logger:"console;verbosity=detailed"; }
.testm() { .test --filter Name~$1 --logger:"console;verbosity=detailed"; }
.testc() { .test --filter ClassName~$1 --logger:"console;verbosity=detailed"; }
.test_except_this() { .test --filter ClassName!~$1; }
.watch_testc() { .watch_test --filter ClassName~$1; }

.debug_test() {
	.debugon
	.testm $1
	.debugoff
}

.coverage() {
	repo=$(${1:-PWD})
	.kill
	dotnet test ${repo} \
	-p:CollectCoverage=true \
	-p:CoverletOutputFormat=\"json,opencover,lcov\" \
	-p:CoverletOutput="${repo}/" \
	-p:ExcludeByAttribute=\"Obsolete,GeneratedCodeAttribute,CompilerGeneratedAttribute\" ||
		die "Failed to run dotnet test"
}

.ref_add_to_sln() { dotnet sln add $1; }
.ref_rm_from_sln() { dotnet sln remove $1; }
.ref_add() { dotnet add reference $1; }
.kill() { kill dotnet; }

# C++ -------------------------------------------------------------------------------------
cpp() { g++ $1.cpp -o $1 && ./$1; }
cc() { g++ $1.cc -o $1 && ./$1; }

# YARN
alias yrs='yarn run start'
alias yrb='yarn run build'
alias yi='yarn install'

# python
TRUST="--trusted-host pypi.org --trusted-host files.pythonhosted.org"


