require 'rails_helper'

RSpec.describe Ds18b20, type: :model do
  it {should respond_to :name}
  it {should respond_to :path}
  it {should respond_to :file}
end
