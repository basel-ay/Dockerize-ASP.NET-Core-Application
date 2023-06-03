# First-stage dotnet version 7 baseImage
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

WORKDIR /source

# Copy csproj files and get all dependencies we need
COPY *.csproj .
RUN dotnet restore

# Copy and publish app files
COPY . .
RUN dotnet publish -c release -o /app

# Final-stage image
FROM mcr.microsoft.com/dotnet/aspnet:7.0

WORKDIR /app

COPY --from=build /app .

ENTRYPOINT [ "dotnet", "HRApp.dll" ]