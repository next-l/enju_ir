require "rails_helper"

module EnjuIr
  RSpec.describe DatasetsController, type: :routing do
    describe "routing" do
      it "routes to #index" do
        expect(get: "/enju_ir/datasets").to route_to("enju_ir/datasets#index")
      end

      it "routes to #new" do
        expect(get: "/enju_ir/datasets/new").to route_to("enju_ir/datasets#new")
      end

      it "routes to #show" do
        expect(get: "/enju_ir/datasets/1").to route_to("enju_ir/datasets#show", id: "1")
      end

      it "routes to #edit" do
        expect(get: "/enju_ir/datasets/1/edit").to route_to("enju_ir/datasets#edit", id: "1")
      end


      it "routes to #create" do
        expect(post: "/enju_ir/datasets").to route_to("enju_ir/datasets#create")
      end

      it "routes to #update via PUT" do
        expect(put: "/enju_ir/datasets/1").to route_to("enju_ir/datasets#update", id: "1")
      end

      it "routes to #update via PATCH" do
        expect(patch: "/enju_ir/datasets/1").to route_to("enju_ir/datasets#update", id: "1")
      end

      it "routes to #destroy" do
        expect(delete: "/enju_ir/datasets/1").to route_to("enju_ir/datasets#destroy", id: "1")
      end
    end
  end
end
