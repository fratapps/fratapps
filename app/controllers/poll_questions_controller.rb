class PollQuestionsController < ApplicationController
  # GET /poll_questions
  # GET /poll_questions.xml
  def index
    @poll_questions = PollQuestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @poll_questions }
    end
  end

  # GET /poll_questions/1
  # GET /poll_questions/1.xml
  def show
    @poll_question = PollQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @poll_question }
    end
  end

  # GET /poll_questions/new
  # GET /poll_questions/new.xml
  def new
    @poll_question = PollQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @poll_question }
    end
  end

  # GET /poll_questions/1/edit
  def edit
    @poll_question = PollQuestion.find(params[:id])
  end

  # POST /poll_questions
  # POST /poll_questions.xml
  def create
    @poll_question = PollQuestion.new(params[:poll_question])

    respond_to do |format|
      if @poll_question.save
        format.html { redirect_to(@poll_question, :notice => 'PollQuestion was successfully created.') }
        format.xml  { render :xml => @poll_question, :status => :created, :location => @poll_question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @poll_question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /poll_questions/1
  # PUT /poll_questions/1.xml
  def update
    @poll_question = PollQuestion.find(params[:id])

    respond_to do |format|
      if @poll_question.update_attributes(params[:poll_question])
        format.html { redirect_to(@poll_question, :notice => 'PollQuestion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @poll_question.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /poll_questions/1
  # DELETE /poll_questions/1.xml
  def destroy
    @poll_question = PollQuestion.find(params[:id])
    @poll_question.destroy

    respond_to do |format|
      format.html { redirect_to(poll_questions_url) }
      format.xml  { head :ok }
    end
  end
end
