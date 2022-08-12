# log4d

dart的c/s 结构，用于远程打印log到本地

## Document

vscode安装log viewer插件或者自行使用能够监听process.log的软件

## 终端操作
cd ../bin
dart log4d.dart -o ../rqyuyin/process.log -h localip // 启动本地服务器，默认端口8899
dart log4d.dart -o ../rqyuyin/process.log -h localip -p 10086// 启动本地服务器，指定端口10086

## flutter项目里操作(DEBUG环境下)
await RQLogOutput.initRemoteLog('172.18.4.208');
await RQLogOutput.initRemoteLog('172.18.4.208', port: 10086);

## LICENSE
