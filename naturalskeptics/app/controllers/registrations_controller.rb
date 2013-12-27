class RegistrationsController < Devise::RegistrationsController

  require 'xmlfunctions'



  def new
    super
    @cart = current_cart
  end

  def create
    super
    @cart = current_cart

      if @user.save

        #TGD.write_to_sorted_xml 'xmlNewUsers.xml'

        TGD.myadd(@user.email,
              @user.id,
              @user.created_at.strftime("%d %b. %Y"),
              @user.updated_at.strftime("%d %b. %Y"),
              @user.sign_in_count,
              @user.current_sign_in_at.strftime("%d %b. %Y"),
              @user.last_sign_in_at.strftime("%d %b. %Y"),
              @user.current_sign_in_ip,
              @user.last_sign_in_ip,
              File.join(Rails.root, 'public', 'xmlNewUsers.xml')
        )
      end
  end

  def update
    super
    @cart = current_cart
  end

  def edit
    @cart = current_cart
  end

  def show
    super
  end


end