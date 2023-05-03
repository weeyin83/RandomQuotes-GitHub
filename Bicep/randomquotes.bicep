param webSiteName string
param location string = resourceGroup().location
param appname string
param skucode string

@allowed([
  'windows'
])
param osType string

// App service plan
module aspModule 'appservice.bicep' = {
  name:'appServicePlan'
  params:{
    appname:appname
    location:location
    skucode:skucode
    osType:osType
  }
}

// App service deployment
module randomquotesweb 'webapp.bicep' = {
  name:'productservicewebapp'
  params:{
    webSiteName:webSiteName
    location:location
    planName:appname
  }
  dependsOn:[
    aspModule
  ] 
}
