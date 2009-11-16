require 'spec_helper'

describe "/chunks/new.html.erb" do
  include ChunksHelper

  before(:each) do
    @source = Factory(:source)
    assigns[:chunk] = stub_model Chunk, :new_record? => true, :source => @source
  end

  it "renders new chunk form" do
    render

    response.should have_tag("form[action=?][method=post]", source_chunks_path(@source)) do
      with_tag("select#chunk_begin_1i[name=?]", "chunk[begin(1i)]")      
      with_tag("select#chunk_end_1i[name=?]", "chunk[end(1i)]")
    end
  end
end
