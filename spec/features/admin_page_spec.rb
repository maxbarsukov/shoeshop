# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin Page', type: :feature do
  describe 'go to the admin page' do
    context 'as a visitor' do
      let!(:user) { nil }

      scenario 'visitor can not visit admin page' do
        visit '/admin'

        expect(page).not_to have_content('You must be an administrator to access this page')
        expect(page).not_to have_content('Site Administration')
        expect(page).to     have_content('You need to sign in or sign up before continuing.')
      end
    end

    context 'as a regular user' do
      let!(:user) { create :user }

      scenario 'user can not visit admin page' do
        visit new_user_session_path
        fill_in 'Email',                  with: user.email
        fill_in 'Password',               with: user.password
        click_button 'Log In'

        visit '/admin'

        expect(page).to     have_content('You must be an administrator to access this page')
        expect(page).not_to have_content('Site Administration')
        expect(page).not_to have_content('You need to sign in or sign up before continuing.')
      end
    end

    context 'as an admin' do
      let!(:admin) { create :user, admin: true }

      scenario 'user can not visit admin page' do
        visit new_user_session_path
        fill_in 'Email',                  with: admin.email
        fill_in 'Password',               with: admin.password
        click_button 'Log In'

        visit '/admin'

        expect(page).not_to have_content('You must be an administrator to access this page')
        expect(page).to     have_content('Site Administration')
        expect(page).not_to have_content('You need to sign in or sign up before continuing.')
      end
    end
  end

  describe 'view all products as admin' do
    let!(:admin)    { create :user, admin: true }
    let!(:products) { create_list :product, 2 }

    scenario 'user can not visit admin page' do
      visit new_user_session_path
      fill_in 'Email',                  with: admin.email
      fill_in 'Password',               with: admin.password
      click_button 'Log In'

      visit '/admin'
      click_link 'Products', match: :first

      expect(page).to have_content(products.first.title)
      expect(page).to have_content(products.second.title)
    end
  end

  describe 'view all users as admin' do
    let!(:admin) { create :user, admin: true }
    let!(:users) { create_list :user, 2 }

    scenario 'user can not visit admin page' do
      visit new_user_session_path
      fill_in 'Email',                  with: admin.email
      fill_in 'Password',               with: admin.password
      click_button 'Log In'

      visit '/admin'
      click_link 'Users', match: :first

      expect(page).to have_content(users.first.email)
      expect(page).to have_content(users.second.email)
    end
  end

  describe 'view all brands as admin' do
    let!(:admin)  { create :user, admin: true }
    let!(:brands) { create_list :brand, 2 }

    scenario 'user can not visit admin page' do
      visit new_user_session_path
      fill_in 'Email',                  with: admin.email
      fill_in 'Password',               with: admin.password
      click_button 'Log In'

      visit '/admin'
      click_link 'Brands', match: :first

      expect(page).to have_content(brands.first.title)
      expect(page).to have_content(brands.second.title)
    end
  end
end
