require 'pry'
require 'user_nuker'

describe UserNuker do
  it "sreggin is bad" do
    result = UserNuker.new("sreggin").is_bad?
    expect(result).to eq(1)
  end

  it "NightyMiggers is bad" do
    result = UserNuker.new("NightyMiggers").is_bad?
    expect(result).to eq(1)
  end

  it "radar is not bad" do
    result = UserNuker.new("radar").is_bad?
    expect(result).to eq(0)
  end
end
