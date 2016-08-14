require 'pry'
require 'user_nuker'

describe UserNuker do
  it "sreggin is bad" do
    result = UserNuker.new("sreggin").is_bad?
    expect(result).to eq(1)
  end

  it "DikshitNijjer is bad" do
    result = UserNuker.new("DikshitNijjer").is_bad?
    expect(result).to eq(2)
  end

  it "NightyMiggers is bad" do
    result = UserNuker.new("NightyMiggers").is_bad?
    expect(result).to eq(1)
  end

  it "radar is not bad" do
    result = UserNuker.new("radar").is_bad?
    expect(result).to eq(0)
  end

  it "pen is not bad" do
    result = UserNuker.new("pen").is_bad?
    expect(result).to eq(0)
  end

  it "n008f4g is not bad" do
    result = UserNuker.new("n008f4g").is_bad?
    expect(result).to eq(0)
  end

  it "d_ is not bad" do
    result = UserNuker.new("d_").is_bad?
    expect(result).to eq(0)
  end

  it "karapetyan is not bad" do
    result = UserNuker.new("karapetyan").is_bad?
    expect(result).to eq(0)
  end

  it "ignazioc is not bad" do
    result = UserNuker.new("ignazioc").is_bad?
    expect(result).to eq(0)
  end
end
