require "env_var"

RSpec.describe EnvVar do
  def e
    ENV
  end

  after do
    e.delete("ENABLED")
    e.delete("DISABLED")
  end

  it "detected enabled environment variables" do
    %w[1 true].each do |v|
      e["ENABLED"] = v
      expect(described_class).to be_enabled("ENABLED")
    end
  end

  it "detected disabled environment variables" do
    %w[0 false].each do |v|
      e["DISABLED"] = v
      expect(described_class).to be_disabled("DISABLED")
    end
  end

  it "delegates to ENV for unknown methods" do
    ENV.public_methods.each do |method|
      expect(described_class).to respond_to(method)
      expect(described_class).to_not respond_to(:extra_little_sanity_check_here)
    end
  end

  context "$ENV" do
    it "works!" do
      load File.join(__dir__, "../lib", "$ENV.rb")
      expect($ENV).to eq EnvVar
      expect(ENV).to_not eq EnvVar
    end
  end
end
