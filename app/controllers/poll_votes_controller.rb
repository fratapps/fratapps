class PollVotesController < ApplicationController
  # GET /poll_votes
  # GET /poll_votes.xml
  def index
    @poll_votes = PollVote.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @poll_votes }
    end
  end

  # GET /poll_votes/1
  # GET /poll_votes/1.xml
  def show
    @poll_vote = PollVote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @poll_vote }
    end
  end

  # GET /poll_votes/new
  # GET /poll_votes/new.xml
  def new
    @poll_vote = PollVote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @poll_vote }
    end
  end

  # GET /poll_votes/1/edit
  def edit
    @poll_vote = PollVote.find(params[:id])
  end

  # POST /poll_votes
  # POST /poll_votes.xml
  def create
    @poll_vote = PollVote.new(params[:poll_vote])

    respond_to do |format|
      if @poll_vote.save
        format.html { redirect_to(@poll_vote, :notice => 'PollVote was successfully created.') }
        format.xml  { render :xml => @poll_vote, :status => :created, :location => @poll_vote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @poll_vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /poll_votes/1
  # PUT /poll_votes/1.xml
  def update
    @poll_vote = PollVote.find(params[:id])

    respond_to do |format|
      if @poll_vote.update_attributes(params[:poll_vote])
        format.html { redirect_to(@poll_vote, :notice => 'PollVote was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @poll_vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /poll_votes/1
  # DELETE /poll_votes/1.xml
  def destroy
    @poll_vote = PollVote.find(params[:id])
    @poll_vote.destroy

    respond_to do |format|
      format.html { redirect_to(poll_votes_url) }
      format.xml  { head :ok }
    end
  end
end
