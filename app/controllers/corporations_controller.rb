class CorporationsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  # GET /corporations
  # GET /corporations.json
  def index
    unless user_signed_in?
      @corporations = Corporation.all
    else
      @user = current_user
      @corporations = @user.corporations
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @corporations }
    end
  end

  # GET /corporations/1
  # GET /corporations/1.json
  def show
    @corporation = Corporation.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @corporation }
      format.pdf do
        pdf = CertificatePdf.new(@corporation)
        send_data pdf.render, type: "application/pdf", 
                              disposition: "inline"

      end
    end
  end

  # GET /corporations/new
  # GET /corporations/new.json
  def new
    session[:corporation_params] ||= {}
    @corporation = Corporation.new(session[:corporation_params])
    @corporation.current_step = session[:corporation_step]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @corporation }
    end
  end

  # GET /corporations/1/edit
  def edit
    @corporation = Corporation.find(params[:id])
  end

  # POST /corporations
  # POST /corporations.json
  def create
    session[:corporation_params].deep_merge!(params[:corporation]) if params[:corporation]
    @corporation = Corporation.new(session[:corporation_params])
    @corporation.current_step = session[:corporation_step]
    if @corporation.valid?
      if params[:back_button]
        @corporation.previous_step
      
      elsif @corporation.last_step?
        @corporation.save
      
      else
        @corporation.next_step         
      end

      session[:corporation_step] = @corporation.current_step
      end   
    if @corporation.new_record?
      render 'new'     

    else
      session[:corporation_step] = session[:corporation_params] = nil
      redirect_to @corporation
    end
  end

  # PUT /corporations/1
  # PUT /corporations/1.json
  def update
    @corporation = Corporation.find(params[:id])

    respond_to do |format|
      if @corporation.update_attributes(params[:corporation])
        format.html { redirect_to @corporation, notice: 'Corporation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @corporation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /corporations/1
  # DELETE /corporations/1.json
  def destroy
    @corporation = Corporation.find(params[:id])
    @corporation.destroy

    respond_to do |format|
      format.html { redirect_to corporations_url }
      format.json { head :no_content }
    end
  end
end