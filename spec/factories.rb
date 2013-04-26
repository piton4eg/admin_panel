# coding: utf-8

FactoryGirl.define do
	factory :sprint do
		name			"Разработка проекта"
		points 			100
		unknown_level 	10
		fact_points 	0
		hours_count 	0
		status 			"Планируемый"
		date_begin 		"01.01.2013"
		date_end 		"31.01.2013"
	end	

	factory :sprint_stats do		
	end
end