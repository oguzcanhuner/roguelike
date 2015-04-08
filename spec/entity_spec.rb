require 'spec_helper'

# A basic class which describes the behvior of anything which can be added to a map
describe Entity do
  describe '#character' do
    let(:entity) { Entity.new }
    it 'must have a character representation' do
      #expect(entity.character).to(throw_error(NotImplementError))
    end
  end
end
