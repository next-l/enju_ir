require "rails_helper"

module EnjuIr
  RSpec.describe ImportRequestsController, type: :routing do
    describe "routing" do
      it "routes to #index" do
        expect(get: "/enju_ir/import_requests").to route_to("enju_ir/import_requests#index")
      end

      it "routes to #new" do
        expect(get: "/enju_ir/import_requests/new").to route_to("enju_ir/import_requests#new")
      end

      it "routes to #show" do
        expect(get: "/enju_ir/import_requests/1").to route_to("enju_ir/import_requests#show", id: "1")
      end

      it "routes to #edit" do
        expect(get: "/enju_ir/import_requests/1/edit").to route_to("enju_ir/import_requests#edit", id: "1")
      end


      it "routes to #create" do
        expect(post: "/enju_ir/import_requests").to route_to("enju_ir/import_requests#create")
      end

      it "routes to #update via PUT" do
        expect(put: "/enju_ir/import_requests/1").to route_to("enju_ir/import_requests#update", id: "1")
      end

      it "routes to #update via PATCH" do
        expect(patch: "/enju_ir/import_requests/1").to route_to("enju_ir/import_requests#update", id: "1")
      end

      it "routes to #destroy" do
        expect(delete: "/enju_ir/import_requests/1").to route_to("enju_ir/import_requests#destroy", id: "1")
      end
    end
  end
end
