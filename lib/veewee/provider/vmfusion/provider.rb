require 'veewee/provider/core/provider'

module Veewee
  module Provider
    module Vmfusion
      class Provider < Veewee::Provider::Core::Provider

        #include ::Veewee::Provider::Vmfusion::ProviderCommand

        def check_requirements
          fusion_version = :unknown

          if File.exists?("/Library/Application Support/VMware Fusion/vmrun")
            fusion_version = "3.x"
          end

          if File.exists?("/Applications/VMware Fusion.app/Contents/Library/vmrun")
            fusion_version = "4.x"
          end

          if fusion_version == :unknown
            raise Veewee::Error,"Could not find vmrun at standard locations. Probably you don't have Vmware fusion installed"
          end
        end


      end #End Class
    end # End Module
  end # End Module
end # End Module
