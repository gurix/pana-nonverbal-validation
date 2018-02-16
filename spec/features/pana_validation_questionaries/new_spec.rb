feature 'PanaValidationQuestionary' do

  scenario 'Create a new pana_validation_questionary' do
    PanaValidationQuestionary::MAPPING.keys.each do | group |

      subject = create :subject, group: group

      visit new_subject_pana_validation_questionary_path(subject)

      # Page 1
      expect(page).to have_selector 'h1', text: 'Wie fühlten Sie sich in den letzten Tagen?'

      PanaValidationQuestionary::MAPPING[group].each do |pair|
        fill_in "pana_validation_questionary_#{PanaValidationQuestionary.eomji_column_name(pair)}", with: 42
      end

      click_button 'Weiter'

      PanaValidationQuestionary::MAPPING[group].each do |pair|
        expect(subject.reload.pana_validation_questionary[PanaValidationQuestionary.eomji_column_name(pair)]).to eq 42
      end
      expect(subject.reload.pana_validation_questionary.page).to eq 1

      # Page 2
      expect(page).to have_selector 'h1', text: 'Die folgenden Aussagen betreffen Ihr Wohlbefinden in den letzten Tagen.'

      5.times do |i|
        choose "pana_validation_questionary_who#{i+1}_2"
      end

      click_button 'Weiter'

      5.times do |i|
        expect(subject.reload.pana_validation_questionary["who#{i+1}"]).to eq 2
      end

      expect(subject.reload.pana_validation_questionary.page).to eq 2

      # Page 3
      expect(page).to have_selector 'h1', text: 'Persönlichkeit'

      20.times do |i|
        choose "pana_validation_questionary_mrs#{i+1}_1"
      end

      click_button 'Weiter'

      20.times do |i|
        expect(subject.reload.pana_validation_questionary["mrs#{i+1}"]).to eq 1
      end

      # Page 4
      expect(page).to have_selector 'h1', text: 'Wie fühlten Sie sich in den letzten Tagen?'

      10.times do |i|
        choose "pana_validation_questionary_pnv#{i+1}_7"
      end

      click_button 'Weiter'

      10.times do |i|
        expect(subject.reload.pana_validation_questionary["pnv#{i+1}"]).to eq 7
      end

      # Page 5
      expect(page).to have_selector 'h1', text: 'Es folgen fünf Aussagen, denen Sie zustimmen bzw. die Sie ablehnen können.'

      5.times do |i|
        choose "pana_validation_questionary_swl#{i+1}_3"
      end

      click_button 'Weiter'

      5.times do |i|
        expect(subject.reload.pana_validation_questionary["swl#{i+1}"]).to eq 3
      end

      # Page 6
      expect(page).to have_selector 'h1', text: 'Wie fühlten Sie sich in den letzten Tagen?'

      3.times do |i|
        choose("sam#{i+1}_#{i+1}")
      end

      click_button 'Weiter'

      3.times do |i|
        expect(subject.reload.pana_validation_questionary["sam#{i+1}"]).to eq i+1
      end
    end
  end
end
