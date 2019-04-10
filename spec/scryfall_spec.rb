require "scryfall/cards"

describe Scryfall::Cards do

	describe "Cards By Name" do
		before do
			@card_id = "83a0f2eb-2f6d-4aaa-b7a9-ea06d5de7eca"
		end

		it "should get a card by exact name" do
			resp = Scryfall::Cards.named_exact "Sol Ring"

			expect(resp["id"]).to eql(@card_id)
		end

		it "should get a card by fuzzy name" do
			resp = Scryfall::Cards.named_fuzzy "solring"

			expect(resp["id"]).to eql(@card_id)
		end

		it "should get a list of cards by using search" do
			resp = Scryfall::Cards.search "t:artifact solring"

			expect(resp["object"]).to eql("list")
			expect(resp["total_cards"]).to eql(1)
			expect(resp["data"][0]["id"]).to eql(@card_id)
		end
	end

	describe "Cards By IDs" do
		before do
			@card_id = "bef16a71-5ed2-4f30-a844-c02a0754f679" #Austere Command Id
			@mtgo_id = 65899 # Austere Command mtgo_id
		end

		it "should get a card by its MTGO id" do
			resp = Scryfall::Cards.mtgo_id @mtgo_id

			expect(resp["id"]).to eql(@card_id)
			expect(resp["object"]).to eql("card")
			expect(resp["mtgo_id"]).to eql(@mtgo_id)
		end

	end
end
