findById = (id, fn) ->
  User.findById id
    .done (err, user) ->
      if err
        fn null, null
      else
        fn null, user

findByEmail = (email, fn) ->
  User.findByEmail email
    .done (err, user) ->
      if err
        fn null, null
      else
        fn null, user

findByAzureId  = (id, fn) ->
  User.findByAzureId id
    .done (err, user) ->
      if err
        fn null, null
      else
        fn null, user

isAuthenticated = (req, res, next) ->
  if req.isAuthenticated()
    return next
  res.redirect '/login'

login = passport.authenticate 'wsfed-saml2' , failureRedirect: '/', failureFlash : true, (req, res) ->
  res.redirect '/'

loginCallback = @login
# login and login callback objects can be the same

logout = (req, res) ->
  req.logout()

  wsfedSaml2.logout {}, (err, url) ->
    if(err)
      res.redirect '/'
    else
      res.redirect url

passport.serializeUser = (user, done) ->
  done null, user.id

passport.deserializeUser = (id, done) ->
  findById id, (err, user) ->
    done err, user

passport.use new wsfedSaml2 passport.wsfedSaml2Config, (profile, done) ->
  if !profile.email
    return done new Error 'Email not found', null
  process.nextTick () ->
    findByEmail profile.email (err, user) ->
      if err
        return done err
      if !user
        User.create profile (err, user) ->
          if err
            return new Error 'unable to create new User', null
          return done null, user

passport.use wsfedSaml2
