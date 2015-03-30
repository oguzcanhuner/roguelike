require 'spec_helper'

describe MovementHelper do
  describe '.calculate_movement' do
    context 'when moving right' do
      it 'returns a begining and ending set of coordinates for a movement' do
        expect( 
           MovementHelper.calculate_movement(current_coordinates: [0, 0], 
                                             direction: 'l')
        ).to eq(
          {from: [0, 0], to: [1, 0] }
        )
      end
    end
    context 'when moving left' do
      it 'returns a begining and ending set of coordinates for a movement' do
        expect( 
           MovementHelper.calculate_movement(current_coordinates: [0, 0], 
                                             direction: 'h')
        ).to eq(
          {from: [0, 0], to: [-1, 0] }
        )
      end
    end
    context 'when moving up' do
      it 'returns a begining and ending set of coordinates for a movement' do
        expect( 
           MovementHelper.calculate_movement(current_coordinates: [0, 0], 
                                             direction: 'k')
        ).to eq(
          {from: [0, 0], to: [0, -1] }
        )
      end
    end
    context 'when moving down' do
      it 'returns a begining and ending set of coordinates for a movement' do
        expect( 
           MovementHelper.calculate_movement(current_coordinates: [0, 0], 
                                             direction: 'j')
        ).to eq(
          {from: [0, 0], to: [0, 1] }
        )
      end
    end
  end
end
