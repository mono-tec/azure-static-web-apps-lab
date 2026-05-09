// =====================================================
// Azure Static Web Apps サンプル構成
// =====================================================
// この Bicep は
// resourceGroup スコープでの実行を想定しています
//
// 事前に Resource Group を作成してください

// Azure リージョン
@description('Azure region')
param location string = 'japaneast'

// =====================================================
// URL 重複回避用サフィックス
// =====================================================

// Azure Static Web Apps は URL 名が重複すると
// 作成できないため、現在時刻を利用して
// 一意な名前を生成する
@description('Unique suffix for resource names')
param uniqueSuffix string = utcNow('yyyyMMddHHmmss')

// Static Web Apps 名
var staticWebAppName = 'swa-demo-${uniqueSuffix}'

// =====================================================
// Azure Static Web Apps
// =====================================================

resource staticWebApp 'Microsoft.Web/staticSites@2023-12-01' = {

  // Static Web Apps 名
  name: staticWebAppName

  // 配置リージョン
  location: location

  sku: {
    // Free プラン
    name: 'Free'
    tier: 'Free'
  }

  properties: {

    // GitHub Actions 連携時に利用
    repositoryUrl: 'https://github.com/mono-tec/azure-static-web-apps-lab'

    // 利用ブランチ
    branch: 'main'

    // アプリ配置場所
    buildProperties: {
      appLocation: '/'
      outputLocation: ''
    }
  }
}

// =====================================================
// 出力
// =====================================================

// 作成された Static Web Apps 名
output staticWebAppName string = staticWebApp.name

// 公開 URL
output defaultHostname string = staticWebApp.properties.defaultHostname