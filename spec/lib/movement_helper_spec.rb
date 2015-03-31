require 'spec_helper'

describe MovementHelper do
  let(:map) { double(:map) }
  let(:helper) { MovementHelper.new(map: map) }
  let(:moveable) { double(:moveable, coords: [1, 1]) }

  describe '#move' do
    context 'given a moveable object' do
      it 'moves the given object to the left' do
        expect(map).to receive(:move_object).with(from: [1, 1], to: [0, 1])
        helper.move(moveable, direction: :left)
      end

      it 'moves the given object to the right' do
        expect(map).to receive(:move_object).with(from: [1, 1], to: [2, 1])
        helper.move(moveable, direction: :right)
      end

      it 'moves the given object to the right' do
        expect(map).to receive(:move_object).with(from: [1, 1], to: [1, 0])
        helper.move(moveable, direction: :up)
      end

      it 'moves the given object to the right' do
        expect(map).to receive(:move_object).with(from: [1, 1], to: [1, 2])
        helper.move(moveable, direction: :down)
      end
    end
  end
end
