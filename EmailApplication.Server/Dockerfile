FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS base
WORKDIR /app
EXPOSE 5139

FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY ["EmailApplication.Server/EmailApplication.Server.csproj", "EmailApplication.Server/"]
COPY ["EmailApplication.Shared/EmailApplication.Shared.csproj", "EmailApplication.Shared/"]
RUN dotnet restore "EmailApplication.Server/EmailApplication.Server.csproj"
COPY . .
RUN dotnet publish "EmailApplication.Server/EmailApplication.Server.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "EmailApplication.Server.dll"]