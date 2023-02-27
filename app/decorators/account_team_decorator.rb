# frozen_string_literal: true

module AccountTeamDecorator
  def self.index_table_headers
    [
      { title: 'Account Name', padding: 'ps-1' },
      { title: 'Users Count', padding: 'ps-1' },
      { title: 'Options', padding: 'ps-1' }
    ]
  end

  def self.table_dropdown_options(account_id, object_id)
    [
      { title: 'Details', url: "/admin/accounts/#{account_id}/teams/#{object_id}" },
      { title: 'Edit', url: "/admin/accounts/#{account_id}/teams/#{object_id}/edit", controller: 'shared--turbo-request' },
    ]
  end
end
