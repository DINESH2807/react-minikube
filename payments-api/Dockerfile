# Use the official .NET SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY ./payments-api/*.csproj ./
RUN dotnet restore

# Copy everything else and build the app
COPY ./payments-api/ ./
RUN dotnet publish -c Release -o out

# Use the official ASP.NET Core runtime as the base image
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app

# Copy the published output from the build step
COPY --from=build-env /app/out .

# Expose the port the app runs on
EXPOSE 80

# Run the application
ENTRYPOINT ["dotnet", "payments-api.dll"]
