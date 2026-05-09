@description('Static Web Apps resource name')
param name string

@description('Azure region. Free SKU supports a limited set of regions. eastasia is often convenient from Japan.')
param location string = 'eastasia'

@description('GitHub repository URL. Example: https://github.com/owner/repo')
param repositoryUrl string

@description('GitHub branch name')
param branch string = 'main'

resource staticWebApp 'Microsoft.Web/staticSites@2023-12-01' = {
  name: name
  location: location
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
    repositoryUrl: repositoryUrl
    branch: branch
    buildProperties: {
      appLocation: '/'
      apiLocation: ''
      appArtifactLocation: ''
    }
  }
}

output staticWebAppName string = staticWebApp.name
output defaultHostname string = staticWebApp.properties.defaultHostname
