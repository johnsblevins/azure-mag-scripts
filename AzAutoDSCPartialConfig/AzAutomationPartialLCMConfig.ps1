[DSCLocalConfigurationManager()]
configuration PartialConfigDemoConfigID
{
    Node localhost
    {
        Settings
        {
            RefreshMode                     = 'Pull'
            ConfigurationID                 = '1d545e3b-60c3-47a0-bf65-5afc05182fd0'
            RefreshFrequencyMins            = 30
            RebootNodeIfNeeded              = $true
        }
        ConfigurationRepositoryWeb AzAutoRepoWeb1
        {
            ServerUrl = "https://eus2-agentservice-prod-1.azure-automation.net/accounts/6ae10ca6-7714-4f61-a233-5507b431ff3e"
            RegistrationKey = "+ZQEe5osKSO58LumghpVswzbI3QvWb76qLUeQHhn445hNsAw04j4CC8E9NKiERCjiL4rtvupt2hiOl7Av3RjGw=="
            ConfigurationNames = "BaseOSConfig2012R2_ver3_0_01"
        }
        ConfigurationRepositoryWeb AzAutoRepoWeb2
        {
            ServerUrl = "https://eus2-agentservice-prod-1.azure-automation.net/accounts/77cfc838-1eb8-4289-830e-d93ab824eecc"
            RegistrationKey = "2hUyH5RlfZhEJTleyI30MpqL8XPO6a+5/UPBQZgh+pKixSVsuW5uA6/3aAW53b4bbs0GaYluPfKW1PGBthIRLA=="
            ConfigurationNames = "AppConfig_v1_0_0"
        }

        ResourceRepositoryWeb AzAutoResRepoWeb1
        {
            ServerUrl = "https://eus2-agentservice-prod-1.azure-automation.net/accounts/6ae10ca6-7714-4f61-a233-5507b431ff3e"
            RegistrationKey = "+ZQEe5osKSO58LumghpVswzbI3QvWb76qLUeQHhn445hNsAw04j4CC8E9NKiERCjiL4rtvupt2hiOl7Av3RjGw=="
        }
        ResourceRepositoryWeb AzAutoResRepoWeb2
        {
            ServerUrl = "https://eus2-agentservice-prod-1.azure-automation.net/accounts/77cfc838-1eb8-4289-830e-d93ab824eecc"
            RegistrationKey = "2hUyH5RlfZhEJTleyI30MpqL8XPO6a+5/UPBQZgh+pKixSVsuW5uA6/3aAW53b4bbs0GaYluPfKW1PGBthIRLA=="
        }

        PartialConfiguration BaseConfig
        {
            Description                     = 'Configuration for the Base OS'
            ConfigurationSource             = @("[ConfigurationRepositoryWeb]AzAutoResRepoWeb1'","[ConfigurationRepositoryWeb]AzAutoResRepoWeb1'"
            RefreshMode                     = 'Pull'
        }
           PartialConfiguration AppConfig
        {
            Description                     = 'Configuration for the Application'
            ConfigurationSource             = '[ConfigurationRepositoryWeb]AzAutoResRepoWeb2'
            DependsOn                       = '[PartialConfiguration]BaseConfig'
            RefreshMode                     = 'Pull'
        }
    }
}
PartialConfigDemo