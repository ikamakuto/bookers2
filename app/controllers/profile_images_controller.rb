class ProfileImagesController < ApplicationController
  def new
    @profile_image = ProfileImage.new
  end

  def create
    @profile_image = ProfileImage.new(profile_image_params)
    @pprofile_image.user_id = current_user.id
    @profile_image.save
    redirect_to profile_images_path
  end

  def index
    @profile_image = ProfileImage.page(params[:page]).reverse_order
  end

  def show
      @profile_image = ProfileImage.find(params[:id])
  end

  def destroy
    @profile_image = PostImage.find(params[:id])
    @profile_image.destroy
    redirect_to profile_images_path
  end

  private

  def profile_image_params
    params.require(:profile_image).permit(:name, :image, :caption)
  end
end