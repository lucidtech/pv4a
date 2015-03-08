module.exports = {
  attributes: {
    name: {
      familyName: 'string',
      givenName: 'string'
    }
    , email: 'string'
    , authProviderUniqueId: 'string'
    , organizationId: 'string'
    , getFullName: function() {
      return this.name.givenName + " " + this.name.familyName;
    }
    , getSomething: function() {
      return this.email
    }
  }

};
