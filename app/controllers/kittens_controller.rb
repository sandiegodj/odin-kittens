class KittensController < ApplicationController
  
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render :json => @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:sucess] = "Kitten created!"
      redirect_to @kitten
    else
      flash.now[:error] = "You have errors in your form"
      render 'new'
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    if @kitten.delete
      flash[:success] = "Kitten destroyed!"
      redirect_to kittens_path
    else
      flash[:error] = "An error has occured"
      render @kitten
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      flash[:success] = "Kitten updates successfully"
      redirect_to @kitten
    end
  end


  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
