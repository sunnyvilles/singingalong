class Admin::EventsController < ApplicationController
	before_filter :confirm_logged_in
  before_filter :confirm_admin
	layout "admin/application.html"
  def index
		
    @events = Event.find(:all, :order => "id DESC")
    respond_to do |format|
      format.html 
      format.json { render json: @events }
    end
  end

  def only_admin
		if(!is_logged_in?)
			redirect_to "/admin"
			return
		end
	end
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @event }
    end
  end

  def new
    @event = Event.new
    @event.testimonial_videos.build
    @event.workshop_videos.build
    #@event.testimonials.build
    respond_to do |format|
      format.html 
      format.json { render json: @event }
    end
  end


  def edit
    
    @event = Event.find(params[:id])

  end


  def create

    file_names = []

    handle_file_upload(params,file_names)

    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
         handle_file_rename(@event.id,file_names)
        format.html { redirect_to "/admin/clinic/events/#{@event.id}/edit", notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end


  def update

    file_names=[] 
  
    handle_file_upload(params,file_names)

    @event = Event.find(params[:id])
 
    respond_to do |format|
      if @event.update_attributes(params[:event])
          
         handle_file_rename(@event.id,file_names)
   
        format.html { redirect_to "/admin/clinic/events/#{@event.id}/edit", notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        
        #format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to admin_events_url }
      format.json { head :no_content }
    end
  end


  private
  def handle_file_upload(params,file_names)
    count = 0

    3.times do

      if params[:event]["image_" + count.to_s]
      
        uploaded_io = params[:event]["image_" + count.to_s]

        File.open(Rails.root.join('public', 'images','events',
            uploaded_io.original_filename), 'wb') do |file|

          file.write(uploaded_io.read)
          
        end
        file_names[count] = uploaded_io.original_filename
      end
     
      count +=1
    end

  rescue => e
    logger.error( 'Upload failed. ' + e.to_s )
    flash[:error] = 'Upload failed. Please try again.'
    render :action => 'new'

  end
 


  def handle_file_rename(event_id,file_names)
    id_count = 0
   
    file_names.each { |file_name|
    if file_name
      
      File.rename(Rails.root.join('public', 'images','events',
          file_name.to_s),Rails.root.join('public', 'images','events',
          event_id.to_s + "-" + id_count.to_s + ".jpg"))
    end
      id_count +=1                                                       
    }

  rescue => e
    logger.error( 'file uploaded but file renaming failed . ' + id_count.to_s + e.to_s )
    flash[:error] = 'file uploaded but file renaming failed on server. Please try again.'


  end



end
