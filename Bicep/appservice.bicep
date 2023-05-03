param appname string
param location string = resourceGroup().location
param skucode string

@allowed([
  'windows'
])
param osType string

resource name_resource 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appname
  location: location
  kind: ''
  tags: {}
  properties: {
    reserved: false
  }
  sku: {
    name: skucode
  }
}
