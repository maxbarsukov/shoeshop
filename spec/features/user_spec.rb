# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'create new user' do
    let!(:exist_user) { create(:user, email: 'exists@example.com')}

    scenario 'valid inputs' do
      visit new_user_registration_path

      fill_in 'Email',                  with: 'user@example.com'
      fill_in 'Password',               with: '111111'
      fill_in 'Password confirmation',  with: '111111'

      click_button 'Sign Up'

      expect(page).not_to have_content('Please review the problems below:')
      expect(page).to     have_content('Welcome! You have signed up successfully.')
    end

    scenario 'wrong password confirmation' do
      visit new_user_registration_path

      fill_in 'Email',                  with: 'user@example.com'
      fill_in 'Password',               with: '111111'
      fill_in 'Password confirmation',  with: '111112'

      click_button 'Sign Up'

      expect(page).to     have_content('Please review the problems below:')
      expect(page).not_to have_content('has already been taken')
      expect(page).not_to have_content('6 characters minimumis too short')
      expect(page).to     have_content('doesn\'t match Password')
    end

    scenario 'email has already been taken' do
      visit new_user_registration_path

      fill_in 'Email',                  with: exist_user.email
      fill_in 'Password',               with: exist_user.password
      fill_in 'Password confirmation',  with: exist_user.password

      click_button 'Sign Up'

      expect(page).to     have_content('Please review the problems below:')
      expect(page).to     have_content('has already been taken')
      expect(page).not_to have_content('6 characters minimumis too short')
      expect(page).not_to have_content('doesn\'t match Password')
    end

    scenario 'short password' do
      visit new_user_registration_path

      fill_in 'Email',                  with: 'user@example.com'
      fill_in 'Password',               with: '1'
      fill_in 'Password confirmation',  with: '1'

      click_button 'Sign Up'

      expect(page).to     have_content('Please review the problems below:')
      expect(page).not_to have_content('has already been taken')
      expect(page).to     have_content('6 characters minimumis too short')
      expect(page).not_to have_content('doesn\'t match Password')
    end
  end

  describe 'login as existing user' do
    let!(:exist_user) { create(:user, email: 'exists@example.com')}

    scenario 'valid inputs' do
      visit new_user_session_path

      fill_in 'Email',                  with: exist_user.email
      fill_in 'Password',               with: exist_user.password

      click_button 'Log In'

      expect(page).not_to have_content('Invalid Email or password.')
      expect(page).to     have_content('Signed in successfully.')
    end

    scenario 'invalid email' do
      visit new_user_session_path

      fill_in 'Email',                  with: exist_user.email + 'abracadabra'
      fill_in 'Password',               with: exist_user.password

      click_button 'Log In'

      expect(page).to     have_content('Invalid Email or password.')
      expect(page).not_to have_content('Signed in successfully.')
    end

    scenario 'invalid password' do
      visit new_user_session_path

      fill_in 'Email',                  with: exist_user.email
      fill_in 'Password',               with: exist_user.password + 'abracadabra'

      click_button 'Log In'

      expect(page).to     have_content('Invalid Email or password.')
      expect(page).not_to have_content('Signed in successfully.')
    end
  end

  describe 'log in as admin' do
    let!(:admin) { create(:user, admin: true) }

    scenario 'user have links to API' do
      visit new_user_session_path

      fill_in 'Email',                  with: admin.email
      fill_in 'Password',               with: admin.password

      click_button 'Log In'

      expect(page).to have_content('Administrator')
      expect(page).to have_content('API')
    end
  end

  describe 'log out' do
    let!(:user) { create(:user)}

    scenario 'successfully log out' do
      visit new_user_session_path

      fill_in 'Email',                  with: user.email
      fill_in 'Password',               with: user.password

      click_button 'Log In'

      visit root_path

      click_on 'Sign Out'
      expect(page).to have_content('Signed out successfully.')
    end
  end

  describe 'edit user' do
    context 'user does not exists' do
      let!(:user) { nil }

      scenario 'can not edit user' do
        visit edit_user_registration_path
        expect(page).to have_content('You need to sign in or sign up before continuing.')
      end
    end

    context 'user exists' do
      let!(:user) { create(:user) }

      scenario 'change email with valid inputs' do
        visit new_user_session_path
        fill_in 'Email',                  with: user.email
        fill_in 'Password',               with: user.password
        click_button 'Log In'

        visit edit_user_registration_path

        fill_in 'Email',            with: '111' + user.email
        fill_in 'Current password', with: user.password
        click_button 'Update'
        expect(page).to have_content('Your account has been updated successfully.')
      end
    end
  end
end
