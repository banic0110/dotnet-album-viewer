# escape=`
FROM mcr.microsoft.com/dotnet/sdk:2.1 AS builder

WORKDIR /album-viewer
COPY AlbumViewerNetCore.sln .
COPY src/AlbumViewerNetCore/AlbumViewerNetCore.csproj src/AlbumViewerNetCore/AlbumViewerNetCore.csproj
COPY src/AlbumViewerBusiness/AlbumViewerBusiness.csproj src/AlbumViewerBusiness/AlbumViewerBusiness.csproj
COPY src/Westwind.Utilities/Westwind.Utilities.csproj src/Westwind.Utilities/Westwind.Utilities.csproj
RUN dotnet restore src/AlbumViewerNetCore/AlbumViewerNetCore.csproj

COPY src src
RUN dotnet publish ./src/AlbumViewerNetCore/AlbumViewerNetCore.csproj

# app image
FROM mcr.microsoft.com/dotnet/aspnet:2.1

WORKDIR /album-viewer
COPY --from=builder /album-viewer/src/AlbumViewerNetCore/bin/Debug/netcoreapp2.0/publish/ .
CMD ["dotnet", "AlbumViewerNetCore.dll"]
