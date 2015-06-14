class PriorityLabelsController < ApplicationController
  # GET /priority_labels
  # GET /priority_labels.json
  def index
    @priority_labels = PriorityLabel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @priority_labels }
    end
  end

  # GET /priority_labels/1
  # GET /priority_labels/1.json
  def show
    @priority_label = PriorityLabel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @priority_label }
    end
  end

  # GET /priority_labels/new
  # GET /priority_labels/new.json
  def new
    @priority_label = PriorityLabel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @priority_label }
    end
  end

  # GET /priority_labels/1/edit
  def edit
    @priority_label = PriorityLabel.find(params[:id])
  end

  # POST /priority_labels
  # POST /priority_labels.json
  def create
    @priority_label = PriorityLabel.new(params[:priority_label])

    respond_to do |format|
      if @priority_label.save
        format.html { redirect_to @priority_label, notice: 'label was successfully created.' }
        format.json { render json: @priority_label, status: :created, location: @priority_label }
      else
        format.html { render action: "new" }
        format.json { render json: @priority_label.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /priority_labels/1
  # PUT /priority_labels/1.json
  def update
    @priority_label = PriorityLabel.find(params[:id])

    respond_to do |format|
      if @priority_label.update_attributes(params[:priority_label])
        format.html { redirect_to @priority_label, notice: 'Priority label was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @priority_label.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /priority_labels/1
  # DELETE /priority_labels/1.json
  def destroy
    @priority_label = PriorityLabel.find(params[:id])
    @priority_label.destroy

    respond_to do |format|
      format.html { redirect_to priority_labels_url }
      format.json { head :no_content }
    end
  end
end
