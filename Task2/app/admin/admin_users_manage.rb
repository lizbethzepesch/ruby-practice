ActiveAdmin.register User do
  permit_params :name, :email, :age, :gender, :about, :password, :avatar_user

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :age
      f.input :gender
      f.input :about
      f.input :password
      f.input :avatar_user, as: :file
    end
    f.actions
  end

end
