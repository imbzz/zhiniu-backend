@echo off
for %%i in (grpc/*.proto) do (
  d:/TestCode/protoc.exe --plugin=protoc-gen-grpc-java=d:/TestCode/protoc-grpc.exe --java_out=../../java --grpc-java_out=../../java ./grpc/%%i
  echo generate %%i to java file successfully!
)

