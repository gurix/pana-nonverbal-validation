feature 'Subject' do
  scenario 'Create a new subject' do
    visit new_subject_path
    expect(page).to have_content 'Demographische Angaben'

    fill_in 'Alter', with: 42
    choose 'Weiblich'
    choose 'Kein Abschluss'
    choose 'Schweiz'

    expect { click_button 'Weiter' }.to change {Subject.count}.by(1)

    expect(page).to have_content 'Hinweis: Proband wurde erfolgreich erstellt.'
  end
end
