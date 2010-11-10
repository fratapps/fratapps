class PollAnswersController < ApplicationController
  # GET /poll_answers
  # GET /poll_answers.xml
  def index
    @poll_answers = PollAnswer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @poll_answers }
    end
  end

  # GET /poll_answers/1
  # GET /poll_answers/1.xml
  def show
    @poll_answer = PollAnswer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @poll_answer }
    end
  end

  # GET /poll_answers/new
  # GET /poll_answers/new.xml
  def new
    @poll_answer = PollAnswer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @poll_answer }
    end
  end

  # GET /poll_answers/1/edit
  def edit
    @poll_answer = PollAnswer.find(params[:id])
  end

  # POST /poll_answers
  # POST /poll_answers.xml
  def create
    @poll_answer = PollAnswer.new(params[:poll_answer])

    respond_to do |format|
      if @poll_answer.save
        format.html { redirect_to(@poll_answer, :notice => 'PollAnswer was successfully created.') }
        format.xml  { render :xml => @poll_answer, :status => :created, :location => @poll_answer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @poll_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /poll_answers/1
  # PUT /poll_answers/1.xml
  def update
    @poll_answer = PollAnswer.find(params[:id])

    respond_to do |format|
      if @poll_answer.update_attributes(params[:poll_answer])
        format.html { redirect_to(@poll_answer, :notice => 'PollAnswer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @poll_answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /poll_answers/1
  # DELETE /poll_answers/1.xml
  def destroy
    @poll_answer = PollAnswer.find(params[:id])
    @poll_answer.destroy

    respond_to do |format|
      format.html { redirect_to(poll_answers_url) }
      format.xml  { head :ok }
    end
  end
end
