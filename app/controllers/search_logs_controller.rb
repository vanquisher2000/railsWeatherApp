class SearchLogsController < ApplicationController
  before_action :set_search_log, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, only: [:create]
  

  # GET /search_logs or /search_logs.json
  def index
    @search_logs = SearchLog.all
    require "net/http"
    require "json"
    require "date"
    @date = Date.today
    @year = params[:year] || @date.year
    year = @year.to_s  
    @month = params[:month] || @date.month
    month = @month.to_s 
    @day = params[:day] || @date.day
    dayy = @day.to_s 
    @dateString = year + "-" + month + "-" + dayy 
    currentDate = @date.to_s
    @zipCode = params[:q] || 20002
    zipCodeString = @zipCode.to_s
    @url = "https://www.airnowapi.org/aq/forecast/zipCode/?format=application/json&zipCode="+ zipCodeString  +"&date="+ @dateString +"&distance=25&API_KEY=E4115853-8D5F-498D-9233-69D2B8C7B6FC"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
  end

  # GET /search_logs/1 or /search_logs/1.json
  def show
  end

  # GET /search_logs/new
  def new
    @search_log = SearchLog.new
  end

  # GET /search_logs/1/edit
  def edit
  end

  def search

  end

  # POST /search_logs or /search_logs.json
  def create
    @search_log = SearchLog.new(search_log_params)

    respond_to do |format|
      if @search_log.save
        format.html { redirect_to @search_log, notice: "Search log was successfully created." }
        format.json { render :show, status: :created, location: @search_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @search_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_logs/1 or /search_logs/1.json
  def update
    respond_to do |format|
      if @search_log.update(search_log_params)
        format.html { redirect_to @search_log, notice: "Search log was successfully updated." }
        format.json { render :show, status: :ok, location: @search_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @search_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_logs/1 or /search_logs/1.json
  def destroy
    @search_log.destroy
    respond_to do |format|
      format.html { redirect_to search_logs_url, notice: "Search log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_log
      @search_log = SearchLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def search_log_params
      params.require(:search_log).permit(:date_issue, :date_forcast, :reporting_area, :state_code, :latitude, :longitude, :parameter_name, :aqi, :action_day, :disscussion )
    end
end
