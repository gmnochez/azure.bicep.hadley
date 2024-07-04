param name string = ''
param location string = ''
param resource_group_name string = ''
param ip_configuration_name string = ''
param ip_configuration_subnet_id string = ''
param ip_configuration_private_ip_address_allocation string = ''
param ip_configuration_private_ip_address string = ''
param name_nsg string = ''
param location_nsg string = ''
param resource_group_name_nsg string = ''
param dns_servers array = []
param tags object = {}






resource networkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2023-05-01' existing = {
  name: name_nsg
}



resource nic 'Microsoft.Network/networkInterfaces@2023-11-01' = {
  name: name
  location: location
  tags: tags
  properties: {
    ipConfigurations: [
      {
        name: ip_configuration_name
        properties: {
          privateIPAllocationMethod: ip_configuration_private_ip_address_allocation
          privateIPAddress: ip_configuration_private_ip_address
          subnet: {
            id: ip_configuration_subnet_id
          }
        }
      }
    ]
    dnsSettings: {
        dnsServers: dns_servers
    }
    networkSecurityGroup: {
      id: networkSecurityGroup.id
    }
  }
}
