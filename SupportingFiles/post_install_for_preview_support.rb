post_install do |installer|
    project_file_name = Dir.glob("*.xcodeproj").first
    project = Xcodeproj::Project.open(project_file_name)
    project_targets = project.native_targets
    pod_target_name_prefix = "Pods-"
    project_targets.each do |project_target| 
        aggregate_project_pod_target = installer.aggregate_targets.find do |pod_target|
            pod_target.name == pod_target_name_prefix + project_target.name 
        end
        project_target.build_configurations.each do |project_target_build_configuration|
            aggregate_project_pod_target.xcconfigs.find do |xcconfig_name, xcconfig_file|
                if xcconfig_name == project_target_build_configuration.name
                    framework_search_paths = xcconfig_file.attributes['FRAMEWORK_SEARCH_PATHS']
                    default_search_paths = '@executable_path/Frameworks @loader_path/Frameworks '
                    project_target_build_configuration.build_settings['LD_RUNPATH_SEARCH_PATHS[sdk=iphonesimulator*]'] = default_search_paths + framework_search_paths
                    project_target_build_configuration.build_settings['SWIFT_OPTIMIZATION_LEVEL[sdk=iphonesimulator*]'] = "-Onone";
                end
            end
        end
    end
    project.save
  end
  
