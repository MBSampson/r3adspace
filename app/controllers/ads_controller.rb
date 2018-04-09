class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy, :toggle_published]
  before_action :set_categories, only: [:index, :category_filter, :poster_filter]
  before_action :set_users, only: [:poster_filter]
  before_action :authenticate_user!, only: [:poster_filter, :edit, :new, :create, :update, :buy_ad]
  before_action :set_current_user



  def index
    @ads = Ad.page(params[:page]).per(15).where(published: "published", sold: false).order(id: :desc)
    @page = __method__.to_s
  end

  def category_filter
    @ads = Ad.page(params[:page]).per(15).where(category_id: params[:category_id], published: "published", sold: false)
    @category = Category.find(params[:category_id])
    @page = __method__.to_s
  end

  # Filters by the ad's poster
  def poster_filter
    if params[:category_id] == nil
      @ads = Ad.page(params[:page]).per(15).where(user_id: params[:poster]).order(sold: :desc)
      @page = __method__.to_s
    else
      @ads = Ad.page(params[:page]).per(15).where(user_id: params[:poster], category_id: params[:category_id])
      @page = __method__.to_s
    end
  end


  def buy_ad
    @ad = Ad.find(params[:ad_id])
    if current_user.id == @ad.user_id
      flash[:notice] = "You may not buy your own items."
      redirect_to ads_path
    else
      redirect_to new_order_path(:ad_id => @ad.id )
    end
  end


  def show
    @form_type = 'show'
    @page = __method__.to_s
  end


  def toggle_published
    if @ad.published == "published"
      @ad.update!(published: "draft")
      redirect_to ad_path, notice: "Your ad is now hidden."
    else
      @ad.update!(published: "published")
      redirect_to ads_url, notice: "Your ad has been posted!"
    end
  end


  def new
    @ad = Ad.new
    @form_type = 'new'
  end


  def edit
    @form_type = 'edit'
    @page = __method__.to_s
  end


  def create
    @ad = Ad.new(ad_params)
    @form_type = 'new'
    @ad.user = current_user

    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Ad was successfully created.' }
        format.json { render :show, status: :created, location: @ad }
      else
        format.html { render :new }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @form_type = 'edit'
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad }
      else
        format.html { render :edit }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_url, notice: 'Ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

    def set_users
      @users = User.all
    end

    def set_current_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:ad).permit(:title, :description, :price, :category_id, :user_id, :photo, :quantity, :street, :city, :state, :zipcode)
    end

end
