# clean-slate-2
Clean Slate: Get even with your roommates, and live happily ever after. An app for settling your accounts.

* This is a new repository for Project-2 (created to correct a heroku deployment error) earlier commits and branches can be found here: https://github.com/schersh/Project-2/tree/tentAptId

The deployed heroku app can be found here: https://clean-slate-app.herokuapp.com/users/sign_in

For my second project, I'd like to create a "Clean Slate" app in rails that will allow roommates to track apartment expenses over the course of a month, and then use a "settle up" function to determine who owes what to whom at the end of the month. This app will make cost-sharing more organized and reduce the time and energy roommates need to devote to tallying up expenses and splitting them evenly among household members.

I currently have an unsolved error/bug in my deployed environment, which I did not encounter in my development environment. The error message "nil can't be coerced into Fixnum" appears occassionally when a new user logs in, who does not already have any expenses associated with their account. In my development environment I was able to solve this error by adding the code,
unless @apartment.expenses.empty? to prevent the method from running on an empty array, but it's not preventing the error in the deployed app. 
