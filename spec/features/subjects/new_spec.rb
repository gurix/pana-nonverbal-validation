feature 'Subject' do
  scenario 'Raises an error when no group is set' do
    expect{ visit new_subject_path }.to raise_error 'missing group'
  end

  scenario 'Raises an error when an unknown group is set' do
    expect{ visit new_subject_path(group: 'haschisch') }.to raise_error 'haschisch is not available'
  end

  scenario 'Create a new subject' do
    visit new_subject_path(group: 'gj')

    expect(page).to have_content 'Demographische Angaben'

    fill_in 'Alter', with: 42
    choose 'Weiblich'
    choose 'Kein Abschluss'
    choose 'Schweiz'

    expect { click_button 'Weiter' }.to change {Subject.count}.by(1)

    expect(page).to have_content 'Hinweis: Proband wurde erfolgreich erstellt.'
  end
end
