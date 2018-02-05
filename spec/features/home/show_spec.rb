
feature 'Home page' do
  scenario 'Visit the home page' do
    visit root_path
    expect(page).to have_content 'Entwicklung einer Emoji-Skala zur Erfassung positiver und negativer Aktivierung'
  end
end
