require 'docker-tdd'
require 'open-uri'
require 'minitest/autorun'

describe "Extreme-startup" do
  include DockerTdd::ContainerPlugin

  def containers
    @xs = DockerTdd::Container.new "tclavier/extreme-startup", boottime: 1
  end

  it "must listen in http on port 3000" do
    open(url('/')).status[0].must_equal '200'
  end

  it "can change round" do
    params = {'param1' => 'value1'}
    url = URI.parse(url('/advance_round'))
    resp = Net::HTTP.post_form(url, params)
    resp.code.must_equal '200'
  end

  def url(path)
    "http://#{@xs.address}:3000#{path}"
  end

end

