# Java
jrun() { javac $1.java && java $1 && rm $1.class ;}
alias cu="gradle cucumber"
alias gbuild="gradle build"
alias gclean="gradle clean"

gtest() {
	if [ -z "$1" ]; then
		gradle test;
	else
		gradle test --tests *${1}*
	fi
}

# display when testing
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

# CSharp
alias .run='dotnet run'
alias 'debugon'='export VSTEST_HOST_DEBUG=1'
alias 'debugoff'='export VSTEST_HOST_DEBUG=0'
.build() { dotnet build; }
.init() { dotnet new console && dotnet restore; }
.restore() { dotnet restore; }
.console() { dotnet new console; }
.test() { dotnet test --filter Priority=${1:-1} --logger:"console;verbosity=detailed"; }
.testc() { dotnet test --filter ClassName=$1 --logger:"console;verbosity=detailed"; }
.testm() { dotnet test --filter Name~$1 --logger:"console;verbosity=detailed"; }
.testa() { dotnet test; }
.sln_add() { dotnet sln add $1; }
.ref_add() { dotnet add reference $1; }
.clean() { dotnet clean; }

# C++
cpp() { g++ $1.cpp -o $1 && ./$1 ;}
cc() { g++ $1.cc -o $1 && ./$1 ;}

# python
TRUST="--trusted-host pypi.org --trusted-host files.pythonhosted.org"
py_server() { python -m SimpleHTTPServer 8080; }


