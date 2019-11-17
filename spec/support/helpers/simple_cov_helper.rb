class SimpleCovHelper
  # rubocop:disable Metrics/AbcSize
  def self.report_coverage(base_dir: './coverage_results')
    SimpleCov.start 'rails' do
      add_filter '/spec/'
      add_filter '/config/'
      add_filter '/vendor/'

      Dir['app/*'].each do |dir|
        add_group File.basename(dir).humanize, dir
      end

      minimum_coverage(ENV['MIN_COVERAGE']) if ENV['COVERAGE_CHECK'] && ENV['MIN_COVERAGE']
      merge_timeout(3600)
    end
    new(base_dir: base_dir).merge_results
  end

  attr_reader :base_dir

  def initialize(base_dir:)
    @base_dir = base_dir
  end

  def all_results
    Dir["#{base_dir}/.resultset*.json"]
  end

  def merge_results
    results = all_results.map { |file| SimpleCov::Result.from_hash(JSON.parse(File.read(file))) }
    SimpleCov::ResultMerger.merge_results(*results).tap do |result|
      SimpleCov::ResultMerger.store_result(result)
    end
  end
  # rubocop:enable Metrics/AbcSize
end
