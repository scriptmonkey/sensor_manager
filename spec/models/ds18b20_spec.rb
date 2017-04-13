require 'rails_helper'

RSpec.describe Ds18b20, type: :model do
  it {should respond_to :name}
  it {should respond_to :path}
  it {should respond_to :file}
  it {should respond_to :creading }
  it {should respond_to :freading }

  context 'has a file to read' do

    it 'expect a temp reading' do
      expect(build(:ds18b20).creading).to eq('69')
      expect(build(:ds18b20).freading).to eq('156')
    end
  end
end
