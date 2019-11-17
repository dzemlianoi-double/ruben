if Rails.env.test?
  namespace :simplecov do
    desc 'merge_results'
    task report_coverage: :environment do
      require Rails.root.join('spec', 'support', 'helpers', 'simple_cov_helper')
      SimpleCovHelper.report_coverage
    end
  end
end
