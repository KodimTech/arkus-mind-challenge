# frozen_string_literal: true

module AccountDecorator
  def self.index_dropdown_options
    [
      { title: 'Create account', url: '/admin/accounts/new' }
    ]
  end

  def self.index_table_headers
    [
      { title: 'ID', padding: 'ps-1' },
      { title: 'Account Name', padding: 'ps-1' },
      { title: 'Customer Name', padding: 'ps-1' },
      { title: 'Responsible Name', padding: 'ps-1' },
      { title: 'Options', padding: 'ps-1' }
    ]
  end

  def self.table_dropdown_options(object)
    [
      { title: 'Edit', url: "/admin/accounts/#{object.id}/edit" }
    ]
  end
end
