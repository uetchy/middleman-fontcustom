require 'fontcustom'

module Middleman
  class FontcustomExtension < Extension
    option :font_name, 'fontcustom', 'Output font name'
    option :source_dir, 'icons', 'Folder contains icon files'
    option :fonts_dir, 'fonts', 'Folder to output fonts'
    option :css_dir, 'stylesheets', 'Folder to output css'
    option :templates, 'scss', 'Output templates'

    def initialize(app, options_hash={}, &block)
      super

      @options = options.to_h

      @compile = ->(config){
        ::Fontcustom::Base.new({
          :font_name => config[:font_name],
          :input => config[:source_dir],
          :output => {
            :fonts => File.join("build", config[:fonts_dir]),
            :css => File.join("build", config[:css_dir])
          },
          :templates => config[:templates].split(/\s/),
          :no_hash => true,
          :preprocessor_path => nil
        }).compile
      }

      if app.environment == :development then
        app.ready do
          files.changed do |file|
            next if files.send(:ignored?, file)
            next if @options[:source_dir] != File.dirname(file)

            begin
              @compile.call(@options)
            rescue => e
              logger.info e.message
            end
          end

          files.deleted do |file|
            next if files.send(:ignored?, file)
            next if @options[:source_dir] != File.dirname(file)

            begin
              @compile.call(@options)
            rescue => e
              logger.info e.message
            end
          end
        end
      end

    end

    def before_build()
      @compile.call(@options)
    end

    def manipulate_resource_list(resources)
      @compile.call(@options)
      fonts = [
        File.join(@options[:css_dir], "_" + @options[:font_name] + ".scss"),
        File.join(@options[:fonts_dir], @options[:font_name] + ".woff"),
        File.join(@options[:fonts_dir], @options[:font_name] + ".ttf"),
        File.join(@options[:fonts_dir], @options[:font_name] + ".svg"),
        File.join(@options[:fonts_dir], @options[:font_name] + ".eot")
      ].map do |file|
        res = Middleman::Sitemap::Resource.new(
          @app.sitemap,
          file,
          @options[:source_dir]
        )
        def res.template?
          false
        end
        def res.binary?
          false
        end
        res
      end
      fonts + resources
    end

  end
end
