require 'spec_helper'

describe 'Cell to cell movement' do
  let(:map) { Map.new(height: 5, width: 6) }
  let(:player) { CellContent::Player.new }
  let(:mover) { Mover.new(map, player) }
  before { map.populate_cell(1, 1, player) }

  let(:original_position) {
        <<-ORIGNAL
 .  .  .  .  .  . 
 .  @  .  .  .  . 
 .  .  .  .  .  . 
 .  .  .  .  .  . 
 .  .  .  .  .  . 
        ORIGNAL
  }

  it 'moves left' do
    expect{ mover.move(:left) }.to change {
      map.draw
    }.from(
      original_position
    ).to(
        <<-ORIGNAL
 .  .  .  .  .  . 
 @  .  .  .  .  . 
 .  .  .  .  .  . 
 .  .  .  .  .  . 
 .  .  .  .  .  . 
        ORIGNAL
    )
  end

  it 'moves right' do
    expect{ mover.move(:right) }.to change {
      map.draw
    }.from(
      original_position
    ).to(
        <<-ORIGNAL
 .  .  .  .  .  . 
 .  .  @  .  .  . 
 .  .  .  .  .  . 
 .  .  .  .  .  . 
 .  .  .  .  .  . 
        ORIGNAL
    )
  end
  it 'moves up' do
    expect{ mover.move(:up) }.to change {
      map.draw
    }.from(
      original_position
    ).to(
        <<-ORIGNAL
 .  @  .  .  .  . 
 .  .  .  .  .  . 
 .  .  .  .  .  . 
 .  .  .  .  .  . 
 .  .  .  .  .  . 
        ORIGNAL
    )
  end
  it 'moves down' do
    expect{ mover.move(:down) }.to change {
      map.draw
    }.from(
      original_position
    ).to(
        <<-ORIGNAL
 .  .  .  .  .  . 
 .  .  .  .  .  . 
 .  @  .  .  .  . 
 .  .  .  .  .  . 
 .  .  .  .  .  . 
        ORIGNAL
    )
  end
end
