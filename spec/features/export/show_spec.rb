feature 'Export page' do
  scenario 'Visit the export page requires to be authenticated' do
    visit export_path
    expect(page.status_code).to eq 401
  end
  scenario 'Visiting the export page returns a csv file' do
    20.times do
      create(:subject, pana_validation_questionary: build(:pana_validation_questionary),
                       visit: build(:visit))
    end

    basic_auth('', 'test')

    visit export_path

    expect(page).to have_content 'id,age,gender,education,residence,created_at'

    expect(page).to have_content 'adsf'
  end
end
