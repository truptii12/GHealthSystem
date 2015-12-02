class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
   def isAvailable
     @appointments_list = Appointment.all
    @appointments_list.each do |appointment|
      if((appointment.appointmentdate = 'self.appointmentdate')) 
         puts " Duration clash "
        return true
      else
        return false
      end
    end
  end
  
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
     #respond_to do |format|
  #  if(!self.isAvailable)
    @appointment = Appointment.new
   # else
    #  format.html { redirect_to @appointment, notice: 'Appointment was successfully_created.' }
     #   format.json { render :show, status: :created, location: @appointment }
    #end
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
   
    @appointment = Appointment.new(appointment_params)
  #  @appointment.startTime = params[:appointment][:startTime]
   # @appointment.comment = params[:appointment][:comment]
  #  @appointment.patient_id = params[:appointment][:patient_id]
   # @appointment.doctor_id = params[:appointment][:doctor_id]
    #@appointment.appointmentdate = params[:appointment][:appointmentdate]
    
     respond_to do |format|
        @appointments_list = Appointment.all
        if(@appointmenent_list.nil?)
          puts "***no appointments****"
          if @appointment.save then
            format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
            format.json { render :show, status: :created, location: @appointment }
          end
        end 
        
          
          @appointments_list.each do |appointment|
        if((appointment.appointmentdate = 'self.appointmentdate')) 
           puts " Duration clash "
            format.html { redirect_to @appointment, notice: 'Appointment slot already booked.' }
          format.json { render :show, status: :unprocessable_entity }
        else if @appointment.save
          format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
          format.json { render :show, status: :created, location: @appointment }
        else
          format.html { render :new }
          format.json { render json: @appointment.errors, status: :unprocessable_entity }
        end
        end
      end
    end
  end


  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:appointmentdate, :startTime, :comment, :patient_id, :doctor_id)
    end
    
   
end

