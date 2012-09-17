class HappiesController < ApplicationController
  # GET /happies
  # GET /happies.json
  def index
    @happies = Happy.list

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @happies }
    end
  end

  # POST /happies
  # POST /happies.json
  def create
    @happy = Happy.create(params[:happy])
    # 
    # respond_to do |format|
    #   if @happy.save
    #     format.html { redirect_to @happy, notice: 'Happy was successfully created.' }
    #     format.json { render json: @happy, status: :created, location: @happy }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @happy.errors, status: :unprocessable_entity }
    #   end
    # end
  end

end
