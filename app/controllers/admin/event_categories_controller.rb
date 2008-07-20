class Admin::EventCategoriesController < AdministrativeController
  # GET /event_categories
  # GET /event_categories.xml
  def index
    @event_categories = EventCategory.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @event_categories }
    end
  end

  # GET /event_categories/1
  # GET /event_categories/1.xml
  def show
    @event_category = EventCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event_category }
    end
  end

  # GET /event_categories/new
  # GET /event_categories/new.xml
  def new
    @event_category = EventCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event_category }
    end
  end

  # GET /event_categories/1/edit
  def edit
    @event_category = EventCategory.find(params[:id])
  end

  # POST /event_categories
  # POST /event_categories.xml
  def create
    @event_category = EventCategory.new(params[:event_category])

    respond_to do |format|
      if @event_category.save
        flash[:notice] = 'EventCategory was successfully created.'
        format.html { redirect_to(admin_event_category_path(@event_category)) }
        format.xml  { render :xml => @event_category, :status => :created, :location => @event_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /event_categories/1
  # PUT /event_categories/1.xml
  def update
    @event_category = EventCategory.find(params[:id])

    respond_to do |format|
      if @event_category.update_attributes(params[:event_category])
        flash[:notice] = 'EventCategory was successfully updated.'
        format.html { redirect_to(admin_event_category_path(@event_category)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /event_categories/1
  # DELETE /event_categories/1.xml
  def destroy
    @event_category = EventCategory.find(params[:id])
    @event_category.destroy

    respond_to do |format|
      format.html { redirect_to(admin_event_categories_url) }
      format.xml  { head :ok }
    end
  end
end
