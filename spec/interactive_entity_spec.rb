require 'spec_helper'

# A class which provides additional functionality to the base entity class
describe InteractiveEntity do
  let(:cell) { Cell.new(Coordinate.new(1, 5)) }
  let(:map) { double(:map) }
  let(:entity) { InteractiveEntity.new(map: map) }

  describe '#coord' do
    context 'given a valid cell' do
      it 'has coordinates corresponding to the parent cell' do
        entity.cell = cell
        expect(entity.coord).to eql Coordinate.new(1, 5)
      end
    end
  end

  describe '#move' do
    it 'moves the player in the right direction' do
      expect(map).to receive(:move_object)
      entity.cell = cell
      entity.move(direction: :left)
    end
  end

  describe '#attack' do
    it 'attacks a target object' do
      npc = NPC.new(InteractiveEntity.new(map: double(:map)))
      player = Player.new(InteractiveEntity.new(map: double(:map)))

      expect{player.attack(npc)}.to change{
        npc.health
      }
    end
  end

  describe '#take_damange' do
    it 'takes damage' do
      player = Player.new(InteractiveEntity.new(map: double(:map)))
      expect{player.take_damage(5)}.to change{
        player.health
      }
    end
  end
end
