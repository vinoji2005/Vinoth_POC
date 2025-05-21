<#
.SYNOPSIS
    Cleans up the Azure resource group created by the ARM deployment.
.DESCRIPTION
    Deletes the specified resource group from the Azure subscription.
.NOTES
    Author: Vinoth Subbiah
#>

param (
    [string]$resourceGroupName = "rg-iac-poc"
)

Write-Host "🧹 Starting cleanup of resource group: $resourceGroupName"

$rgExists = az group exists --name $resourceGroupName --output tsv
if ($rgExists -eq "true") {
    az group delete --name $resourceGroupName --yes --no-wait
    Write-Host "✅ Resource group deletion initiated. This may take a few minutes."
} else {
    Write-Host "⚠️ Resource group $resourceGroupName does not exist. Nothing to clean."
}
