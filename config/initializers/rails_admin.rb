RailsAdmin.config do |config|


  #Check if the user is signed in
  config.authenticate_with do
    unless current_user
      session[:return_to] = request.url
      redirect_to '/', alert:"You must first log in or sign up before accessing this page."
    end
  end 

  #If the current_user.admin field is false than redirect
  config.authorize_with do
    redirect_to '/', alert: "You are not authorized to access that page" unless current_user.admin == true
  end
  
  #Choose what to show in the list for Lab
  config.model 'Lab' do
    list do
      field :id
      field :title
      field :email
      field :user_id 
      field :director
      field :webpage
      field :created_at
      field :updated_at 
      field :description
      field :req
      field :suggested
      field :year
    end
  end

  #Choose what to show in the list for User
  config.model 'User' do
    list do
      field :id
      field :email
      field :labs
      field :current_sign_in_at
      field :last_sign_in_at
      field :admin
      field :created_at
      field :current_sign_in_ip
      field :last_sign_in_ip
      field :created_at
      field :updated_at
      field :reset_password_sent_at
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    all
    import
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
