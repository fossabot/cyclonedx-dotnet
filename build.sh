#!/bin/sh

VERSION=`cat semver.txt`
OUTPUT=./nupkgs

rm -f -R $OUTPUT

dotnet clean
dotnet restore
dotnet build --configuration Release
dotnet test
dotnet pack CycloneDX\\CycloneDX.csproj --configuration Release --version-suffix $VERSION --output $OUTPUT
