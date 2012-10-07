describe MoviesController do
  describe 'click on "Find Movies With Same Director"' do
    before :each do
     @m = mock('Movie')
     @m.stub(:director).and_return('hamed')
		 Movie.should_receive(:find_by_id).and_return(@m)
		 @movies = [mock('Movie', :director => 'hamed')]
     Movie.should_receive(:find_all_by_director).and_return(@m)
     
    end

		it 'should render correct view' do
      get :fmwsd, {:id=>'1'}
		  response.should_render_template('fmwsd')
    end
		it 'should assign correct movie' do
      get :fmwsd, {:id=>'1'}
			assigns(:movies).should == @m
		end
	end
	describe 'cannot find movies' do
		before :each do
			mov = mock('Movie', :title =>'x', :director=>nil)
    	Movie.should_receive(:find_by_id).and_return(mov)
      Movie.should_not_receive(:find_all_by_director).and_return(mov)
      get :fmwsd, {:id => '1'}
    end

		it "should have no director" do
    	assigns(:director).should == nil
    end
      
    it "should redirect to home page" do
    	response.should redirect_to movies_path
    end
      
    it "should display a message" do
    	flash[:notice].should == "'x' has no director info"
    end
  end
end


