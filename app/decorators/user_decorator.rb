# frozen_string_literal: true

module UserDecorator

  def self.index_dropdown_options
    [
      { title: 'Create user', url: '/admin/users/new' }
    ]
  end

  def self.index_table_headers
    [
      { title: 'ID', padding: 'ps-1' },
      { title: 'First Name', padding: 'ps-1' },
      { title: 'Last Name', padding: 'ps-1' },
      { title: 'Email', padding: 'ps-1' },
      { title: 'Role', padding: 'ps-1' },
      { title: 'Options', padding: 'ps-1' }
    ]
  end

  def self.table_dropdown_options(object)
    [
      { title: 'Edit user', url: "/admin/users/#{object.id}/edit" }
    ]
  end

  def self.sidebar_options
    role = Current.user.role
    send("#{role}_options".to_sym)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def self.admin_options
    [
      { title: 'Dashboard', url: '/dashboard', icon: 'bi bi-house' },
      { title: 'Accounts', url: '/admin/accounts', icon: 'bi bi-shop-window' },
      { title: 'Users', url: '/admin/users', icon: 'bi bi-people' }
    ]
  end

  def self.super_admin_options
    [
      { title: 'Dashboard', url: '/dashboard', icon: 'bi bi-house' },
      { title: 'Accounts', url: '/admin/accounts', icon: 'bi bi-shop-window' },
      { title: 'Users', url: '/admin/users', icon: 'bi bi-people' }
    ]
  end
end
