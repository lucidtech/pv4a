passport = require ('passport')
wsfedSaml2 = require ('passport-azure-ad').WsfedStrategy

module.exports.passport = {

  wsfedSaml2Config: {
    realm : 'http://localhost:1337'
    , identityProviderUrl: 'https://login.windows.net/9c9999a5-ba41-4185-9f58-1c8fb03291a6/wsfed'
    , identityMetadata : 'https://login.windows.net/9c9999a5-ba41-4185-9f58-1c8fb03291a6/federationmetadata/2007-06/federationmetadata.xml'
    , logoutUrl: 'http://localhost:1337'
  }

}
