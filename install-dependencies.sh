#!/usr/bin/env bash
wget https://pocoproject.org/releases/poco-1.7.5/poco-1.7.5-all.zip
wget https://github.com/gabime/spdlog/archive/v0.10.0.zip
wget https://dev.mysql.com/get/Downloads/Connector-C/mysql-connector-c-6.1.11-linux-glibc2.12-i686.tar.gz
unzip -qq v0.10.0.zip
unzip -qq poco-1.7.5-all.zip
tar -zxf mysql-connector-c-6.1.11-linux-glibc2.12-i686.tar.gz
mv poco-1.7.5-all poco
mv mysql-connector-c-6.1.11-linux-glibc2.12-i686 mysql
mv extension/Linux32-gcc poco/build/config/
mv spdlog-0.10.0/include/spdlog extension/include
cd poco
./configure --config=Linux32-gcc --static --shared --no-samples --no-tests --include-path=~/build/*/R3/mysql/include --library-path=~/build/*/R3/mysql/lib --omit=CppUnit,CppUnit/WinTestRunner,Net,Crypto,NetSSL_OpenSSL,NetSSL_Win,Data/SQLite,Data/ODBC,Zip,PageCompiler,PageCompiler/File2Page,PDF,CppParser,MongoDB,PocoDoc,ProGen
make -s
