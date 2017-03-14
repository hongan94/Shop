class ThingController < ApplicationController
  layout 'pdf'

  def index
    @user = User.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name", encoding: 'UTF-8'   # Excluding ".pdf" extension.
      end
    end
  end

  def show
  end
end
