require "rails_helper"

module EnjuIr
  RSpec.describe FilesetsController, type: :routing do
    describe "routing" do
      it "routes to #index" do
        expect(get: "/enju_ir/filesets").to route_to("enju_ir/filesets#index")
      end

      it "routes to #new" do
        expect(get: "/enju_ir/filesets/new").to route_to("enju_ir/filesets#new")
      end

      it "routes to #show" do
        expect(get: "/enju_ir/filesets/1").to route_to("enju_ir/filesets#show", id: "1")
      end

      it "routes to #edit" do
        expect(get: "/enju_ir/filesets/1/edit").to route_to("enju_ir/filesets#edit", id: "1")
      end


      it "routes to #create" do
        expect(post: "/enju_ir/filesets").to route_to("enju_ir/filesets#create")
      end

      it "routes to #update via PUT" do
        expect(put: "/enju_ir/filesets/1").to route_to("enju_ir/filesets#update", id: "1")
      end

      it "routes to #update via PATCH" do
        expect(patch: "/enju_ir/filesets/1").to route_to("enju_ir/filesets#update", id: "1")
      end

      it "routes to #destroy" do
        expect(delete: "/enju_ir/filesets/1").to route_to("enju_ir/filesets#destroy", id: "1")
      end
    end
  end
end
