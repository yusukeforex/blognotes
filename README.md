firstly need to create all frames and then finally use bootstrap things to make it look better.

would like to add

post notes system(CRUD operations)
  with pictures, videos, can choose font systems like evernote.

user login system
  with password, reset password, send email to confirm the signup, forgot username, (all kinds of email system)

  to add password requirements
    install 'bcrypt'
    add has_secure_password to usermodle file 
    create migration by rails generate migration add_password_digest_to_users password_digest:string
    and then rails db:migrate
    you could check on rails console (create password, authnticate method)

    add this code in routes.rb file
    get 'signup', to: 'users#new'
    resources :users, except: [:new]


would like to show 'see all notes' in users show page link to notes show page that user have created
show flash messages 

https://stackoverflow.com/questions/17758401/how-to-create-categories-in-rails


login
signup
after login => homepage(create new notes, show writers, the latest notes if i could)
new note title, description, categories, submit button, cancel btn 
after create it => note show page with pagination, who created(link_to the user page)
user profile page(name, description, edit, profile pics)
categories page, all categories will be shown up and each of them have link_to
category => category show page each categories.all 
also edit pages for each of them, show, new

also image upload function would be awesome,