ActiveAdmin.register Technique do
  permit_params :title, :description, :age, :gender, :total_steps, :duration, :status, :photo, :problems

  form do |f|
    f.inputs do
      f.input :problems
      f.input :title
      f.input :description
      f.input :age
      f.input :gender
      f.input :total_steps
      f.input :duration
      f.input :status
      f.input :photo, as: :file
    end
    f.actions
  end


end
