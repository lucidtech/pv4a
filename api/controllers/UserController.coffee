# /**
#  * UserController
#  *
#  * @description :: Server-side logic for managing Users
#  * @help        :: See http://links.sailsjs.org/docs/controllers
#  */

module.exports =

	listUsers : (req, res) ->
    User.find {}, (err, result) ->
      if err
        return new Error ('there was an error')
      res.send result
