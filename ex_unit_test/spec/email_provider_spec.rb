require_relative ('../email_provider.rb')

RSpec.describe "Email provider" do

	let(:email_provider) do
		instance_double("Email Provider", :get_subjects => ["hi jim", "hi jack", "hi john"])
	end

	#let(:my_emails){EmailProvider.new(subjects)}


	it "checks that get_subjects method returns all subjects" do
		expect(email_provider.get_subjects).to eq(["hi jim", "hi jack", "hi john"])
	end

	it "check that the following words are in at least one subject: hi jim, hi jack, hi john." do
		expect(SubjectFilter.new(email_provider).filter_subjects("jim", "jack", "john")).to eq(true)
	end

end