module AccountTeamUserDecorator
  def self.index_table_headers
    [
      { title: 'User', padding: 'ps-1' },
      { title: 'Start Date', padding: 'ps-1' },
      { title: 'End Date', padding: 'ps-1' },
      { title: 'Options', padding: 'ps-1' }
    ]
  end

  def self.user_log_table_headers
    [
      { title: 'User', padding: 'ps-1' },
      { title: 'Start Date', padding: 'ps-1' },
      { title: 'End Date', padding: 'ps-1' },
      { title: 'Added Date', padding: 'ps-1' },
      { title: 'Status', padding: 'ps-1' },
    ]
  end
end