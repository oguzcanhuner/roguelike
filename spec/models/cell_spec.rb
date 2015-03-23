require 'spec_helper'

describe Cell do
  let(:cell) { Cell.new(5, 4) } 

  it 'has an x position' do
    expect(cell.x).to eq 5
  end
  it 'has a y position' do
    expect(cell.y).to eq 4
  end
end
