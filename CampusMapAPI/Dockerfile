
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["CampusMapAPI.sln", "./"]
COPY ["CampusMapAPI/WebAPI.csproj", "CampusMapAPI/"]
COPY ["Infracstructure/Infracstructures.csproj", "Infracstructure/"]
COPY ["Application/Application.csproj", "Application/"]
COPY ["Domain/Domain.csproj", "Domain/"]
RUN dotnet restore "CampusMapAPI.sln"
COPY . .
WORKDIR "/src"
RUN dotnet build "CampusMapAPI.sln" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "CampusMapAPI.sln" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebAPI.dll"]