# coding: utf-8
require 'spec_helper'

describe "Sprint pages" do
	subject { page }
	let(:success_text) { 'Новый спринт успешно сохранен!' }
	let(:error_text) { 'Форма содержит ошибки' }

	describe "show page" do
		let (:sprint) { FactoryGirl.create(:sprint) }
		before { visit sprint_path(sprint) }
		
		it { should have_selector('h1', text: sprint.name) }
		it { should have_link('Создать спринт', href: new_sprint_path) }		
		it { should have_link('Спринты', href: root_path) }
		it { should have_link('Редактировать', href: edit_sprint_path(sprint)) }			
	end

	describe "add new sprint" do
		before { visit new_sprint_path }
		let (:submit) { "Добавить спринт" }
		let (:add_new_sprint) { "Создание нового спринта"}

		it { should have_selector('h1', text: add_new_sprint) }
		it { should have_link('Создать спринт', href: new_sprint_path) }		
		it { should have_link('Спринты', href: root_path) }
		it { should have_button(submit) }
		
		describe "with invalid info" do
			it "should not add sprint" do
				expect { click_button submit }.not_to change(Sprint, :count)
			end

			before { click_button submit }
			it { should have_selector('h1', text: add_new_sprint) }
			it { should have_selector('div.alert.alert-error', text: error_text) }
		end
		

		describe "with valid info" do
			before do
				fill_in "Наименование", with: "Разработка проекта"
				fill_in "Сложность", with: "100"
				fill_in "Непонятные задания", with: 10
				fill_in "Итоговая реализация", with: 0
				fill_in "Количество чел/ч", with: 0
				select  "Планируемый", from: "Статус"
				fill_in "Дата начала", with: "01.01.2013"
				fill_in "Дата окончания", with: "31.01.2013"
			end
			it "should add sprint" do
				expect { click_button submit }.to change(Sprint, :count).by(1)
			end
			describe "click button submit" do
				before { click_button submit }
				let(:sprint) { Sprint.find_by_name('Разработка проекта') }
				it { should have_selector('h1', text: sprint.name) }
				it { should have_selector('div.alert.alert-success', text: success_text) }			
			end
		end		
	end

	describe "edit page" do
		let (:sprint) { FactoryGirl.create(:sprint) }
		let (:apply) { "Применить" }
		let (:edit_sprint) { "Редактирование спринта" }
		before { visit edit_sprint_path(sprint) }

		it { should have_selector('h1', text: edit_sprint) }
		it { should have_link('Создать спринт', href: new_sprint_path) }		
		it { should have_link('Спринты', href: root_path) }
		it { should have_button(apply) }	

		describe "with invalid info" do
			before do
				fill_in "Наименование", with: ""
				click_button apply
			end
			it { should have_selector('h1', text: edit_sprint) }
			it { should have_selector('div.alert.alert-error', text: error_text) }						
		end
		describe "with valid info" do
			before { click_button apply }
			it { should have_selector('h1', text: 'Список спринтов') }
			it { should have_selector('div.alert.alert-success', text: 'Изменения сохранены') }
		end
	end

	describe "index page" do
		before { visit root_path }			
		it { should have_selector('h1', text: "Список спринтов") }
		it { should have_selector('h1', text: "Статистика") }
		it { should have_link('Создать спринт', href: new_sprint_path) }		
		it { should have_link('Спринты', href: root_path) }

		describe "velocity and probable points" do
			let(:hours) { 100.0 }
			let(:fact) { 50.0 }			
			let(:sprint) { FactoryGirl.create(:sprint) }
			before do 
				visit edit_sprint_path(sprint)
				fill_in "Итоговая реализация", with: fact 
				fill_in "Количество чел/ч", with: hours
				select  "Успешно", from: "Статус"
				click_button "Применить"				
			end
			it { should have_selector('p', text: "Средняя скорость: " + (fact/hours).round(2).to_s) }
			it { should have_selector('p', text: "Предполагаемое кол-во поинтов: " + fact.round(2).to_s ) }
		end
	end
end
