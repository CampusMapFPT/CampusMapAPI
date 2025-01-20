FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app
COPY ./CampusMapAPI /app
RUN dotnet publish ./CampusMapAPI/WebAPI.csproj -o ./publish/

FROM mcr.microsoft.com/dotnet/sdk:7.0
COPY --from=build /app/publish ./
ENTRYPOINT ["dotnet", "WebAPI.dll"]