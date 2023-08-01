@echo off
for %%i in (netty/*.proto) do (
  d:/TestCode/protoc.exe --proto_path=./netty  --java_out=../../java  ./netty/%%i
  echo generate %%i to java file successfully!
)
