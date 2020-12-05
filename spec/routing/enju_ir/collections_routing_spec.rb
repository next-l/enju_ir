require "rails_helper"

module EnjuIr
  RSpec.describe CollectionsController, type: :routing do
    describe "routing" do
      it "routes to #index" do
        expect(get: "/enju_ir/collections").to route_to("enju_ir/collections#index")
      end

      it "routes to #new" do
        expect(get: "/enju_ir/collections/new").to route_to("enju_ir/collections#new")
      end

      it "routes to #show" do
        expect(get: "/enju_ir/collections/1").to route_to("enju_ir/collections#show", id: "1")
      end

      it "routes to #edit" do
        expect(get: "/enju_ir/collections/1/edit").to route_to("enju_ir/collections#edit", id: "1")
      end


      it "routes to #create" do
        expect(post: "/enju_ir/collections").to route_to("enju_ir/collections#create")
      end

      it "routes to #update via PUT" do
        expect(put: "/enju_ir/collections/1").to route_to("enju_ir/collections#update", id: "1")
      end

      it "routes to #update via PATCH" do
        expect(patch: "/enju_ir/collections/1").to route_to("enju_ir/collections#update", id: "1")
      end

      it "routes to #destroy" do
        expect(delete: "/enju_ir/collections/1").to route_to("enju_ir/collections#destroy", id: "1")
      end
    end
  end
end
