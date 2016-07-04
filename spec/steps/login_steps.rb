# coding: utf-8
require 'spec_helper'

module LoginSteps
  step 'ログイン画面にアクセスする' do
    Capybara.app_host = 'http://localhost:3000'
  end

  step 'ログイン画面を表示する' do
    visit '/'
    page.save_screenshot 'spec/tmp/screenshots/login/page.png'
  end

  step 'ログイン画面が表示されること' do
    expect(page).to have_content('ログイン')
  end

  step 'emailとpasswordを入力する' do
    fill_in 'user[email]', with: 'site_owner@example.com'
    fill_in 'user[password]', with: 'password'
  end

  step 'ログインボタンをクリックする' do
    click_on 'ログイン'
  end

  step '画面に`ダッシュボード`が表示されること' do
    expect(page).to have_content('ダッシュボード')
    page.save_screenshot 'spec/tmp/screenshots/login/dashboard.png'
  end
end

RSpec.configure { |c| c.include LoginSteps }
