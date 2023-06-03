# dotnet version 7 baseImage
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

WORKDIR /source

# Copy csproj files
COPY *.csproj .

# All dependencies we need
RUN dotnet restore

# Copy and publish app files

COPY . .
RUN dotnet publish -c release