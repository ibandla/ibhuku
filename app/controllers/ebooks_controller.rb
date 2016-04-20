class EbooksController < ApplicationController
  def index
    @ebooks = Ebook.all
  end

  def new
    @ebook = Ebook.new
  end

  def create
    @ebook = Ebook.new(ebook_params)
    if @ebook.save
      redirect_to ebooks_path, notice: "The Ebook #{@ebook.title} has been uploaded"
    else
      render "new"
    end
  end

  def destroy
    @ebook  = Ebook.find(params[:id])
    @ebook.destroy
    redirect_to ebooks_path, notice:"The Ebook#{@ebook.title} has been deleted."

  end
  private
    def ebook_params
      params.require(:ebook).permit(:title, :pdf, :author, :description, :price)
    end
end