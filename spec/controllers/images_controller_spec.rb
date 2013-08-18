require 'spec_helper'

describe ImagesController do
  render_views

  describe '#GET new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe '#GET index' do
    context 'with a valid search query' do
      before(:each) do
        get :index, search: 'tokyo'
      end

      it 'assigns the correct instance variable' do
        assigns(:query).should eq('tokyo')
      end

      it 'renders the index template' do
        expect(response).to render_template('index')
      end

      it 'assigns the correct number of results' do
        assigns(:results).should have(20).items
      end
    end

    context 'with an empty search query' do
      before(:each) do
        get :index, search: ''
      end

      it 'assigns the correct instance variable' do
        assigns(:query).should eq('')
      end

      it 'renders the index template' do
        expect(response).to render_template('index')
      end

      it 'assigns the correct number of results' do
        assigns(:results).should have(20).items
      end
    end
  end
end
