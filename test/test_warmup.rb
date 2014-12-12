require 'minitest/autorun'
require 'docker-tdd'
require 'open-uri'
require 'net/http'

describe "Extreme-startup-warmup" do
  include DockerTdd::ContainerPlugin

  def containers
    @xs = DockerTdd::Container.new "tclavier/extreme-startup", env: ['WARMUP=1'], boottime: 1
  end

  it "must listen in http on port 3000" do
    open(url('/')).status[0].must_equal '200'
  end

  it "must restart to change round" do
    params = {'param1' => 'value1'}
    url = URI.parse(url('/advance_round'))
    resp = Net::HTTP.post_form(url, params)
    resp.code.must_equal '500'
  end

  def url(path)
    o = "http://#{@xs.address}:3000#{path}"
  end
end

