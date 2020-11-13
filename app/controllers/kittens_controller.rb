class KittensController < ApplicationController
    def index
        @kittens = Kitten.all
    end

    def show
        set_kitten
    end

    def new
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.new(kitten_params)

        if @kitten.save
            flash[:success] = "Kitten created!"
            redirect_to @kitten
        else
            flash[:error] = "Whoops! There was an error creating your kitten!"
            render :new
        end
    end

    def edit
        set_kitten
    end

    def update
        set_kitten

        if @kitten.update(kitten_params)
            flash[:success] = "Kitten updated!"
            redirect_to @kitten
        else
            flash[:error] = "Whoops! There was an error updating your kitten!"
            render :edit
        end
    end

    def destroy
        set_kitten

        if @kitten.destroy
            flash[:success] = "Kitten deleted!"
            redirect_to root_path
        else
            flash[:error] = "Whoops! There was an error deleting your kitten!"
            redirect_to @kitten
        end
    end


    private

    def set_kitten
        @kitten = Kitten.find(params[:id])
    end

    def kitten_params
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
