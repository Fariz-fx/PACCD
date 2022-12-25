@secure()
param webhooks_paccd064407_serviceUri string

@secure()
param workbooks_523e27af_8980_4ba7_aeec_66972873f100_serializedData string
param vaults_fx_p_eu_paccd_01_kv_name string = 'fx-p-eu-paccd-01-kv'
param containerapps_fx_p_eu_paccd_01_ca_name string = 'fx-p-eu-paccd-01-ca'
param actionGroups_fx_p_eu_paccd_01_ag_name string = 'fx-p-eu-paccd-01-ag'
param components_fx_p_eu_paccd_01_appi_name string = 'fx-p-eu-paccd-01-appi'
param metricAlerts_fx_p_paccd_httpalert_name string = 'fx-p-paccd-httpalert'
param registries_fxpeupaccd01cr_name string = 'fxpeupaccd01cr'
param managedEnvironments_fx_p_eu_paccd_01_ace_name string = 'fx-p-eu-paccd-01-ace'
param databaseAccounts_fx_p_eu_paccd_01_cosmos_name string = 'fx-p-eu-paccd-01-cosmos'
param workspaces_fx_p_eu_paccd_01_log_name string = 'fx-p-eu-paccd-01-log'
param workbooks_523e27af_8980_4ba7_aeec_66972873f100_name string = '523e27af-8980-4ba7-aeec-66972873f100'
param actionRules_fx_p_paccd_alertprocesingrule_name string = 'fx-p-paccd-alertprocesingrule'
param webtests_get_cosmos_request_fx_p_eu_paccd_01_appi_name string = 'get cosmos request-fx-p-eu-paccd-01-appi'
param metricalerts_get_cosmos_request_fx_p_eu_paccd_01_appi_name string = 'get cosmos request-fx-p-eu-paccd-01-appi'
param webtests_test_swagger_paccd_url_fx_p_eu_paccd_01_appi_name string = 'test swagger paccd url-fx-p-eu-paccd-01-appi'
param webtests_home_paccd_url_for_test_fx_p_eu_paccd_01_appi_name string = 'home paccd url  for test-fx-p-eu-paccd-01-appi'
param dashboards_c0e521e5_c101_407c_be19_6eb3db9f43aa_dashboard_name string = 'c0e521e5-c101-407c-be19-6eb3db9f43aa-dashboard'
param metricalerts_test_swagger_paccd_url_fx_p_eu_paccd_01_appi_name string = 'test swagger paccd url-fx-p-eu-paccd-01-appi'
param webtests_custom_metric_health_check_fx_p_eu_paccd_01_appi_name string = 'custom metric health check-fx-p-eu-paccd-01-appi'
param webtests_delete_cosmos_health_check_fx_p_eu_paccd_01_appi_name string = 'delete cosmos health check-fx-p-eu-paccd-01-appi'
param webtests_put_cosmos_db_health_check_fx_p_eu_paccd_01_appi_name string = 'put cosmos db health check-fx-p-eu-paccd-01-appi'
param metricalerts_home_paccd_url_for_test_fx_p_eu_paccd_01_appi_name string = 'home paccd url  for test-fx-p-eu-paccd-01-appi'
param webtests_post_cosmos_data_health_check_fx_p_eu_paccd_01_appi_name string = 'post cosmos data health check-fx-p-eu-paccd-01-appi'
param metricalerts_custom_metric_health_check_fx_p_eu_paccd_01_appi_name string = 'custom metric health check-fx-p-eu-paccd-01-appi'
param metricalerts_delete_cosmos_health_check_fx_p_eu_paccd_01_appi_name string = 'delete cosmos health check-fx-p-eu-paccd-01-appi'
param metricalerts_put_cosmos_db_health_check_fx_p_eu_paccd_01_appi_name string = 'put cosmos db health check-fx-p-eu-paccd-01-appi'
param metricalerts_post_cosmos_data_health_check_fx_p_eu_paccd_01_appi_name string = 'post cosmos data health check-fx-p-eu-paccd-01-appi'
param smartdetectoralertrules_failure_anomalies_fx_p_eu_paccd_01_appi_name string = 'failure anomalies - fx-p-eu-paccd-01-appi'
param actiongroups_application_insights_smart_detection_externalid string = '/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourceGroups/rg-test/providers/microsoft.insights/actiongroups/application insights smart detection'

resource managedEnvironments_fx_p_eu_paccd_01_ace_name_resource 'Microsoft.App/managedEnvironments@2022-06-01-preview' = {
  name: managedEnvironments_fx_p_eu_paccd_01_ace_name
  location: 'eastus'
  sku: {
    name: 'Consumption'
  }
  properties: {
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: '99ed9e3c-1990-4682-9ef6-92747657dd10'
      }
    }
    zoneRedundant: false
    customDomainConfiguration: {
    }
  }
}

resource registries_fxpeupaccd01cr_name_resource 'Microsoft.ContainerRegistry/registries@2022-02-01-preview' = {
  name: registries_fxpeupaccd01cr_name
  location: 'eastus'
  sku: {
    name: 'Basic'
    tier: 'Basic'
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    adminUserEnabled: true
    policies: {
      quarantinePolicy: {
        status: 'disabled'
      }
      trustPolicy: {
        type: 'Notary'
        status: 'disabled'
      }
      retentionPolicy: {
        days: 7
        status: 'disabled'
      }
      exportPolicy: {
        status: 'enabled'
      }
      azureADAuthenticationAsArmPolicy: {
        status: 'enabled'
      }
      softDeletePolicy: {
        retentionDays: 7
        status: 'disabled'
      }
    }
    encryption: {
      status: 'disabled'
    }
    dataEndpointEnabled: false
    publicNetworkAccess: 'Enabled'
    networkRuleBypassOptions: 'AzureServices'
    zoneRedundancy: 'Disabled'
    anonymousPullEnabled: false
  }
}

resource databaseAccounts_fx_p_eu_paccd_01_cosmos_name_resource 'Microsoft.DocumentDB/databaseAccounts@2022-08-15' = {
  name: databaseAccounts_fx_p_eu_paccd_01_cosmos_name
  location: 'West US'
  tags: {
    defaultExperience: 'Core (SQL)'
    'hidden-cosmos-mmspecial': ''
  }
  kind: 'GlobalDocumentDB'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    publicNetworkAccess: 'Enabled'
    enableAutomaticFailover: false
    enableMultipleWriteLocations: false
    isVirtualNetworkFilterEnabled: false
    virtualNetworkRules: []
    disableKeyBasedMetadataWriteAccess: false
    enableFreeTier: false
    enableAnalyticalStorage: false
    analyticalStorageConfiguration: {
      schemaType: 'WellDefined'
    }
    createMode: 'Default'
    databaseAccountOfferType: 'Standard'
    defaultIdentity: 'FirstPartyIdentity'
    networkAclBypass: 'None'
    disableLocalAuth: false
    enablePartitionMerge: false
    consistencyPolicy: {
      defaultConsistencyLevel: 'Session'
      maxIntervalInSeconds: 5
      maxStalenessPrefix: 100
    }
    locations: [
      {
        locationName: 'West US'
        provisioningState: 'Succeeded'
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
    cors: []
    capabilities: [
      {
        name: 'EnableServerless'
      }
    ]
    ipRules: []
    backupPolicy: {
      type: 'Continuous'
    }
    networkAclBypassResourceIds: []
    capacity: {
      totalThroughputLimit: 4000
    }
    keysMetadata: {
    }
  }
}

resource actionGroups_fx_p_eu_paccd_01_ag_name_resource 'microsoft.insights/actionGroups@2022-06-01' = {
  name: actionGroups_fx_p_eu_paccd_01_ag_name
  location: 'SwedenCentral'
  properties: {
    groupShortName: 't-eu-paccd'
    enabled: true
    emailReceivers: [
      {
        name: 'PACCD Testers_-EmailAction-'
        emailAddress: 'Frenchcloud@outlook.com'
        useCommonAlertSchema: true
      }
    ]
    smsReceivers: []
    webhookReceivers: []
    eventHubReceivers: []
    itsmReceivers: []
    azureAppPushReceivers: []
    automationRunbookReceivers: []
    voiceReceivers: []
    logicAppReceivers: []
    azureFunctionReceivers: []
    armRoleReceivers: []
  }
}

resource webtests_custom_metric_health_check_fx_p_eu_paccd_01_appi_name_resource 'microsoft.insights/webtests@2022-06-15' = {
  name: webtests_custom_metric_health_check_fx_p_eu_paccd_01_appi_name
  location: 'eastus'
  tags: {
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourceGroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/components/fx-p-eu-paccd-01-appi': 'Resource'
  }
  properties: {
    SyntheticMonitorId: webtests_custom_metric_health_check_fx_p_eu_paccd_01_appi_name
    Name: 'Custom metric Health Check'
    Enabled: true
    Frequency: 300
    Timeout: 120
    Kind: 'standard'
    RetryEnabled: true
    Locations: [
      {
        Id: 'us-tx-sn1-azr'
      }
      {
        Id: 'latam-br-gru-edge'
      }
      {
        Id: 'us-ca-sjc-azr'
      }
      {
        Id: 'apac-hk-hkn-azr'
      }
      {
        Id: 'emea-nl-ams-azr'
      }
    ]
    Request: {
      RequestUrl: 'https://fx-p-eu-paccd-01-ca.wittyforest-11fef98c.eastus.azurecontainerapps.io/docs#/default/log_custom_metric_log_custom_metric_get'
      HttpVerb: 'GET'
      ParseDependentRequests: true
    }
    ValidationRules: {
      ExpectedHttpStatusCode: 200
      SSLCheck: true
      SSLCertRemainingLifetimeCheck: 7
    }
  }
}

resource webtests_delete_cosmos_health_check_fx_p_eu_paccd_01_appi_name_resource 'microsoft.insights/webtests@2022-06-15' = {
  name: webtests_delete_cosmos_health_check_fx_p_eu_paccd_01_appi_name
  location: 'eastus'
  tags: {
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourceGroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/components/fx-p-eu-paccd-01-appi': 'Resource'
  }
  properties: {
    SyntheticMonitorId: webtests_delete_cosmos_health_check_fx_p_eu_paccd_01_appi_name
    Name: 'Delete Cosmos Health Check'
    Enabled: true
    Frequency: 300
    Timeout: 120
    Kind: 'standard'
    RetryEnabled: true
    Locations: [
      {
        Id: 'us-tx-sn1-azr'
      }
      {
        Id: 'us-ca-sjc-azr'
      }
      {
        Id: 'us-fl-mia-edge'
      }
      {
        Id: 'apac-sg-sin-azr'
      }
      {
        Id: 'emea-nl-ams-azr'
      }
    ]
    Request: {
      RequestUrl: 'https://fx-p-eu-paccd-01-ca.wittyforest-11fef98c.eastus.azurecontainerapps.io/docs#/todos/delete_todo_todos_delete_delete'
      HttpVerb: 'GET'
      ParseDependentRequests: true
    }
    ValidationRules: {
      ExpectedHttpStatusCode: 200
      SSLCheck: true
      SSLCertRemainingLifetimeCheck: 7
    }
  }
}

resource webtests_get_cosmos_request_fx_p_eu_paccd_01_appi_name_resource 'microsoft.insights/webtests@2022-06-15' = {
  name: webtests_get_cosmos_request_fx_p_eu_paccd_01_appi_name
  location: 'eastus'
  tags: {
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourceGroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/components/fx-p-eu-paccd-01-appi': 'Resource'
  }
  properties: {
    SyntheticMonitorId: webtests_get_cosmos_request_fx_p_eu_paccd_01_appi_name
    Name: 'Get Cosmos Request'
    Enabled: true
    Frequency: 300
    Timeout: 120
    Kind: 'standard'
    RetryEnabled: true
    Locations: [
      {
        Id: 'us-fl-mia-edge'
      }
      {
        Id: 'latam-br-gru-edge'
      }
      {
        Id: 'us-va-ash-azr'
      }
      {
        Id: 'apac-hk-hkn-azr'
      }
      {
        Id: 'emea-fr-pra-edge'
      }
    ]
    Request: {
      RequestUrl: 'https://fx-p-eu-paccd-01-ca.wittyforest-11fef98c.eastus.azurecontainerapps.io/docs#/todos/list_todos_todos_listall_get'
      HttpVerb: 'GET'
      ParseDependentRequests: true
    }
    ValidationRules: {
      ExpectedHttpStatusCode: 200
      SSLCheck: true
      SSLCertRemainingLifetimeCheck: 7
    }
  }
}

resource webtests_home_paccd_url_for_test_fx_p_eu_paccd_01_appi_name_resource 'microsoft.insights/webtests@2022-06-15' = {
  name: webtests_home_paccd_url_for_test_fx_p_eu_paccd_01_appi_name
  location: 'eastus'
  tags: {
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourceGroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/components/fx-p-eu-paccd-01-appi': 'Resource'
  }
  properties: {
    SyntheticMonitorId: webtests_home_paccd_url_for_test_fx_p_eu_paccd_01_appi_name
    Name: 'Home PACCD URL  for Test'
    Enabled: false
    Frequency: 300
    Timeout: 120
    Kind: 'ping'
    RetryEnabled: true
    Locations: [
      {
        Id: 'us-ca-sjc-azr'
      }
      {
        Id: 'emea-ch-zrh-edge'
      }
      {
        Id: 'us-va-ash-azr'
      }
      {
        Id: 'apac-hk-hkn-azr'
      }
      {
        Id: 'latam-br-gru-edge'
      }
    ]
    Configuration: {
      WebTest: '<WebTest         Name="Home PACCD URL  for Test"         Id="77048788-32e9-4118-a85f-9b2057946f83"         Enabled="True"         CssProjectStructure=""         CssIteration=""         Timeout="120"         WorkItemIds=""         xmlns="http://microsoft.com/schemas/VisualStudio/TeamTest/2010"         Description=""         CredentialUserName=""         CredentialPassword=""         PreAuthenticate="True"         Proxy="default"         StopOnError="False"         RecordedResultFile=""         ResultsLocale="">        <Items>        <Request         Method="GET"         Guid="a1cf45ab-3ff3-cb98-be66-c2de34011423"         Version="1.1"         Url="https://fx-p-eu-paccd-01-ca.wittyforest-11fef98c.eastus.azurecontainerapps.io"         ThinkTime="0"         Timeout="120"         ParseDependentRequests="False"         FollowRedirects="True"         RecordResult="True"         Cache="False"         ResponseTimeGoal="0"         Encoding="utf-8"         ExpectedHttpStatusCode="200"         ExpectedResponseUrl=""         ReportingName=""         IgnoreHttpStatusCode="False" />        </Items>        </WebTest>'
    }
  }
}

resource webtests_post_cosmos_data_health_check_fx_p_eu_paccd_01_appi_name_resource 'microsoft.insights/webtests@2022-06-15' = {
  name: webtests_post_cosmos_data_health_check_fx_p_eu_paccd_01_appi_name
  location: 'eastus'
  tags: {
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourceGroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/components/fx-p-eu-paccd-01-appi': 'Resource'
  }
  properties: {
    SyntheticMonitorId: webtests_post_cosmos_data_health_check_fx_p_eu_paccd_01_appi_name
    Name: 'Post Cosmos Data Health Check'
    Enabled: true
    Frequency: 300
    Timeout: 120
    Kind: 'standard'
    RetryEnabled: true
    Locations: [
      {
        Id: 'us-il-ch1-azr'
      }
      {
        Id: 'us-tx-sn1-azr'
      }
      {
        Id: 'us-fl-mia-edge'
      }
      {
        Id: 'apac-jp-kaw-edge'
      }
      {
        Id: 'emea-se-sto-edge'
      }
    ]
    Request: {
      RequestUrl: 'https://fx-p-eu-paccd-01-ca.wittyforest-11fef98c.eastus.azurecontainerapps.io/docs#/todos/create_todo_todos_insert_post'
      HttpVerb: 'GET'
      ParseDependentRequests: true
    }
    ValidationRules: {
      ExpectedHttpStatusCode: 200
      SSLCheck: true
      SSLCertRemainingLifetimeCheck: 7
    }
  }
}

resource webtests_put_cosmos_db_health_check_fx_p_eu_paccd_01_appi_name_resource 'microsoft.insights/webtests@2022-06-15' = {
  name: webtests_put_cosmos_db_health_check_fx_p_eu_paccd_01_appi_name
  location: 'eastus'
  tags: {
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourceGroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/components/fx-p-eu-paccd-01-appi': 'Resource'
  }
  properties: {
    SyntheticMonitorId: webtests_put_cosmos_db_health_check_fx_p_eu_paccd_01_appi_name
    Name: 'PUT Cosmos DB Health Check'
    Enabled: true
    Frequency: 300
    Timeout: 120
    Kind: 'standard'
    RetryEnabled: true
    Locations: [
      {
        Id: 'latam-br-gru-edge'
      }
      {
        Id: 'us-tx-sn1-azr'
      }
      {
        Id: 'us-ca-sjc-azr'
      }
      {
        Id: 'apac-jp-kaw-edge'
      }
      {
        Id: 'emea-se-sto-edge'
      }
    ]
    Request: {
      RequestUrl: 'https://fx-p-eu-paccd-01-ca.wittyforest-11fef98c.eastus.azurecontainerapps.io/docs#/todos/replace_todo_todos_update_put'
      HttpVerb: 'GET'
      ParseDependentRequests: true
    }
    ValidationRules: {
      ExpectedHttpStatusCode: 200
      SSLCheck: true
      SSLCertRemainingLifetimeCheck: 7
    }
  }
}

resource webtests_test_swagger_paccd_url_fx_p_eu_paccd_01_appi_name_resource 'microsoft.insights/webtests@2022-06-15' = {
  name: webtests_test_swagger_paccd_url_fx_p_eu_paccd_01_appi_name
  location: 'eastus'
  tags: {
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourceGroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/components/fx-p-eu-paccd-01-appi': 'Resource'
  }
  properties: {
    SyntheticMonitorId: webtests_test_swagger_paccd_url_fx_p_eu_paccd_01_appi_name
    Name: 'Test Swagger PACCD URL'
    Enabled: false
    Frequency: 300
    Timeout: 120
    Kind: 'standard'
    RetryEnabled: true
    Locations: [
      {
        Id: 'latam-br-gru-edge'
      }
      {
        Id: 'us-va-ash-azr'
      }
      {
        Id: 'us-ca-sjc-azr'
      }
      {
        Id: 'apac-hk-hkn-azr'
      }
      {
        Id: 'emea-au-syd-edge'
      }
    ]
    Request: {
      RequestUrl: 'https://fx-p-eu-paccd-01-ca.wittyforest-11fef98c.eastus.azurecontainerapps.io/docs'
      HttpVerb: 'GET'
      ParseDependentRequests: false
    }
    ValidationRules: {
      ExpectedHttpStatusCode: 200
      SSLCheck: true
      SSLCertRemainingLifetimeCheck: 1
    }
  }
}

resource vaults_fx_p_eu_paccd_01_kv_name_resource 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: vaults_fx_p_eu_paccd_01_kv_name
  location: 'eastus'
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: 'e8025bb3-4e73-4053-9f06-56d3f64c7e75'
    accessPolicies: [
      {
        tenantId: 'e8025bb3-4e73-4053-9f06-56d3f64c7e75'
        objectId: '7ddfa4cf-1707-48fc-a6c9-593ceecb86a9'
        permissions: {
          keys: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'GetRotationPolicy'
            'SetRotationPolicy'
            'Rotate'
          ]
          secrets: [
            'Get'
            'List'
            'Set'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
          ]
          certificates: [
            'Get'
            'List'
            'Update'
            'Create'
            'Import'
            'Delete'
            'Recover'
            'Backup'
            'Restore'
            'ManageContacts'
            'ManageIssuers'
            'GetIssuers'
            'ListIssuers'
            'SetIssuers'
            'DeleteIssuers'
          ]
        }
      }
      {
        tenantId: 'e8025bb3-4e73-4053-9f06-56d3f64c7e75'
        objectId: '7b177fae-4169-4d64-b876-3de94b251e6d'
        permissions: {
          certificates: []
          keys: []
          secrets: [
            'Get'
            'List'
          ]
        }
      }
    ]
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    enableSoftDelete: true
    softDeleteRetentionInDays: 7
    enableRbacAuthorization: false
    vaultUri: 'https://${vaults_fx_p_eu_paccd_01_kv_name}.vault.azure.net/'
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_resource 'microsoft.operationalinsights/workspaces@2021-12-01-preview' = {
  name: workspaces_fx_p_eu_paccd_01_log_name
  location: 'eastus'
  properties: {
    sku: {
      name: 'pergb2018'
    }
    retentionInDays: 30
    features: {
      enableLogAccessUsingOnlyResourcePermissions: true
    }
    workspaceCapping: {
      dailyQuotaGb: -1
    }
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

resource dashboards_c0e521e5_c101_407c_be19_6eb3db9f43aa_dashboard_name_resource 'Microsoft.Portal/dashboards@2020-09-01-preview' = {
  name: dashboards_c0e521e5_c101_407c_be19_6eb3db9f43aa_dashboard_name
  location: 'eastus'
  tags: {
    'hidden-title': 'fx-p-eu-paccd-01-appi Dashboard'
  }
  properties: {
    lenses: [
      {
        order: 0
        parts: [
          {
            position: {
              x: 0
              y: 0
              rowSpan: 1
              colSpan: 2
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/AspNetOverviewPinnedPart'
            }
          }
          {
            position: {
              x: 2
              y: 0
              rowSpan: 1
              colSpan: 1
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/ProactiveDetectionAsyncPart'
            }
          }
          {
            position: {
              x: 3
              y: 0
              rowSpan: 1
              colSpan: 1
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/QuickPulseButtonSmallPart'
            }
          }
          {
            position: {
              x: 4
              y: 0
              rowSpan: 1
              colSpan: 1
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
                {
                }
                {
                }
                {
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/WebTestsPinnedPart'
            }
          }
          {
            position: {
              x: 5
              y: 0
              rowSpan: 1
              colSpan: 1
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
                {
                }
                {
                }
                {
                }
                {
                }
                {
                }
                {
                }
                {
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/ApplicationMapPart'
              settings: {
              }
            }
          }
          {
            position: {
              x: 0
              y: 1
              rowSpan: 1
              colSpan: 3
            }
            metadata: {
              inputs: []
              type: 'Extension/HubsExtension/PartType/MarkdownPart'
              settings: {
                content: {
                  settings: {
                    content: '# Usage'
                  }
                }
              }
            }
          }
          {
            position: {
              x: 3
              y: 1
              rowSpan: 1
              colSpan: 1
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/UsageUsersOverviewPart'
            }
          }
          {
            position: {
              x: 4
              y: 1
              rowSpan: 1
              colSpan: 3
            }
            metadata: {
              inputs: []
              type: 'Extension/HubsExtension/PartType/MarkdownPart'
              settings: {
                content: {
                  settings: {
                    content: '# Reliability'
                  }
                }
              }
            }
          }
          {
            position: {
              x: 7
              y: 1
              rowSpan: 1
              colSpan: 1
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
                {
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/CuratedBladeFailuresPinnedPart'
            }
          }
          {
            position: {
              x: 8
              y: 1
              rowSpan: 1
              colSpan: 3
            }
            metadata: {
              inputs: []
              type: 'Extension/HubsExtension/PartType/MarkdownPart'
              settings: {
                content: {
                  settings: {
                    content: '# Responsiveness\r\n'
                  }
                }
              }
            }
          }
          {
            position: {
              x: 11
              y: 1
              rowSpan: 1
              colSpan: 1
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
                {
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/CuratedBladePerformancePinnedPart'
            }
          }
          {
            position: {
              x: 12
              y: 1
              rowSpan: 1
              colSpan: 3
            }
            metadata: {
              inputs: []
              type: 'Extension/HubsExtension/PartType/MarkdownPart'
              settings: {
                content: {
                  settings: {
                    content: '# Browser'
                  }
                }
              }
            }
          }
          {
            position: {
              x: 15
              y: 1
              rowSpan: 1
              colSpan: 1
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
                {
                }
                {
                }
                {
                }
                {
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/MetricsExplorerBladePinnedPart'
            }
          }
          {
            position: {
              x: 0
              y: 2
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                }
              }
            }
          }
          {
            position: {
              x: 4
              y: 2
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                }
              }
            }
          }
          {
            position: {
              x: 8
              y: 2
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                }
              }
            }
          }
          {
            position: {
              x: 12
              y: 2
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                }
              }
            }
          }
          {
            position: {
              x: 0
              y: 5
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                }
              }
            }
          }
          {
            position: {
              x: 4
              y: 5
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                }
              }
            }
          }
          {
            position: {
              x: 8
              y: 5
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                }
              }
            }
          }
          {
            position: {
              x: 12
              y: 5
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                }
              }
            }
          }
          {
            position: {
              x: 0
              y: 8
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                }
              }
            }
          }
          {
            position: {
              x: 4
              y: 8
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                }
              }
            }
          }
          {
            position: {
              x: 8
              y: 8
              rowSpan: 3
              colSpan: 4
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
              ]
              type: 'Extension/HubsExtension/PartType/MonitorChartPart'
              settings: {
                content: {
                }
              }
            }
          }
          {
            position: {
              x: 0
              y: 11
              rowSpan: 4
              colSpan: 6
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
                {
                }
                {
                }
                {
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/FailuresCuratedPinnedChartPart'
            }
          }
          {
            position: {
              x: 6
              y: 11
              rowSpan: 4
              colSpan: 6
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
                {
                }
                {
                }
                {
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/FailuresCuratedPinnedChartPart'
            }
          }
          {
            position: {
              x: 0
              y: 15
              rowSpan: 4
              colSpan: 6
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
                {
                }
                {
                }
                {
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/PerformanceCuratedPinnedChartPart'
            }
          }
          {
            position: {
              x: 6
              y: 15
              rowSpan: 4
              colSpan: 6
            }
            metadata: {
              inputs: [
                {
                }
                {
                }
                {
                }
                {
                }
                {
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/PerformanceCuratedPinnedChartPart'
            }
          }
          {
            position: {
              x: 0
              y: 19
              rowSpan: 4
              colSpan: 6
            }
            metadata: {
              inputs: [
                {
                }
              ]
              type: 'Extension/AppInsightsExtension/PartType/AllWebTestsResponseTimeFullGalleryAdapterPart'
            }
          }
        ]
      }
    ]
    metadata: {
      model: {
      }
    }
  }
}

resource smartdetectoralertrules_failure_anomalies_fx_p_eu_paccd_01_appi_name_resource 'microsoft.alertsmanagement/smartdetectoralertrules@2021-04-01' = {
  name: smartdetectoralertrules_failure_anomalies_fx_p_eu_paccd_01_appi_name
  location: 'global'
  properties: {
    description: 'Failure Anomalies notifies you of an unusual rise in the rate of failed HTTP requests or dependency calls.'
    state: 'Enabled'
    severity: 'Sev3'
    frequency: 'PT1M'
    detector: {
      id: 'FailureAnomaliesDetector'
    }
    scope: [
      components_fx_p_eu_paccd_01_appi_name_resource.id
    ]
    actionGroups: {
      groupIds: [
        actiongroups_application_insights_smart_detection_externalid
      ]
    }
  }
}

resource containerapps_fx_p_eu_paccd_01_ca_name_resource 'Microsoft.App/containerapps@2022-06-01-preview' = {
  name: containerapps_fx_p_eu_paccd_01_ca_name
  location: 'East US'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    managedEnvironmentId: managedEnvironments_fx_p_eu_paccd_01_ace_name_resource.id
    environmentId: managedEnvironments_fx_p_eu_paccd_01_ace_name_resource.id
    configuration: {
      secrets: [
        {
          name: 'fxpeupaccd01crazurecrio-fxpeupaccd01cr'
        }
        {
          name: 'reg-pswd-dc6c2806-b7c6'
        }
        {
          name: 'azure-cosmos-listconnectionstringurl-8d0cc'
        }
        {
          name: 'azure-cosmos-resourceendpoint-e7347'
        }
        {
          name: 'azure-cosmos-scope-465bd'
        }
      ]
      activeRevisionsMode: 'Single'
      ingress: {
        external: true
        targetPort: 3100
        exposedPort: 0
        transport: 'Auto'
        traffic: [
          {
            weight: 100
            latestRevision: true
          }
        ]
        allowInsecure: false
      }
      registries: [
        {
          server: 'fxpeupaccd01cr.azurecr.io'
          username: 'fxpeupaccd01cr'
          passwordSecretRef: 'fxpeupaccd01crazurecrio-fxpeupaccd01cr'
        }
      ]
    }
    template: {
      containers: [
        {
          image: 'fxpeupaccd01cr.azurecr.io/${containerapps_fx_p_eu_paccd_01_ca_name}:2036939f575e319a85cd055b96aa00c5720f1ecb'
          name: containerapps_fx_p_eu_paccd_01_ca_name
          env: [
            {
              name: 'URI'
              value: 'https://ub-t-wu-fenesys-01-cosmos.documents.azure.com:443/'
            }
            {
              name: 'KEY'
              value: 'bjXKUV14GWSjMOlLqnGJbvLGZog53Xr0i3S4pFDstboLmuFHqDNUOUNEqQfyjBioHrItXkHkXV2dACDbuzbPqQ=='
            }
            {
              name: 'AZURE_COSMOS_LISTCONNECTIONSTRINGURL'
              secretRef: 'azure-cosmos-listconnectionstringurl-8d0cc'
            }
            {
              name: 'AZURE_COSMOS_RESOURCEENDPOINT'
              secretRef: 'azure-cosmos-resourceendpoint-e7347'
            }
            {
              name: 'AZURE_COSMOS_SCOPE'
              secretRef: 'azure-cosmos-scope-465bd'
            }
            {
              name: 'AZURE_KEY_VAULT_ENDPOINT'
              value: 'https://fx-p-eu-paccd-01-kv.vault.azure.net/'
            }
            {
              name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
              value: 'InstrumentationKey=ad879281-228c-4fbd-82c5-59a129798251;IngestionEndpoint=https://eastus-8.in.applicationinsights.azure.com/;LiveEndpoint=https://eastus.livediagnostics.monitor.azure.com/'
            }
          ]
          resources: {
            cpu: '0.25'
            memory: '0.5Gi'
          }
          probes: []
        }
      ]
      scale: {
        minReplicas: 0
        maxReplicas: 10
      }
    }
  }
}

resource containerapps_fx_p_eu_paccd_01_ca_name_current 'Microsoft.App/containerApps/sourcecontrols@2022-06-01-preview' = {
  parent: containerapps_fx_p_eu_paccd_01_ca_name_resource
  name: 'current'
  properties: {
    repoUrl: 'https://github.com/Fariz-fx/PACCD'
    branch: 'main'
    githubActionConfiguration: {
      registryInfo: {
        registryUrl: 'fxpeupaccd01cr.azurecr.io'
        registryUserName: 'fxpeupaccd01cr'
      }
      contextPath: './'
      image: 'fx-p-eu-paccd-01-ca:\${{ github.sha }}'
    }
  }
}

resource registries_fxpeupaccd01cr_name_repositories_admin 'Microsoft.ContainerRegistry/registries/scopeMaps@2022-02-01-preview' = {
  parent: registries_fxpeupaccd01cr_name_resource
  name: '_repositories_admin'
  properties: {
    description: 'Can perform all read, write and delete operations on the registry'
    actions: [
      'repositories/*/metadata/read'
      'repositories/*/metadata/write'
      'repositories/*/content/read'
      'repositories/*/content/write'
      'repositories/*/content/delete'
    ]
  }
}

resource registries_fxpeupaccd01cr_name_repositories_pull 'Microsoft.ContainerRegistry/registries/scopeMaps@2022-02-01-preview' = {
  parent: registries_fxpeupaccd01cr_name_resource
  name: '_repositories_pull'
  properties: {
    description: 'Can pull any repository of the registry'
    actions: [
      'repositories/*/content/read'
    ]
  }
}

resource registries_fxpeupaccd01cr_name_repositories_push 'Microsoft.ContainerRegistry/registries/scopeMaps@2022-02-01-preview' = {
  parent: registries_fxpeupaccd01cr_name_resource
  name: '_repositories_push'
  properties: {
    description: 'Can push to any repository of the registry'
    actions: [
      'repositories/*/content/read'
      'repositories/*/content/write'
    ]
  }
}

resource registries_fxpeupaccd01cr_name_paccd064407 'Microsoft.ContainerRegistry/registries/webhooks@2022-02-01-preview' = {
  parent: registries_fxpeupaccd01cr_name_resource
  name: 'paccd064407'
  location: 'eastus'
  properties: {
    status: 'enabled'
    scope: 'fenesys:3755589533'
    actions: [
      'push'
    ]
    serviceUri: webhooks_paccd064407_serviceUri
  }
}

resource databaseAccounts_fx_p_eu_paccd_01_cosmos_name_todo_db 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2022-08-15' = {
  parent: databaseAccounts_fx_p_eu_paccd_01_cosmos_name_resource
  name: 'todo-db'
  properties: {
    resource: {
      id: 'todo-db'
    }
  }
}

resource databaseAccounts_fx_p_eu_paccd_01_cosmos_name_00000000_0000_0000_0000_000000000001 'Microsoft.DocumentDB/databaseAccounts/sqlRoleDefinitions@2022-08-15' = {
  parent: databaseAccounts_fx_p_eu_paccd_01_cosmos_name_resource
  name: '00000000-0000-0000-0000-000000000001'
  properties: {
    roleName: 'Cosmos DB Built-in Data Reader'
    type: 'BuiltInRole'
    assignableScopes: [
      databaseAccounts_fx_p_eu_paccd_01_cosmos_name_resource.id
    ]
    permissions: [
      {
        dataActions: [
          'Microsoft.DocumentDB/databaseAccounts/readMetadata'
          'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/executeQuery'
          'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/readChangeFeed'
          'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/read'
        ]
        notDataActions: []
      }
    ]
  }
}

resource databaseAccounts_fx_p_eu_paccd_01_cosmos_name_00000000_0000_0000_0000_000000000002 'Microsoft.DocumentDB/databaseAccounts/sqlRoleDefinitions@2022-08-15' = {
  parent: databaseAccounts_fx_p_eu_paccd_01_cosmos_name_resource
  name: '00000000-0000-0000-0000-000000000002'
  properties: {
    roleName: 'Cosmos DB Built-in Data Contributor'
    type: 'BuiltInRole'
    assignableScopes: [
      databaseAccounts_fx_p_eu_paccd_01_cosmos_name_resource.id
    ]
    permissions: [
      {
        dataActions: [
          'Microsoft.DocumentDB/databaseAccounts/readMetadata'
          'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/*'
          'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/*'
        ]
        notDataActions: []
      }
    ]
  }
}

resource components_fx_p_eu_paccd_01_appi_name_resource 'microsoft.insights/components@2020-02-02' = {
  name: components_fx_p_eu_paccd_01_appi_name
  location: 'eastus'
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Redfield'
    Request_Source: 'IbizaAIExtension'
    RetentionInDays: 90
    WorkspaceResourceId: workspaces_fx_p_eu_paccd_01_log_name_resource.id
    IngestionMode: 'LogAnalytics'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

resource components_fx_p_eu_paccd_01_appi_name_degradationindependencyduration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_fx_p_eu_paccd_01_appi_name_resource
  name: 'degradationindependencyduration'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'degradationindependencyduration'
      DisplayName: 'Degradation in dependency duration'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_fx_p_eu_paccd_01_appi_name_degradationinserverresponsetime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_fx_p_eu_paccd_01_appi_name_resource
  name: 'degradationinserverresponsetime'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'degradationinserverresponsetime'
      DisplayName: 'Degradation in server response time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_fx_p_eu_paccd_01_appi_name_digestMailConfiguration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_fx_p_eu_paccd_01_appi_name_resource
  name: 'digestMailConfiguration'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'digestMailConfiguration'
      DisplayName: 'Digest Mail Configuration'
      Description: 'This rule describes the digest mail preferences'
      HelpUrl: 'www.homail.com'
      IsHidden: true
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_fx_p_eu_paccd_01_appi_name_extension_billingdatavolumedailyspikeextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_fx_p_eu_paccd_01_appi_name_resource
  name: 'extension_billingdatavolumedailyspikeextension'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_billingdatavolumedailyspikeextension'
      DisplayName: 'Abnormal rise in daily data volume (preview)'
      Description: 'This detection rule automatically analyzes the billing data generated by your application, and can warn you about an unusual increase in your application\'s billing costs'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/tree/master/SmartDetection/billing-data-volume-daily-spike.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_fx_p_eu_paccd_01_appi_name_extension_canaryextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_fx_p_eu_paccd_01_appi_name_resource
  name: 'extension_canaryextension'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_canaryextension'
      DisplayName: 'Canary extension'
      Description: 'Canary extension'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/'
      IsHidden: true
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_fx_p_eu_paccd_01_appi_name_extension_exceptionchangeextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_fx_p_eu_paccd_01_appi_name_resource
  name: 'extension_exceptionchangeextension'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_exceptionchangeextension'
      DisplayName: 'Abnormal rise in exception volume (preview)'
      Description: 'This detection rule automatically analyzes the exceptions thrown in your application, and can warn you about unusual patterns in your exception telemetry.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/abnormal-rise-in-exception-volume.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_fx_p_eu_paccd_01_appi_name_extension_memoryleakextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_fx_p_eu_paccd_01_appi_name_resource
  name: 'extension_memoryleakextension'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_memoryleakextension'
      DisplayName: 'Potential memory leak detected (preview)'
      Description: 'This detection rule automatically analyzes the memory consumption of each process in your application, and can warn you about potential memory leaks or increased memory consumption.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/tree/master/SmartDetection/memory-leak.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_fx_p_eu_paccd_01_appi_name_extension_securityextensionspackage 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_fx_p_eu_paccd_01_appi_name_resource
  name: 'extension_securityextensionspackage'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_securityextensionspackage'
      DisplayName: 'Potential security issue detected (preview)'
      Description: 'This detection rule automatically analyzes the telemetry generated by your application and detects potential security issues.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/application-security-detection-pack.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_fx_p_eu_paccd_01_appi_name_extension_traceseveritydetector 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_fx_p_eu_paccd_01_appi_name_resource
  name: 'extension_traceseveritydetector'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'extension_traceseveritydetector'
      DisplayName: 'Degradation in trace severity ratio (preview)'
      Description: 'This detection rule automatically analyzes the trace logs emitted from your application, and can warn you about unusual patterns in the severity of your trace telemetry.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/degradation-in-trace-severity-ratio.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_fx_p_eu_paccd_01_appi_name_longdependencyduration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_fx_p_eu_paccd_01_appi_name_resource
  name: 'longdependencyduration'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'longdependencyduration'
      DisplayName: 'Long dependency duration'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_fx_p_eu_paccd_01_appi_name_migrationToAlertRulesCompleted 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_fx_p_eu_paccd_01_appi_name_resource
  name: 'migrationToAlertRulesCompleted'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'migrationToAlertRulesCompleted'
      DisplayName: 'Migration To Alert Rules Completed'
      Description: 'A configuration that controls the migration state of Smart Detection to Smart Alerts'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: true
      IsEnabledByDefault: false
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: false
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_fx_p_eu_paccd_01_appi_name_slowpageloadtime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_fx_p_eu_paccd_01_appi_name_resource
  name: 'slowpageloadtime'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'slowpageloadtime'
      DisplayName: 'Slow page load time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_fx_p_eu_paccd_01_appi_name_slowserverresponsetime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_fx_p_eu_paccd_01_appi_name_resource
  name: 'slowserverresponsetime'
  location: 'eastus'
  properties: {
    RuleDefinitions: {
      Name: 'slowserverresponsetime'
      DisplayName: 'Slow server response time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource workbooks_523e27af_8980_4ba7_aeec_66972873f100_name_resource 'microsoft.insights/workbooks@2022-04-01' = {
  name: workbooks_523e27af_8980_4ba7_aeec_66972873f100_name
  location: 'eastus'
  tags: {
    'hidden-workitemworkbook': 'GitHub'
    'hidden-title': 'Test'
  }
  kind: 'shared'
  identity: {
    type: 'None'
  }
  properties: {
    displayName: 'Test'
    version: '1.0'
    category: 'workItems'
    sourceId: components_fx_p_eu_paccd_01_appi_name_resource.id
    serializedData: workbooks_523e27af_8980_4ba7_aeec_66972873f100_serializedData
  }
}

resource vaults_fx_p_eu_paccd_01_kv_name_Azure_Cosmos_Key 'Microsoft.KeyVault/vaults/secrets@2022-07-01' = {
  parent: vaults_fx_p_eu_paccd_01_kv_name_resource
  name: 'Azure-Cosmos-Key'
  location: 'eastus'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_fx_p_eu_paccd_01_kv_name_Azure_Cosmos_URI 'Microsoft.KeyVault/vaults/secrets@2022-07-01' = {
  parent: vaults_fx_p_eu_paccd_01_kv_name_resource
  name: 'Azure-Cosmos-URI'
  location: 'eastus'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_General_AlphabeticallySortedComputers 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_General|AlphabeticallySortedComputers'
  properties: {
    displayName: 'All Computers with their most recent data'
    category: 'General Exploration'
    query: 'search not(ObjectName == "Advisor Metrics" or ObjectName == "ManagedSpace") | summarize AggregatedValue = max(TimeGenerated) by Computer | limit 500000 | sort by Computer asc\r\n// Oql: NOT(ObjectName="Advisor Metrics" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) by Computer | top 500000 | Sort Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_General_dataPointsPerManagementGroup 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_General|dataPointsPerManagementGroup'
  properties: {
    displayName: 'Which Management Group is generating the most data points?'
    category: 'General Exploration'
    query: 'search * | summarize AggregatedValue = count() by ManagementGroupName\r\n// Oql: * | Measure count() by ManagementGroupName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_General_dataTypeDistribution 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_General|dataTypeDistribution'
  properties: {
    displayName: 'Distribution of data Types'
    category: 'General Exploration'
    query: 'search * | extend Type = $table | summarize AggregatedValue = count() by Type\r\n// Oql: * | Measure count() by Type // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_General_StaleComputers 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_General|StaleComputers'
  properties: {
    displayName: 'Stale Computers (data older than 24 hours)'
    category: 'General Exploration'
    query: 'search not(ObjectName == "Advisor Metrics" or ObjectName == "ManagedSpace") | summarize lastdata = max(TimeGenerated) by Computer | limit 500000 | where lastdata < ago(24h)\r\n// Oql: NOT(ObjectName="Advisor Metrics" OR ObjectName=ManagedSpace) | measure max(TimeGenerated) as lastdata by Computer | top 500000 | where lastdata < NOW-24HOURS // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_AllEvents 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|AllEvents'
  properties: {
    displayName: 'All Events'
    category: 'Log Management'
    query: 'Event | sort by TimeGenerated desc\r\n// Oql: Type=Event // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_AllSyslog 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|AllSyslog'
  properties: {
    displayName: 'All Syslogs'
    category: 'Log Management'
    query: 'Syslog | sort by TimeGenerated desc\r\n// Oql: Type=Syslog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_AllSyslogByFacility 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|AllSyslogByFacility'
  properties: {
    displayName: 'All Syslog Records grouped by Facility'
    category: 'Log Management'
    query: 'Syslog | summarize AggregatedValue = count() by Facility\r\n// Oql: Type=Syslog | Measure count() by Facility // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_AllSyslogByProcess 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|AllSyslogByProcessName'
  properties: {
    displayName: 'All Syslog Records grouped by ProcessName'
    category: 'Log Management'
    query: 'Syslog | summarize AggregatedValue = count() by ProcessName\r\n// Oql: Type=Syslog | Measure count() by ProcessName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_AllSyslogsWithErrors 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|AllSyslogsWithErrors'
  properties: {
    displayName: 'All Syslog Records with Errors'
    category: 'Log Management'
    query: 'Syslog | where SeverityLevel == "error" | sort by TimeGenerated desc\r\n// Oql: Type=Syslog SeverityLevel=error // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_AverageHTTPRequestTimeByClientIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|AverageHTTPRequestTimeByClientIPAddress'
  properties: {
    displayName: 'Average HTTP Request time by Client IP Address'
    category: 'Log Management'
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by cIP\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_AverageHTTPRequestTimeHTTPMethod 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|AverageHTTPRequestTimeHTTPMethod'
  properties: {
    displayName: 'Average HTTP Request time by HTTP Method'
    category: 'Log Management'
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = avg(TimeTaken) by csMethod\r\n// Oql: Type=W3CIISLog | Measure Avg(TimeTaken) by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_CountIISLogEntriesClientIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|CountIISLogEntriesClientIPAddress'
  properties: {
    displayName: 'Count of IIS Log Entries by Client IP Address'
    category: 'Log Management'
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by cIP\r\n// Oql: Type=W3CIISLog | Measure count() by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_CountIISLogEntriesHTTPRequestMethod 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|CountIISLogEntriesHTTPRequestMethod'
  properties: {
    displayName: 'Count of IIS Log Entries by HTTP Request Method'
    category: 'Log Management'
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csMethod\r\n// Oql: Type=W3CIISLog | Measure count() by csMethod // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_CountIISLogEntriesHTTPUserAgent 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|CountIISLogEntriesHTTPUserAgent'
  properties: {
    displayName: 'Count of IIS Log Entries by HTTP User Agent'
    category: 'Log Management'
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUserAgent\r\n// Oql: Type=W3CIISLog | Measure count() by csUserAgent // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_CountOfIISLogEntriesByHostRequestedByClient 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|CountOfIISLogEntriesByHostRequestedByClient'
  properties: {
    displayName: 'Count of IIS Log Entries by Host requested by client'
    category: 'Log Management'
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csHost\r\n// Oql: Type=W3CIISLog | Measure count() by csHost // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_CountOfIISLogEntriesByURLForHost 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|CountOfIISLogEntriesByURLForHost'
  properties: {
    displayName: 'Count of IIS Log Entries by URL for the host "www.contoso.com" (replace with your own)'
    category: 'Log Management'
    query: 'search csHost == "www.contoso.com" | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog csHost="www.contoso.com" | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_CountOfIISLogEntriesByURLRequestedByClient 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|CountOfIISLogEntriesByURLRequestedByClient'
  properties: {
    displayName: 'Count of IIS Log Entries by URL requested by client (without query strings)'
    category: 'Log Management'
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_CountOfWarningEvents 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|CountOfWarningEvents'
  properties: {
    displayName: 'Count of Events with level "Warning" grouped by Event ID'
    category: 'Log Management'
    query: 'Event | where EventLevelName == "warning" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event EventLevelName=warning | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_DisplayBreakdownRespondCodes 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|DisplayBreakdownRespondCodes'
  properties: {
    displayName: 'Shows breakdown of response codes'
    category: 'Log Management'
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by scStatus\r\n// Oql: Type=W3CIISLog | Measure count() by scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_EventsByEventLog 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|EventsByEventLog'
  properties: {
    displayName: 'Count of Events grouped by Event Log'
    category: 'Log Management'
    query: 'Event | summarize AggregatedValue = count() by EventLog\r\n// Oql: Type=Event | Measure count() by EventLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_EventsByEventsID 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|EventsByEventsID'
  properties: {
    displayName: 'Count of Events grouped by Event ID'
    category: 'Log Management'
    query: 'Event | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_EventsByEventSource 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|EventsByEventSource'
  properties: {
    displayName: 'Count of Events grouped by Event Source'
    category: 'Log Management'
    query: 'Event | summarize AggregatedValue = count() by Source\r\n// Oql: Type=Event | Measure count() by Source // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_EventsInOMBetween2000to3000 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|EventsInOMBetween2000to3000'
  properties: {
    displayName: 'Events in the Operations Manager Event Log whose Event ID is in the range between 2000 and 3000'
    category: 'Log Management'
    query: 'Event | where EventLog == "Operations Manager" and EventID >= 2000 and EventID <= 3000 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog="Operations Manager" EventID:[2000..3000] // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_EventsWithStartedinEventID 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|EventsWithStartedinEventID'
  properties: {
    displayName: 'Count of Events containing the word "started" grouped by EventID'
    category: 'Log Management'
    query: 'search in (Event) "started" | summarize AggregatedValue = count() by EventID\r\n// Oql: Type=Event "started" | Measure count() by EventID // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_FindMaximumTimeTakenForEachPage 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|FindMaximumTimeTakenForEachPage'
  properties: {
    displayName: 'Find the maximum time taken for each page'
    category: 'Log Management'
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = max(TimeTaken) by csUriStem\r\n// Oql: Type=W3CIISLog | Measure Max(TimeTaken) by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_IISLogEntriesForClientIP 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|IISLogEntriesForClientIP'
  properties: {
    displayName: 'IIS Log Entries for a specific client IP Address (replace with your own)'
    category: 'Log Management'
    query: 'search cIP == "192.168.0.1" | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc | project csUriStem, scBytes, csBytes, TimeTaken, scStatus\r\n// Oql: Type=W3CIISLog cIP="192.168.0.1" | Select csUriStem,scBytes,csBytes,TimeTaken,scStatus // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_ListAllIISLogEntries 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|ListAllIISLogEntries'
  properties: {
    displayName: 'All IIS Log Entries'
    category: 'Log Management'
    query: 'search * | extend Type = $table | where Type == W3CIISLog | sort by TimeGenerated desc\r\n// Oql: Type=W3CIISLog // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_NoOfConnectionsToOMSDKService 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|NoOfConnectionsToOMSDKService'
  properties: {
    displayName: 'How many connections to Operations Manager\'s SDK service by day'
    category: 'Log Management'
    query: 'Event | where EventID == 26328 and EventLog == "Operations Manager" | summarize AggregatedValue = count() by bin(TimeGenerated, 1d) | sort by TimeGenerated desc\r\n// Oql: Type=Event EventID=26328 EventLog="Operations Manager" | Measure count() interval 1DAY // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_ServerRestartTime 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|ServerRestartTime'
  properties: {
    displayName: 'When did my servers initiate restart?'
    category: 'Log Management'
    query: 'search in (Event) "shutdown" and EventLog == "System" and Source == "User32" and EventID == 1074 | sort by TimeGenerated desc | project TimeGenerated, Computer\r\n// Oql: shutdown Type=Event EventLog=System Source=User32 EventID=1074 | Select TimeGenerated,Computer // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_Show404PagesList 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|Show404PagesList'
  properties: {
    displayName: 'Shows which pages people are getting a 404 for'
    category: 'Log Management'
    query: 'search scStatus == 404 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by csUriStem\r\n// Oql: Type=W3CIISLog scStatus=404 | Measure count() by csUriStem // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_ShowServersThrowingInternalServerError 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|ShowServersThrowingInternalServerError'
  properties: {
    displayName: 'Shows servers that are throwing internal server error'
    category: 'Log Management'
    query: 'search scStatus == 500 | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = count() by sComputerName\r\n// Oql: Type=W3CIISLog scStatus=500 | Measure count() by sComputerName // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_TotalBytesReceivedByEachAzureRoleInstance 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|TotalBytesReceivedByEachAzureRoleInstance'
  properties: {
    displayName: 'Total Bytes received by each Azure Role Instance'
    category: 'Log Management'
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by RoleInstance\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by RoleInstance // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_TotalBytesReceivedByEachIISComputer 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|TotalBytesReceivedByEachIISComputer'
  properties: {
    displayName: 'Total Bytes received by each IIS Computer'
    category: 'Log Management'
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by Computer | limit 500000\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_TotalBytesRespondedToClientsByClientIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|TotalBytesRespondedToClientsByClientIPAddress'
  properties: {
    displayName: 'Total Bytes responded back to clients by Client IP Address'
    category: 'Log Management'
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_TotalBytesRespondedToClientsByEachIISServerIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|TotalBytesRespondedToClientsByEachIISServerIPAddress'
  properties: {
    displayName: 'Total Bytes responded back to clients by each IIS ServerIP Address'
    category: 'Log Management'
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(scBytes) by sIP\r\n// Oql: Type=W3CIISLog | Measure Sum(scBytes) by sIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_TotalBytesSentByClientIPAddress 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|TotalBytesSentByClientIPAddress'
  properties: {
    displayName: 'Total Bytes sent by Client IP Address'
    category: 'Log Management'
    query: 'search * | extend Type = $table | where Type == W3CIISLog | summarize AggregatedValue = sum(csBytes) by cIP\r\n// Oql: Type=W3CIISLog | Measure Sum(csBytes) by cIP // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PEF: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_WarningEvents 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|WarningEvents'
  properties: {
    displayName: 'All Events with level "Warning"'
    category: 'Log Management'
    query: 'Event | where EventLevelName == "warning" | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLevelName=warning // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_WindowsFireawallPolicySettingsChanged 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|WindowsFireawallPolicySettingsChanged'
  properties: {
    displayName: 'Windows Firewall Policy settings have changed'
    category: 'Log Management'
    query: 'Event | where EventLog == "Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" and EventID == 2008 | sort by TimeGenerated desc\r\n// Oql: Type=Event EventLog="Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" EventID=2008 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LogManagement_workspaces_fx_p_eu_paccd_01_log_name_LogManagement_WindowsFireawallPolicySettingsChangedByMachines 'Microsoft.OperationalInsights/workspaces/savedSearches@2020-08-01' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LogManagement(${workspaces_fx_p_eu_paccd_01_log_name})_LogManagement|WindowsFireawallPolicySettingsChangedByMachines'
  properties: {
    displayName: 'On which machines and how many times have Windows Firewall Policy settings changed'
    category: 'Log Management'
    query: 'Event | where EventLog == "Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" and EventID == 2008 | summarize AggregatedValue = count() by Computer | limit 500000\r\n// Oql: Type=Event EventLog="Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" EventID=2008 | measure count() by Computer | top 500000 // Args: {OQ: True; WorkspaceId: 00000000-0000-0000-0000-000000000000} // Settings: {PTT: True; SortI: True; SortF: True} // Version: 0.1.122'
    version: 2
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AACAudit 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AACAudit'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AACAudit'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AACHttpRequest 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AACHttpRequest'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AACHttpRequest'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AADB2CRequestLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AADB2CRequestLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADB2CRequestLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AADDomainServicesAccountLogon 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AADDomainServicesAccountLogon'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesAccountLogon'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AADDomainServicesAccountManagement 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AADDomainServicesAccountManagement'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesAccountManagement'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AADDomainServicesDirectoryServiceAccess 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AADDomainServicesDirectoryServiceAccess'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesDirectoryServiceAccess'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AADDomainServicesLogonLogoff 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AADDomainServicesLogonLogoff'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesLogonLogoff'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AADDomainServicesPolicyChange 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AADDomainServicesPolicyChange'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesPolicyChange'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AADDomainServicesPrivilegeUse 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AADDomainServicesPrivilegeUse'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesPrivilegeUse'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AADDomainServicesSystemSecurity 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AADDomainServicesSystemSecurity'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADDomainServicesSystemSecurity'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AADManagedIdentitySignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AADManagedIdentitySignInLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADManagedIdentitySignInLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AADNonInteractiveUserSignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AADNonInteractiveUserSignInLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADNonInteractiveUserSignInLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AADProvisioningLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AADProvisioningLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADProvisioningLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AADRiskyServicePrincipals 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AADRiskyServicePrincipals'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADRiskyServicePrincipals'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AADRiskyUsers 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AADRiskyUsers'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADRiskyUsers'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AADServicePrincipalRiskEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AADServicePrincipalRiskEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADServicePrincipalRiskEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AADServicePrincipalSignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AADServicePrincipalSignInLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADServicePrincipalSignInLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AADUserRiskEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AADUserRiskEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AADUserRiskEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ABSBotRequests 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ABSBotRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ABSBotRequests'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ABSChannelToBotRequests 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ABSChannelToBotRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ABSChannelToBotRequests'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ABSDependenciesRequests 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ABSDependenciesRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ABSDependenciesRequests'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ACICollaborationAudit 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ACICollaborationAudit'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACICollaborationAudit'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ACRConnectedClientList 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ACRConnectedClientList'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACRConnectedClientList'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ACSAuthIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ACSAuthIncomingOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSAuthIncomingOperations'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ACSBillingUsage 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ACSBillingUsage'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSBillingUsage'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ACSCallAutomationIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ACSCallAutomationIncomingOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSCallAutomationIncomingOperations'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ACSCallDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ACSCallDiagnostics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSCallDiagnostics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ACSCallRecordingSummary 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ACSCallRecordingSummary'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSCallRecordingSummary'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ACSCallSummary 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ACSCallSummary'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSCallSummary'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ACSChatIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ACSChatIncomingOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSChatIncomingOperations'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ACSEmailSendMailOperational 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ACSEmailSendMailOperational'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSEmailSendMailOperational'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ACSEmailStatusUpdateOperational 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ACSEmailStatusUpdateOperational'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSEmailStatusUpdateOperational'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ACSEmailUserEngagementOperational 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ACSEmailUserEngagementOperational'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSEmailUserEngagementOperational'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ACSNetworkTraversalDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ACSNetworkTraversalDiagnostics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSNetworkTraversalDiagnostics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ACSNetworkTraversalIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ACSNetworkTraversalIncomingOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSNetworkTraversalIncomingOperations'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ACSRoomsIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ACSRoomsIncomingOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSRoomsIncomingOperations'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ACSSMSIncomingOperations 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ACSSMSIncomingOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ACSSMSIncomingOperations'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AddonAzureBackupAlerts 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AddonAzureBackupAlerts'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupAlerts'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AddonAzureBackupJobs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AddonAzureBackupJobs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupJobs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AddonAzureBackupPolicy 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AddonAzureBackupPolicy'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupPolicy'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AddonAzureBackupProtectedInstance 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AddonAzureBackupProtectedInstance'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupProtectedInstance'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AddonAzureBackupStorage 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AddonAzureBackupStorage'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AddonAzureBackupStorage'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADFActivityRun 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADFActivityRun'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFActivityRun'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADFAirflowSchedulerLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADFAirflowSchedulerLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFAirflowSchedulerLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADFAirflowTaskLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADFAirflowTaskLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFAirflowTaskLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADFAirflowWebLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADFAirflowWebLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFAirflowWebLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADFAirflowWorkerLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADFAirflowWorkerLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFAirflowWorkerLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADFPipelineRun 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADFPipelineRun'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFPipelineRun'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADFSandboxActivityRun 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADFSandboxActivityRun'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFSandboxActivityRun'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADFSandboxPipelineRun 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADFSandboxPipelineRun'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFSandboxPipelineRun'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADFSSignInLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADFSSignInLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFSSignInLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADFSSISIntegrationRuntimeLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADFSSISIntegrationRuntimeLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISIntegrationRuntimeLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADFSSISPackageEventMessageContext 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADFSSISPackageEventMessageContext'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageEventMessageContext'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADFSSISPackageEventMessages 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADFSSISPackageEventMessages'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageEventMessages'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADFSSISPackageExecutableStatistics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADFSSISPackageExecutableStatistics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageExecutableStatistics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADFSSISPackageExecutionComponentPhases 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADFSSISPackageExecutionComponentPhases'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageExecutionComponentPhases'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADFSSISPackageExecutionDataStatistics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADFSSISPackageExecutionDataStatistics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFSSISPackageExecutionDataStatistics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADFTriggerRun 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADFTriggerRun'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADFTriggerRun'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADPAudit 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADPAudit'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADPAudit'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADPDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADPDiagnostics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADPDiagnostics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADPRequests 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADPRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADPRequests'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADTDataHistoryOperation 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADTDataHistoryOperation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADTDataHistoryOperation'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADTDigitalTwinsOperation 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADTDigitalTwinsOperation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADTDigitalTwinsOperation'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADTEventRoutesOperation 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADTEventRoutesOperation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADTEventRoutesOperation'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADTModelsOperation 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADTModelsOperation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADTModelsOperation'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADTQueryOperation 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADTQueryOperation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADTQueryOperation'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADXCommand 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADXCommand'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADXCommand'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADXIngestionBatching 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADXIngestionBatching'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADXIngestionBatching'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADXJournal 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADXJournal'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADXJournal'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADXQuery 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADXQuery'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADXQuery'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADXTableDetails 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADXTableDetails'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADXTableDetails'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ADXTableUsageStatistics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ADXTableUsageStatistics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ADXTableUsageStatistics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AegDataPlaneRequests 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AegDataPlaneRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AegDataPlaneRequests'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AegDeliveryFailureLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AegDeliveryFailureLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AegDeliveryFailureLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AegPublishFailureLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AegPublishFailureLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AegPublishFailureLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AEWAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AEWAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AEWAuditLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AEWComputePipelinesLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AEWComputePipelinesLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AEWComputePipelinesLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AgriFoodApplicationAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AgriFoodApplicationAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodApplicationAuditLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AgriFoodFarmManagementLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AgriFoodFarmManagementLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodFarmManagementLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AgriFoodFarmOperationLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AgriFoodFarmOperationLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodFarmOperationLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AgriFoodInsightLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AgriFoodInsightLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodInsightLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AgriFoodJobProcessedLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AgriFoodJobProcessedLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodJobProcessedLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AgriFoodModelInferenceLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AgriFoodModelInferenceLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodModelInferenceLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AgriFoodProviderAuthLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AgriFoodProviderAuthLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodProviderAuthLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AgriFoodSatelliteLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AgriFoodSatelliteLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodSatelliteLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AgriFoodWeatherLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AgriFoodWeatherLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AgriFoodWeatherLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AGSGrafanaLoginEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AGSGrafanaLoginEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AGSGrafanaLoginEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AHDSMedTechDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AHDSMedTechDiagnosticLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AHDSMedTechDiagnosticLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AirflowDagProcessingLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AirflowDagProcessingLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AirflowDagProcessingLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_Alert 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'Alert'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'Alert'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AmlComputeClusterEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AmlComputeClusterEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeClusterEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AmlComputeClusterNodeEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AmlComputeClusterNodeEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeClusterNodeEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AmlComputeCpuGpuUtilization 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AmlComputeCpuGpuUtilization'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeCpuGpuUtilization'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AmlComputeInstanceEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AmlComputeInstanceEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeInstanceEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AmlComputeJobEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AmlComputeJobEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlComputeJobEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AmlDataLabelEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AmlDataLabelEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlDataLabelEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AmlDataSetEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AmlDataSetEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlDataSetEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AmlDataStoreEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AmlDataStoreEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlDataStoreEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AmlDeploymentEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AmlDeploymentEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlDeploymentEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AmlEnvironmentEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AmlEnvironmentEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlEnvironmentEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AmlInferencingEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AmlInferencingEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlInferencingEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AmlModelsEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AmlModelsEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlModelsEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AmlOnlineEndpointConsoleLog 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AmlOnlineEndpointConsoleLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlOnlineEndpointConsoleLog'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AmlOnlineEndpointEventLog 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AmlOnlineEndpointEventLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlOnlineEndpointEventLog'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AmlOnlineEndpointTrafficLog 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AmlOnlineEndpointTrafficLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlOnlineEndpointTrafficLog'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AmlPipelineEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AmlPipelineEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlPipelineEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AmlRunEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AmlRunEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlRunEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AmlRunStatusChangedEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AmlRunStatusChangedEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AmlRunStatusChangedEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AMSKeyDeliveryRequests 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AMSKeyDeliveryRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AMSKeyDeliveryRequests'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AMSLiveEventOperations 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AMSLiveEventOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AMSLiveEventOperations'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AMSMediaAccountHealth 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AMSMediaAccountHealth'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AMSMediaAccountHealth'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AMSStreamingEndpointRequests 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AMSStreamingEndpointRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AMSStreamingEndpointRequests'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ANFFileAccess 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ANFFileAccess'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ANFFileAccess'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ApiManagementGatewayLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ApiManagementGatewayLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ApiManagementGatewayLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppAvailabilityResults 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppAvailabilityResults'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppAvailabilityResults'
    }
    retentionInDays: 90
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppBrowserTimings 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppBrowserTimings'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppBrowserTimings'
    }
    retentionInDays: 90
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppCenterError 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppCenterError'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppCenterError'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppDependencies 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppDependencies'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppDependencies'
    }
    retentionInDays: 90
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppEvents'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppEvents'
    }
    retentionInDays: 90
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppExceptions 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppExceptions'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppExceptions'
    }
    retentionInDays: 90
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppMetrics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppMetrics'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppMetrics'
    }
    retentionInDays: 90
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppPageViews 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppPageViews'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppPageViews'
    }
    retentionInDays: 90
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppPerformanceCounters 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppPerformanceCounters'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppPerformanceCounters'
    }
    retentionInDays: 90
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppPlatformBuildLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppPlatformBuildLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformBuildLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppPlatformContainerEventLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppPlatformContainerEventLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformContainerEventLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppPlatformIngressLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppPlatformIngressLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformIngressLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppPlatformLogsforSpring 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppPlatformLogsforSpring'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformLogsforSpring'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppPlatformSystemLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppPlatformSystemLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppPlatformSystemLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppRequests 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppRequests'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppRequests'
    }
    retentionInDays: 90
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppServiceAntivirusScanAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppServiceAntivirusScanAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServiceAntivirusScanAuditLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppServiceAppLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppServiceAppLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServiceAppLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppServiceAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppServiceAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServiceAuditLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppServiceConsoleLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppServiceConsoleLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServiceConsoleLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppServiceEnvironmentPlatformLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppServiceEnvironmentPlatformLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServiceEnvironmentPlatformLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppServiceFileAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppServiceFileAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServiceFileAuditLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppServiceHTTPLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppServiceHTTPLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServiceHTTPLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppServiceIPSecAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppServiceIPSecAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServiceIPSecAuditLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppServicePlatformLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppServicePlatformLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AppServicePlatformLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppSystemEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppSystemEvents'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppSystemEvents'
    }
    retentionInDays: 90
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AppTraces 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AppTraces'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AppTraces'
    }
    retentionInDays: 90
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ATCExpressRouteCircuitIpfix 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ATCExpressRouteCircuitIpfix'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ATCExpressRouteCircuitIpfix'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AuditLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AUIEventsAudit 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AUIEventsAudit'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AUIEventsAudit'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AUIEventsOperational 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AUIEventsOperational'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AUIEventsOperational'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AutoscaleEvaluationsLog 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AutoscaleEvaluationsLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AutoscaleEvaluationsLog'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AutoscaleScaleActionsLog 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AutoscaleScaleActionsLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AutoscaleScaleActionsLog'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AVSSyslog 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AVSSyslog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AVSSyslog'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AZFWApplicationRule 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AZFWApplicationRule'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWApplicationRule'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AZFWApplicationRuleAggregation 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AZFWApplicationRuleAggregation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWApplicationRuleAggregation'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AZFWDnsQuery 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AZFWDnsQuery'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWDnsQuery'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AZFWIdpsSignature 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AZFWIdpsSignature'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWIdpsSignature'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AZFWInternalFqdnResolutionFailure 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AZFWInternalFqdnResolutionFailure'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWInternalFqdnResolutionFailure'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AZFWNatRule 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AZFWNatRule'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWNatRule'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AZFWNatRuleAggregation 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AZFWNatRuleAggregation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWNatRuleAggregation'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AZFWNetworkRule 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AZFWNetworkRule'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWNetworkRule'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AZFWNetworkRuleAggregation 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AZFWNetworkRuleAggregation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWNetworkRuleAggregation'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AZFWThreatIntel 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AZFWThreatIntel'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AZFWThreatIntel'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AzureActivity 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AzureActivity'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'AzureActivity'
    }
    retentionInDays: 90
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AzureActivityV2 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AzureActivityV2'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AzureActivityV2'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AzureAttestationDiagnostics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AzureAttestationDiagnostics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AzureAttestationDiagnostics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AzureDevOpsAuditing 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AzureDevOpsAuditing'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AzureDevOpsAuditing'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AzureLoadTestingOperation 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AzureLoadTestingOperation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AzureLoadTestingOperation'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_AzureMetrics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'AzureMetrics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'AzureMetrics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_BaiClusterEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'BaiClusterEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'BaiClusterEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_BaiClusterNodeEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'BaiClusterNodeEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'BaiClusterNodeEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_BaiJobEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'BaiJobEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'BaiJobEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_BlockchainApplicationLog 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'BlockchainApplicationLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'BlockchainApplicationLog'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_BlockchainProxyLog 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'BlockchainProxyLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'BlockchainProxyLog'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_CassandraAudit 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'CassandraAudit'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CassandraAudit'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_CassandraLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'CassandraLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CassandraLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_CCFApplicationLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'CCFApplicationLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CCFApplicationLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_CDBCassandraRequests 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'CDBCassandraRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CDBCassandraRequests'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_CDBControlPlaneRequests 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'CDBControlPlaneRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CDBControlPlaneRequests'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_CDBDataPlaneRequests 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'CDBDataPlaneRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CDBDataPlaneRequests'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_CDBGremlinRequests 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'CDBGremlinRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CDBGremlinRequests'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_CDBMongoRequests 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'CDBMongoRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CDBMongoRequests'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_CDBPartitionKeyRUConsumption 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'CDBPartitionKeyRUConsumption'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CDBPartitionKeyRUConsumption'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_CDBPartitionKeyStatistics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'CDBPartitionKeyStatistics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CDBPartitionKeyStatistics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_CDBQueryRuntimeStatistics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'CDBQueryRuntimeStatistics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CDBQueryRuntimeStatistics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ComputerGroup 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ComputerGroup'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ComputerGroup'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ContainerAppConsoleLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ContainerAppConsoleLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerAppConsoleLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ContainerAppConsoleLogs_CL 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ContainerAppConsoleLogs_CL'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerAppConsoleLogs_CL'
      columns: [
        {
          name: 'time_t'
          type: 'datetime'
        }
        {
          name: '_timestamp_d'
          type: 'real'
        }
        {
          name: 'RevisionName_s'
          type: 'string'
        }
        {
          name: 'Log_s'
          type: 'string'
        }
        {
          name: 'ContainerImage_s'
          type: 'string'
        }
        {
          name: 'ContainerName_s'
          type: 'string'
        }
        {
          name: 'ContainerGroupId_g'
          type: 'guid'
        }
        {
          name: 'Stream_s'
          type: 'string'
        }
        {
          name: 'logtag_s'
          type: 'string'
        }
        {
          name: 'ContainerId_s'
          type: 'string'
        }
        {
          name: 'ContainerAppName_s'
          type: 'string'
        }
        {
          name: 'ContainerGroupName_s'
          type: 'string'
        }
        {
          name: 'time_s'
          type: 'string'
        }
        {
          name: 'EnvironmentName_s'
          type: 'string'
        }
      ]
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ContainerAppSystemLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ContainerAppSystemLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerAppSystemLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ContainerAppSystemLogs_CL 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ContainerAppSystemLogs_CL'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerAppSystemLogs_CL'
      columns: [
        {
          name: 'time_t'
          type: 'datetime'
        }
        {
          name: '_timestamp_d'
          type: 'real'
        }
        {
          name: 'EventSource_s'
          type: 'string'
        }
        {
          name: 'RevisionName_s'
          type: 'string'
        }
        {
          name: 'ContainerAppName_s'
          type: 'string'
        }
        {
          name: 'Count_d'
          type: 'real'
        }
        {
          name: 'time_s'
          type: 'string'
        }
        {
          name: 'TimeStamp_s'
          type: 'string'
        }
        {
          name: 'Type_s'
          type: 'string'
        }
        {
          name: 'Log_s'
          type: 'string'
        }
        {
          name: 'Reason_s'
          type: 'string'
        }
        {
          name: 'ReplicaName_s'
          type: 'string'
        }
        {
          name: 'EnvironmentName_s'
          type: 'string'
        }
      ]
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ContainerImageInventory 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ContainerImageInventory'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerImageInventory'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ContainerInventory 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ContainerInventory'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerInventory'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ContainerLog 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ContainerLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerLog'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ContainerNodeInventory 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ContainerNodeInventory'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerNodeInventory'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ContainerRegistryLoginEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ContainerRegistryLoginEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerRegistryLoginEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ContainerRegistryRepositoryEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ContainerRegistryRepositoryEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerRegistryRepositoryEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ContainerServiceLog 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ContainerServiceLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ContainerServiceLog'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_CoreAzureBackup 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'CoreAzureBackup'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'CoreAzureBackup'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksAccounts 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksAccounts'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksAccounts'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksCapsule8Dataplane 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksCapsule8Dataplane'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksCapsule8Dataplane'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksClamAVScan 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksClamAVScan'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksClamAVScan'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksClusterLibraries 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksClusterLibraries'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksClusterLibraries'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksClusters 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksClusters'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksClusters'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksDatabricksSQL 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksDatabricksSQL'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDatabricksSQL'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksDBFS 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksDBFS'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDBFS'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksDeltaPipelines 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksDeltaPipelines'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksDeltaPipelines'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksFeatureStore 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksFeatureStore'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksFeatureStore'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksGenie 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksGenie'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksGenie'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksGitCredentials 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksGitCredentials'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksGitCredentials'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksGlobalInitScripts 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksGlobalInitScripts'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksGlobalInitScripts'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksIAMRole 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksIAMRole'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksIAMRole'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksInstancePools 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksInstancePools'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksInstancePools'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksJobs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksJobs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksJobs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksMLflowAcledArtifact 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksMLflowAcledArtifact'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksMLflowAcledArtifact'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksMLflowExperiment 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksMLflowExperiment'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksMLflowExperiment'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksModelRegistry 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksModelRegistry'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksModelRegistry'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksNotebook 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksNotebook'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksNotebook'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksPartnerHub 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksPartnerHub'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksPartnerHub'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksRemoteHistoryService 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksRemoteHistoryService'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksRemoteHistoryService'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksRepos 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksRepos'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksRepos'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksSecrets 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksSecrets'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksSecrets'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksServerlessRealTimeInference 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksServerlessRealTimeInference'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksServerlessRealTimeInference'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksSQL 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksSQL'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksSQL'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksSQLPermissions 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksSQLPermissions'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksSQLPermissions'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksSSH 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksSSH'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksSSH'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksTables 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksTables'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksTables'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksUnityCatalog 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksUnityCatalog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksUnityCatalog'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksWebTerminal 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksWebTerminal'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksWebTerminal'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DatabricksWorkspace 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DatabricksWorkspace'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DatabricksWorkspace'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DSMAzureBlobStorageLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DSMAzureBlobStorageLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DSMAzureBlobStorageLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DSMDataClassificationLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DSMDataClassificationLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DSMDataClassificationLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_DSMDataLabelingLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'DSMDataLabelingLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'DSMDataLabelingLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ETWEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ETWEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ETWEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_Event 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'Event'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'Event'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_FailedIngestion 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'FailedIngestion'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'FailedIngestion'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_FunctionAppLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'FunctionAppLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'FunctionAppLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightAmbariClusterAlerts 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightAmbariClusterAlerts'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightAmbariClusterAlerts'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightAmbariSystemMetrics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightAmbariSystemMetrics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightAmbariSystemMetrics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightGatewayAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightGatewayAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightGatewayAuditLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightHadoopAndYarnLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightHadoopAndYarnLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHadoopAndYarnLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightHadoopAndYarnMetrics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightHadoopAndYarnMetrics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHadoopAndYarnMetrics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightHBaseLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightHBaseLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHBaseLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightHBaseMetrics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightHBaseMetrics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHBaseMetrics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightHiveAndLLAPLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightHiveAndLLAPLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHiveAndLLAPLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightHiveAndLLAPMetrics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightHiveAndLLAPMetrics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHiveAndLLAPMetrics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightHiveQueryAppStats 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightHiveQueryAppStats'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHiveQueryAppStats'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightHiveTezAppStats 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightHiveTezAppStats'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightHiveTezAppStats'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightJupyterNotebookEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightJupyterNotebookEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightJupyterNotebookEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightKafkaLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightKafkaLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightKafkaLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightKafkaMetrics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightKafkaMetrics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightKafkaMetrics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightOozieLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightOozieLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightOozieLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightRangerAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightRangerAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightRangerAuditLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightSecurityLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightSecurityLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSecurityLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightSparkApplicationEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightSparkApplicationEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkApplicationEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightSparkBlockManagerEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightSparkBlockManagerEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkBlockManagerEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightSparkEnvironmentEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightSparkEnvironmentEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkEnvironmentEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightSparkExecutorEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightSparkExecutorEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkExecutorEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightSparkExtraEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightSparkExtraEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkExtraEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightSparkJobEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightSparkJobEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkJobEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightSparkLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightSparkLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightSparkSQLExecutionEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightSparkSQLExecutionEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkSQLExecutionEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightSparkStageEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightSparkStageEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkStageEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightSparkStageTaskAccumulables 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightSparkStageTaskAccumulables'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkStageTaskAccumulables'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightSparkTaskEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightSparkTaskEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightSparkTaskEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightStormLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightStormLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightStormLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightStormMetrics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightStormMetrics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightStormMetrics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_HDInsightStormTopologyMetrics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'HDInsightStormTopologyMetrics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'HDInsightStormTopologyMetrics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_Heartbeat 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'Heartbeat'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'Heartbeat'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_InsightsMetrics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'InsightsMetrics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'InsightsMetrics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_IntuneAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'IntuneAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'IntuneAuditLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_IntuneDeviceComplianceOrg 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'IntuneDeviceComplianceOrg'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'IntuneDeviceComplianceOrg'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_IntuneDevices 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'IntuneDevices'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'IntuneDevices'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_IntuneOperationalLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'IntuneOperationalLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'IntuneOperationalLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_KubeEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'KubeEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'KubeEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_KubeHealth 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'KubeHealth'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'KubeHealth'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_KubeMonAgentEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'KubeMonAgentEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'KubeMonAgentEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_KubeNodeInventory 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'KubeNodeInventory'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'KubeNodeInventory'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_KubePodInventory 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'KubePodInventory'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'KubePodInventory'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_KubeServices 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'KubeServices'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'KubeServices'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_LAQueryLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'LAQueryLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'LAQueryLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_MCCEventLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'MCCEventLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MCCEventLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_MCVPAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'MCVPAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MCVPAuditLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_MCVPOperationLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'MCVPOperationLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MCVPOperationLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_MicrosoftAzureBastionAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'MicrosoftAzureBastionAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftAzureBastionAuditLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_MicrosoftDataShareReceivedSnapshotLog 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'MicrosoftDataShareReceivedSnapshotLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftDataShareReceivedSnapshotLog'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_MicrosoftDataShareSentSnapshotLog 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'MicrosoftDataShareSentSnapshotLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftDataShareSentSnapshotLog'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_MicrosoftDataShareShareLog 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'MicrosoftDataShareShareLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftDataShareShareLog'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_MicrosoftDynamicsTelemetryPerformanceLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'MicrosoftDynamicsTelemetryPerformanceLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftDynamicsTelemetryPerformanceLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_MicrosoftDynamicsTelemetrySystemMetricsLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'MicrosoftDynamicsTelemetrySystemMetricsLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftDynamicsTelemetrySystemMetricsLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_MicrosoftHealthcareApisAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'MicrosoftHealthcareApisAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'MicrosoftHealthcareApisAuditLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_NetworkAccessTraffic 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'NetworkAccessTraffic'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NetworkAccessTraffic'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_NSPAccessLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'NSPAccessLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NSPAccessLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_NWConnectionMonitorDestinationListenerResult 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'NWConnectionMonitorDestinationListenerResult'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NWConnectionMonitorDestinationListenerResult'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_NWConnectionMonitorDNSResult 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'NWConnectionMonitorDNSResult'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NWConnectionMonitorDNSResult'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_NWConnectionMonitorPathResult 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'NWConnectionMonitorPathResult'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NWConnectionMonitorPathResult'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_NWConnectionMonitorTestResult 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'NWConnectionMonitorTestResult'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'NWConnectionMonitorTestResult'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_OEPAirFlowTask 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'OEPAirFlowTask'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'OEPAirFlowTask'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_OEPElasticOperator 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'OEPElasticOperator'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'OEPElasticOperator'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_OEPElasticsearch 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'OEPElasticsearch'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'OEPElasticsearch'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_OLPSupplyChainEntityOperations 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'OLPSupplyChainEntityOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'OLPSupplyChainEntityOperations'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_OLPSupplyChainEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'OLPSupplyChainEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'OLPSupplyChainEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_OmsCustomerProfileFact 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'OmsCustomerProfileFact'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'OmsCustomerProfileFact'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_Operation 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'Operation'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'Operation'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_Perf 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'Perf'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'Perf'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_PFTitleAuditLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'PFTitleAuditLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PFTitleAuditLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_PowerBIAuditTenant 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'PowerBIAuditTenant'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PowerBIAuditTenant'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_PowerBIDatasetsTenant 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'PowerBIDatasetsTenant'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PowerBIDatasetsTenant'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_PowerBIDatasetsTenantPreview 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'PowerBIDatasetsTenantPreview'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PowerBIDatasetsTenantPreview'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_PowerBIDatasetsWorkspace 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'PowerBIDatasetsWorkspace'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PowerBIDatasetsWorkspace'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_PowerBIDatasetsWorkspacePreview 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'PowerBIDatasetsWorkspacePreview'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PowerBIDatasetsWorkspacePreview'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_PowerBIReportUsageTenant 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'PowerBIReportUsageTenant'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PowerBIReportUsageTenant'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_PowerBIReportUsageWorkspace 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'PowerBIReportUsageWorkspace'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PowerBIReportUsageWorkspace'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_PurviewDataSensitivityLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'PurviewDataSensitivityLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PurviewDataSensitivityLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_PurviewScanStatusLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'PurviewScanStatusLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PurviewScanStatusLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_PurviewSecurityLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'PurviewSecurityLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'PurviewSecurityLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ReservedCommonFields 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ReservedCommonFields'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ReservedCommonFields'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ResourceManagementPublicAccessLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ResourceManagementPublicAccessLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ResourceManagementPublicAccessLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ServiceFabricOperationalEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ServiceFabricOperationalEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ServiceFabricOperationalEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ServiceFabricReliableActorEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ServiceFabricReliableActorEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ServiceFabricReliableActorEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_ServiceFabricReliableServiceEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'ServiceFabricReliableServiceEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'ServiceFabricReliableServiceEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SignalRServiceDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SignalRServiceDiagnosticLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SignalRServiceDiagnosticLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SigninLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SigninLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SigninLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SQLSecurityAuditEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SQLSecurityAuditEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SQLSecurityAuditEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_StorageAntimalwareScanResults 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'StorageAntimalwareScanResults'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageAntimalwareScanResults'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_StorageBlobLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'StorageBlobLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageBlobLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_StorageCacheOperationEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'StorageCacheOperationEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageCacheOperationEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_StorageCacheUpgradeEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'StorageCacheUpgradeEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageCacheUpgradeEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_StorageCacheWarningEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'StorageCacheWarningEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageCacheWarningEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_StorageFileLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'StorageFileLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageFileLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_StorageQueueLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'StorageQueueLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageQueueLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_StorageTableLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'StorageTableLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'StorageTableLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SucceededIngestion 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SucceededIngestion'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SucceededIngestion'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseBigDataPoolApplicationsEnded 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseBigDataPoolApplicationsEnded'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseBigDataPoolApplicationsEnded'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseBuiltinSqlPoolRequestsEnded 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseBuiltinSqlPoolRequestsEnded'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseBuiltinSqlPoolRequestsEnded'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseDXCommand 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseDXCommand'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXCommand'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseDXFailedIngestion 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseDXFailedIngestion'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXFailedIngestion'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseDXIngestionBatching 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseDXIngestionBatching'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXIngestionBatching'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseDXQuery 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseDXQuery'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXQuery'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseDXSucceededIngestion 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseDXSucceededIngestion'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXSucceededIngestion'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseDXTableDetails 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseDXTableDetails'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXTableDetails'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseDXTableUsageStatistics 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseDXTableUsageStatistics'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseDXTableUsageStatistics'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseGatewayApiRequests 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseGatewayApiRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseGatewayApiRequests'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseGatewayEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseGatewayEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseGatewayEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseIntegrationActivityRuns 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseIntegrationActivityRuns'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseIntegrationActivityRuns'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseIntegrationActivityRunsEnded 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseIntegrationActivityRunsEnded'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseIntegrationActivityRunsEnded'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseIntegrationPipelineRuns 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseIntegrationPipelineRuns'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseIntegrationPipelineRuns'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseIntegrationPipelineRunsEnded 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseIntegrationPipelineRunsEnded'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseIntegrationPipelineRunsEnded'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseIntegrationTriggerRuns 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseIntegrationTriggerRuns'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseIntegrationTriggerRuns'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseIntegrationTriggerRunsEnded 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseIntegrationTriggerRunsEnded'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseIntegrationTriggerRunsEnded'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseLinkEvent 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseLinkEvent'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseLinkEvent'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseRBACEvents 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseRBACEvents'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseRBACEvents'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseRbacOperations 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseRbacOperations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseRbacOperations'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseScopePoolScopeJobsEnded 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseScopePoolScopeJobsEnded'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseScopePoolScopeJobsEnded'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseScopePoolScopeJobsStateChange 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseScopePoolScopeJobsStateChange'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseScopePoolScopeJobsStateChange'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseSqlPoolDmsWorkers 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseSqlPoolDmsWorkers'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolDmsWorkers'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseSqlPoolExecRequests 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseSqlPoolExecRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolExecRequests'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseSqlPoolRequestSteps 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseSqlPoolRequestSteps'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolRequestSteps'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseSqlPoolSqlRequests 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseSqlPoolSqlRequests'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolSqlRequests'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_SynapseSqlPoolWaits 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'SynapseSqlPoolWaits'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'SynapseSqlPoolWaits'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_Syslog 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'Syslog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'Syslog'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_TSIIngress 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'TSIIngress'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'TSIIngress'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_UCClient 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'UCClient'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'UCClient'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_UCClientReadinessStatus 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'UCClientReadinessStatus'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'UCClientReadinessStatus'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_UCClientUpdateStatus 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'UCClientUpdateStatus'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'UCClientUpdateStatus'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_UCDeviceAlert 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'UCDeviceAlert'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'UCDeviceAlert'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_UCDOAggregatedStatus 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'UCDOAggregatedStatus'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'UCDOAggregatedStatus'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_UCDOStatus 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'UCDOStatus'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'UCDOStatus'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_UCServiceUpdateStatus 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'UCServiceUpdateStatus'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'UCServiceUpdateStatus'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_UCUpdateAlert 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'UCUpdateAlert'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'UCUpdateAlert'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_Usage 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'Usage'
  properties: {
    totalRetentionInDays: 90
    plan: 'Analytics'
    schema: {
      name: 'Usage'
    }
    retentionInDays: 90
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_VIAudit 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'VIAudit'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'VIAudit'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_VIIndexing 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'VIIndexing'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'VIIndexing'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_VMBoundPort 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'VMBoundPort'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'VMBoundPort'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_VMComputer 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'VMComputer'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'VMComputer'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_VMConnection 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'VMConnection'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'VMConnection'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_VMProcess 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'VMProcess'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'VMProcess'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_W3CIISLog 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'W3CIISLog'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'W3CIISLog'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_WebPubSubConnectivity 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'WebPubSubConnectivity'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WebPubSubConnectivity'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_WebPubSubHttpRequest 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'WebPubSubHttpRequest'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WebPubSubHttpRequest'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_WebPubSubMessaging 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'WebPubSubMessaging'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WebPubSubMessaging'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_WorkloadDiagnosticLogs 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'WorkloadDiagnosticLogs'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WorkloadDiagnosticLogs'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_WVDAgentHealthStatus 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'WVDAgentHealthStatus'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDAgentHealthStatus'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_WVDCheckpoints 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'WVDCheckpoints'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDCheckpoints'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_WVDConnectionGraphicsDataPreview 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'WVDConnectionGraphicsDataPreview'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDConnectionGraphicsDataPreview'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_WVDConnectionNetworkData 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'WVDConnectionNetworkData'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDConnectionNetworkData'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_WVDConnections 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'WVDConnections'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDConnections'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_WVDErrors 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'WVDErrors'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDErrors'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_WVDFeeds 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'WVDFeeds'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDFeeds'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_WVDHostRegistrations 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'WVDHostRegistrations'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDHostRegistrations'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_WVDManagement 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'WVDManagement'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDManagement'
    }
    retentionInDays: 30
  }
}

resource workspaces_fx_p_eu_paccd_01_log_name_WVDSessionHostManagement 'Microsoft.OperationalInsights/workspaces/tables@2021-12-01-preview' = {
  parent: workspaces_fx_p_eu_paccd_01_log_name_resource
  name: 'WVDSessionHostManagement'
  properties: {
    totalRetentionInDays: 30
    plan: 'Analytics'
    schema: {
      name: 'WVDSessionHostManagement'
    }
    retentionInDays: 30
  }
}

resource actionRules_fx_p_paccd_alertprocesingrule_name_resource 'Microsoft.AlertsManagement/actionRules@2021-08-08' = {
  name: actionRules_fx_p_paccd_alertprocesingrule_name
  location: 'Global'
  properties: {
    scopes: [
      components_fx_p_eu_paccd_01_appi_name_resource.id
    ]
    enabled: true
    actions: [
      {
        actionGroupIds: [
          actionGroups_fx_p_eu_paccd_01_ag_name_resource.id
        ]
        actionType: 'AddActionGroups'
      }
    ]
  }
}

resource databaseAccounts_fx_p_eu_paccd_01_cosmos_name_todo_db_todo_items 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers@2022-08-15' = {
  parent: databaseAccounts_fx_p_eu_paccd_01_cosmos_name_todo_db
  name: 'todo-items'
  properties: {
    resource: {
      id: 'todo-items'
      indexingPolicy: {
        indexingMode: 'consistent'
        automatic: true
        includedPaths: [
          {
            path: '/*'
          }
        ]
        excludedPaths: [
          {
            path: '/"_etag"/?'
          }
        ]
      }
      partitionKey: {
        paths: [
          '/id'
        ]
        kind: 'Hash'
        version: 2
      }
      conflictResolutionPolicy: {
        mode: 'LastWriterWins'
        conflictResolutionPath: '/_ts'
      }
    }
  }
  dependsOn: [

    databaseAccounts_fx_p_eu_paccd_01_cosmos_name_resource
  ]
}

resource metricalerts_custom_metric_health_check_fx_p_eu_paccd_01_appi_name_resource 'microsoft.insights/metricalerts@2018-03-01' = {
  name: metricalerts_custom_metric_health_check_fx_p_eu_paccd_01_appi_name
  location: 'global'
  tags: {
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourcegroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/components/fx-p-eu-paccd-01-appi': 'Resource'
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourcegroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/webtests/custom metric health check-fx-p-eu-paccd-01-appi': 'Resource'
  }
  properties: {
    description: 'Automatically created alert rule for availability test "${metricalerts_custom_metric_health_check_fx_p_eu_paccd_01_appi_name}"'
    severity: 1
    enabled: true
    scopes: [
      webtests_custom_metric_health_check_fx_p_eu_paccd_01_appi_name_resource.id
      components_fx_p_eu_paccd_01_appi_name_resource.id
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      webTestId: webtests_custom_metric_health_check_fx_p_eu_paccd_01_appi_name_resource.id
      componentId: components_fx_p_eu_paccd_01_appi_name_resource.id
      failedLocationCount: 2
      'odata.type': 'Microsoft.Azure.Monitor.WebtestLocationAvailabilityCriteria'
    }
    actions: []
  }
}

resource metricalerts_delete_cosmos_health_check_fx_p_eu_paccd_01_appi_name_resource 'microsoft.insights/metricalerts@2018-03-01' = {
  name: metricalerts_delete_cosmos_health_check_fx_p_eu_paccd_01_appi_name
  location: 'global'
  tags: {
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourcegroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/components/fx-p-eu-paccd-01-appi': 'Resource'
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourcegroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/webtests/delete cosmos health check-fx-p-eu-paccd-01-appi': 'Resource'
  }
  properties: {
    description: 'Automatically created alert rule for availability test "${metricalerts_delete_cosmos_health_check_fx_p_eu_paccd_01_appi_name}"'
    severity: 1
    enabled: true
    scopes: [
      webtests_delete_cosmos_health_check_fx_p_eu_paccd_01_appi_name_resource.id
      components_fx_p_eu_paccd_01_appi_name_resource.id
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      webTestId: webtests_delete_cosmos_health_check_fx_p_eu_paccd_01_appi_name_resource.id
      componentId: components_fx_p_eu_paccd_01_appi_name_resource.id
      failedLocationCount: 2
      'odata.type': 'Microsoft.Azure.Monitor.WebtestLocationAvailabilityCriteria'
    }
    actions: []
  }
}

resource metricalerts_get_cosmos_request_fx_p_eu_paccd_01_appi_name_resource 'microsoft.insights/metricalerts@2018-03-01' = {
  name: metricalerts_get_cosmos_request_fx_p_eu_paccd_01_appi_name
  location: 'global'
  tags: {
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourcegroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/components/fx-p-eu-paccd-01-appi': 'Resource'
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourcegroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/webtests/get cosmos request-fx-p-eu-paccd-01-appi': 'Resource'
  }
  properties: {
    description: 'Automatically created alert rule for availability test "${metricalerts_get_cosmos_request_fx_p_eu_paccd_01_appi_name}"'
    severity: 1
    enabled: true
    scopes: [
      webtests_get_cosmos_request_fx_p_eu_paccd_01_appi_name_resource.id
      components_fx_p_eu_paccd_01_appi_name_resource.id
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      webTestId: webtests_get_cosmos_request_fx_p_eu_paccd_01_appi_name_resource.id
      componentId: components_fx_p_eu_paccd_01_appi_name_resource.id
      failedLocationCount: 2
      'odata.type': 'Microsoft.Azure.Monitor.WebtestLocationAvailabilityCriteria'
    }
    actions: []
  }
}

resource metricalerts_home_paccd_url_for_test_fx_p_eu_paccd_01_appi_name_resource 'microsoft.insights/metricalerts@2018-03-01' = {
  name: metricalerts_home_paccd_url_for_test_fx_p_eu_paccd_01_appi_name
  location: 'global'
  tags: {
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourcegroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/components/fx-p-eu-paccd-01-appi': 'Resource'
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourcegroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/webtests/home paccd url  for test-fx-p-eu-paccd-01-appi': 'Resource'
  }
  properties: {
    description: 'Automatically created alert rule for availability test "${metricalerts_home_paccd_url_for_test_fx_p_eu_paccd_01_appi_name}"'
    severity: 1
    enabled: true
    scopes: [
      webtests_home_paccd_url_for_test_fx_p_eu_paccd_01_appi_name_resource.id
      components_fx_p_eu_paccd_01_appi_name_resource.id
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      webTestId: webtests_home_paccd_url_for_test_fx_p_eu_paccd_01_appi_name_resource.id
      componentId: components_fx_p_eu_paccd_01_appi_name_resource.id
      failedLocationCount: 2
      'odata.type': 'Microsoft.Azure.Monitor.WebtestLocationAvailabilityCriteria'
    }
    actions: []
  }
}

resource metricalerts_post_cosmos_data_health_check_fx_p_eu_paccd_01_appi_name_resource 'microsoft.insights/metricalerts@2018-03-01' = {
  name: metricalerts_post_cosmos_data_health_check_fx_p_eu_paccd_01_appi_name
  location: 'global'
  tags: {
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourcegroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/components/fx-p-eu-paccd-01-appi': 'Resource'
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourcegroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/webtests/post cosmos data health check-fx-p-eu-paccd-01-appi': 'Resource'
  }
  properties: {
    description: 'Automatically created alert rule for availability test "${metricalerts_post_cosmos_data_health_check_fx_p_eu_paccd_01_appi_name}"'
    severity: 1
    enabled: true
    scopes: [
      webtests_post_cosmos_data_health_check_fx_p_eu_paccd_01_appi_name_resource.id
      components_fx_p_eu_paccd_01_appi_name_resource.id
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      webTestId: webtests_post_cosmos_data_health_check_fx_p_eu_paccd_01_appi_name_resource.id
      componentId: components_fx_p_eu_paccd_01_appi_name_resource.id
      failedLocationCount: 2
      'odata.type': 'Microsoft.Azure.Monitor.WebtestLocationAvailabilityCriteria'
    }
    actions: []
  }
}

resource metricalerts_put_cosmos_db_health_check_fx_p_eu_paccd_01_appi_name_resource 'microsoft.insights/metricalerts@2018-03-01' = {
  name: metricalerts_put_cosmos_db_health_check_fx_p_eu_paccd_01_appi_name
  location: 'global'
  tags: {
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourcegroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/components/fx-p-eu-paccd-01-appi': 'Resource'
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourcegroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/webtests/put cosmos db health check-fx-p-eu-paccd-01-appi': 'Resource'
  }
  properties: {
    description: 'Automatically created alert rule for availability test "${metricalerts_put_cosmos_db_health_check_fx_p_eu_paccd_01_appi_name}"'
    severity: 1
    enabled: true
    scopes: [
      webtests_put_cosmos_db_health_check_fx_p_eu_paccd_01_appi_name_resource.id
      components_fx_p_eu_paccd_01_appi_name_resource.id
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      webTestId: webtests_put_cosmos_db_health_check_fx_p_eu_paccd_01_appi_name_resource.id
      componentId: components_fx_p_eu_paccd_01_appi_name_resource.id
      failedLocationCount: 2
      'odata.type': 'Microsoft.Azure.Monitor.WebtestLocationAvailabilityCriteria'
    }
    actions: []
  }
}

resource metricalerts_test_swagger_paccd_url_fx_p_eu_paccd_01_appi_name_resource 'microsoft.insights/metricalerts@2018-03-01' = {
  name: metricalerts_test_swagger_paccd_url_fx_p_eu_paccd_01_appi_name
  location: 'global'
  tags: {
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourcegroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/components/fx-p-eu-paccd-01-appi': 'Resource'
    'hidden-link:/subscriptions/fdc244f3-580a-4021-b21b-a7ca1ea4f382/resourcegroups/fx-p-eu-paccd-01-rg/providers/microsoft.insights/webtests/test swagger paccd url-fx-p-eu-paccd-01-appi': 'Resource'
  }
  properties: {
    description: 'Automatically created alert rule for availability test "${metricalerts_test_swagger_paccd_url_fx_p_eu_paccd_01_appi_name}"'
    severity: 1
    enabled: true
    scopes: [
      webtests_test_swagger_paccd_url_fx_p_eu_paccd_01_appi_name_resource.id
      components_fx_p_eu_paccd_01_appi_name_resource.id
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      webTestId: webtests_test_swagger_paccd_url_fx_p_eu_paccd_01_appi_name_resource.id
      componentId: components_fx_p_eu_paccd_01_appi_name_resource.id
      failedLocationCount: 2
      'odata.type': 'Microsoft.Azure.Monitor.WebtestLocationAvailabilityCriteria'
    }
    actions: []
  }
}

resource metricAlerts_fx_p_paccd_httpalert_name_resource 'microsoft.insights/metricAlerts@2018-03-01' = {
  name: metricAlerts_fx_p_paccd_httpalert_name
  location: 'global'
  properties: {
    description: 'The application receives more than 5 requests/second.'
    severity: 1
    enabled: true
    scopes: [
      components_fx_p_eu_paccd_01_appi_name_resource.id
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      allOf: [
        {
          threshold: 5
          name: 'Metric1'
          metricNamespace: 'microsoft.insights/components'
          metricName: 'performanceCounters/requestsPerSecond'
          operator: 'GreaterThan'
          timeAggregation: 'Average'
          criterionType: 'StaticThresholdCriterion'
        }
      ]
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    }
    autoMitigate: true
    targetResourceType: 'microsoft.insights/components'
    targetResourceRegion: 'eastus'
    actions: [
      {
        actionGroupId: actionGroups_fx_p_eu_paccd_01_ag_name_resource.id
        webHookProperties: {
        }
      }
    ]
  }
}
