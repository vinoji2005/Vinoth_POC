<#
.SYNOPSIS
    Deploys Azure resources using ARM template and parameter files.
.DESCRIPTION
    This script uses Azure CLI to deploy infrastructure defined in the ARM template.
.NOTES
    Author: Vinoth Subbiah
    Modified: $(Get-Date)
#>

param (
    [string]$resourceGroupName = "rg-iac-poc",
    [string]$location = "eastus"
)

Write-Host "🔐 Logging into Azure..."
az account show > $null 2>&1
if ($LASTEXITCODE -ne 0) {
    az login
    if ($LASTEXITCODE -ne 0) {
        Write-Error "❌ Azure login failed. Exiting."
        exit 1
    }
}

Write-Host "🔍 Checking if resource group exists..."
$rgExists = az group exists --name $resourceGroupName --output tsv
if ($rgExists -eq "false") {
    Write-Host "📦 Creating resource group: $resourceGroupName in $location"
    az group create --name $resourceGroupName --location $location | Out-Null
}

Write-Host "🚀 Starting deployment of ARM template..."
az deployment group create `
  --resource-group $resourceGroupName `
  --template-file "../templates/mainTemplate.json" `
  --parameters "../templates/parameters.json"

if ($LASTEXITCODE -ne 0) {
    Write-Error "❌ Deployment failed."
    exit 1
}

Write-Host "✅ Deployment completed successfully."
