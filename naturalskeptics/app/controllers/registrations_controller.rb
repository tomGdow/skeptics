class RegistrationsController < Devise::RegistrationsController

  require 'xmlfunctions'

   def index

   end

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

        TGD.write_users_to_json
      end
  end

  def update
    super
    @cart = current_cart

    TGD.write_users_to_json
  end

  def edit
    @cart = current_cart
  end

  def show
    def show
      @user = User.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @user }
      end
    end
  end


end