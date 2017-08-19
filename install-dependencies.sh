#!/usr/bin/env bash
wget https://pocoproject.org/releases/poco-1.7.5/poco-1.7.5-all.zip
wget https://github.com/gabime/spdlog/archive/v0.10.0.zip
unzip v0.10.0.zip
unzip poco-1.7.5-all.zip
mv Linux32-gcc poco-1.7.5-all/build/config/
mv spdlog-0.10.0/include/spdlog extension/include
cd poco-1.7.5-all
./configure --config=Linux32-gcc --static --shared --no-samples --no-tests --omit=CppUnit,CppUnit/WinTestRunner,Net,Crypto,NetSSL_OpenSSL,NetSSL_Win,Data/SQLite,Data/ODBC,Zip,PageCompiler,PageCompiler/File2Page,PDF,CppParser,MongoDB,PocoDoc,ProGen
make
