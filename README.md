# 🚀 Azure Infrastructure as Code – PoC (Fioneer Challenge)

This repository demonstrates a **Proof of Concept (PoC)** to automate the deployment of basic Azure infrastructure using **ARM templates** and PowerShell. It’s intended to streamline infrastructure provisioning within an enterprise DevOps workflow.

---

## 📌 Features

- Deploys:
  - Azure Storage Account
  - Virtual Network with a default subnet
- Fully parameterized ARM template
- Azure CLI / PowerShell automation support
- Ready for CI/CD and extensible for future modules

---

## 🧪 One-Click Deployment

Click the button below to deploy this PoC directly into your Azure tenant:

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https://raw.githubusercontent.com/vinoji2005/Vinoth_POC/main/templates/mainTemplate.json)


> **Note**: Ensure your GitHub repository is public or that the reviewer has access if it’s private.

---

## 🧰 Manual Deployment via PowerShell

```bash
cd scripts
.\deploy.ps1 -resourceGroupName "rg-iac-poc" -location "eastus"
