
module Commands
  class Where
    def initialize(opts={})
      @sender, @channel, @message = opts.values_at(:sender, :channel, :message)
    end

    def to_proc
      method(:work)
    end

    def call(opts={})
      method(:work).call(opts)
    end

    def work(opts={})
      latitude = opts.fetch(:latitude, rand(-90.0000000...90.0000000)).round(7)
      longitude = opts.fetch(:longitude, rand(-180.000000000...180.000000000)).round(7)
      zoom = opts.fetch(:zoom, rand(7...10))

      url = "https://www.google.com/maps/@#{latitude},#{longitude},#{zoom}z"

      [sender, "Meet here. #{url}"].join(": ")
    end

    private
    attr_reader :sender, :channel, :message
  end
end
