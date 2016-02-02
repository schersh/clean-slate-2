# clean-slate-2
Clean Slate: Get even with your roommates, and live happily ever after. An app for settling your accounts.

* This is a new repository for Project-2 (created to correct a heroku deployment error) earlier commits and branches can be found here: https://github.com/schersh/Project-2/tree/tentAptId

A video walk-through of the functionality of the application can be found here: https://www.youtube.com/watch?v=eXAU_U-txmw&feature=em-upload_owner

The deployed heroku app can be found here: https://clean-slate-app.herokuapp.com/users/sign_in

If would like to access the application as a registered user, you can use this sample log-in: 

user email: sarah@test.com

password: password

For my second project, I'd like to create a "Clean Slate" app in rails that will allow roommates to track apartment expenses over the course of a month, and then use a "settle up" function to determine who owes what to whom at the end of the month. This app will make cost-sharing more organized and reduce the time and energy roommates need to devote to tallying up expenses and splitting them evenly among household members.


When installing locally, please fork and clone this repository to your own machine and then run the following in the command line to set up your database:

$ rake db:create

$ rake db:migrate

$ rails s (to open the server on localhost:3000)
