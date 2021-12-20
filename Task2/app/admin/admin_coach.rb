ActiveAdmin.register Coach do
  permit_params :name, :email, :age, :gender, :about, :password, :avatar, :education, :experience, :licenses

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :age
      f.input :gender
      f.input :about
      f.input :password
      f.input :education
      f.input :experience
      f.input :licenses
      f.input :avatar, as: :file
    end
    f.actions
  end

  filter :email
  filter :name
  filter :age


end
