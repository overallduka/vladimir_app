ActiveAdmin.register User do
permit_params :email, :password, :password_confirmation, :balance

 index do
    column :email
    column :balance
    actions
 end

 form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :balance
    end
    f.actions
  end


end
