param webSiteName string
param location string = resourceGroup().location
param planName string

resource appService 'Microsoft.Web/sites@2022-03-01' = {
  name: webSiteName
  location: location
  properties: {
    serverFarmId: planName
    siteConfig: {
      windowsFxVersion: 'dotnetcore|6.0'
      alwaysOn: true
    }
  }
}
