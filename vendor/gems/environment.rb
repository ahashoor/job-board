# DO NOT MODIFY THIS FILE
module Bundler
 file = File.expand_path(__FILE__)
 dir = File.dirname(file)

  ENV["PATH"]     = "#{dir}/../../bin:#{ENV["PATH"]}"
  ENV["RUBYOPT"]  = "-r#{file} #{ENV["RUBYOPT"]}"

  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/nokogiri-1.4.1/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/nokogiri-1.4.1/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/nokogiri-1.4.1/ext")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/activesupport-2.3.5/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/activesupport-2.3.5/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/durran-validatable-2.0.1/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/durran-validatable-2.0.1/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/rack-1.1.0/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/rack-1.1.0/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/sinatra-0.9.4/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/sinatra-0.9.4/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/effigy-0.3.2/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/effigy-0.3.2/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/sinatra-effigy-0.0.6/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/sinatra-effigy-0.0.6/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/mongo_ext-0.18.2/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/mongo_ext-0.18.2/ext")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/sinatra-mongoid-0.0.1/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/sinatra-mongoid-0.0.1/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/mongo-0.18.2/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/mongo-0.18.2/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/leshill-will_paginate-2.3.11/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/leshill-will_paginate-2.3.11/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/mongoid-1.0.6/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/mongoid-1.0.6/lib")

  @gemfile = "#{dir}/../../Gemfile"

  require "rubygems"

  @bundled_specs = {}
  @bundled_specs["nokogiri"] = eval(File.read("#{dir}/specifications/nokogiri-1.4.1.gemspec"))
  @bundled_specs["nokogiri"].loaded_from = "#{dir}/specifications/nokogiri-1.4.1.gemspec"
  @bundled_specs["activesupport"] = eval(File.read("#{dir}/specifications/activesupport-2.3.5.gemspec"))
  @bundled_specs["activesupport"].loaded_from = "#{dir}/specifications/activesupport-2.3.5.gemspec"
  @bundled_specs["durran-validatable"] = eval(File.read("#{dir}/specifications/durran-validatable-2.0.1.gemspec"))
  @bundled_specs["durran-validatable"].loaded_from = "#{dir}/specifications/durran-validatable-2.0.1.gemspec"
  @bundled_specs["rack"] = eval(File.read("#{dir}/specifications/rack-1.1.0.gemspec"))
  @bundled_specs["rack"].loaded_from = "#{dir}/specifications/rack-1.1.0.gemspec"
  @bundled_specs["sinatra"] = eval(File.read("#{dir}/specifications/sinatra-0.9.4.gemspec"))
  @bundled_specs["sinatra"].loaded_from = "#{dir}/specifications/sinatra-0.9.4.gemspec"
  @bundled_specs["effigy"] = eval(File.read("#{dir}/specifications/effigy-0.3.2.gemspec"))
  @bundled_specs["effigy"].loaded_from = "#{dir}/specifications/effigy-0.3.2.gemspec"
  @bundled_specs["sinatra-effigy"] = eval(File.read("#{dir}/specifications/sinatra-effigy-0.0.6.gemspec"))
  @bundled_specs["sinatra-effigy"].loaded_from = "#{dir}/specifications/sinatra-effigy-0.0.6.gemspec"
  @bundled_specs["mongo_ext"] = eval(File.read("#{dir}/specifications/mongo_ext-0.18.2.gemspec"))
  @bundled_specs["mongo_ext"].loaded_from = "#{dir}/specifications/mongo_ext-0.18.2.gemspec"
  @bundled_specs["sinatra-mongoid"] = eval(File.read("#{dir}/specifications/sinatra-mongoid-0.0.1.gemspec"))
  @bundled_specs["sinatra-mongoid"].loaded_from = "#{dir}/specifications/sinatra-mongoid-0.0.1.gemspec"
  @bundled_specs["mongo"] = eval(File.read("#{dir}/specifications/mongo-0.18.2.gemspec"))
  @bundled_specs["mongo"].loaded_from = "#{dir}/specifications/mongo-0.18.2.gemspec"
  @bundled_specs["leshill-will_paginate"] = eval(File.read("#{dir}/specifications/leshill-will_paginate-2.3.11.gemspec"))
  @bundled_specs["leshill-will_paginate"].loaded_from = "#{dir}/specifications/leshill-will_paginate-2.3.11.gemspec"
  @bundled_specs["mongoid"] = eval(File.read("#{dir}/specifications/mongoid-1.0.6.gemspec"))
  @bundled_specs["mongoid"].loaded_from = "#{dir}/specifications/mongoid-1.0.6.gemspec"

  def self.add_specs_to_loaded_specs
    Gem.loaded_specs.merge! @bundled_specs
  end

  def self.add_specs_to_index
    @bundled_specs.each do |name, spec|
      Gem.source_index.add_spec spec
    end
  end

  add_specs_to_loaded_specs
  add_specs_to_index

  def self.require_env(env = nil)
    context = Class.new do
      def initialize(env) @env = env && env.to_s ; end
      def method_missing(*) ; yield if block_given? ; end
      def only(*env)
        old, @only = @only, _combine_only(env.flatten)
        yield
        @only = old
      end
      def except(*env)
        old, @except = @except, _combine_except(env.flatten)
        yield
        @except = old
      end
      def gem(name, *args)
        opt = args.last.is_a?(Hash) ? args.pop : {}
        only = _combine_only(opt[:only] || opt["only"])
        except = _combine_except(opt[:except] || opt["except"])
        files = opt[:require_as] || opt["require_as"] || name
        files = [files] unless files.respond_to?(:each)

        return unless !only || only.any? {|e| e == @env }
        return if except && except.any? {|e| e == @env }

        if files = opt[:require_as] || opt["require_as"]
          files = Array(files)
          files.each { |f| require f }
        else
          begin
            require name
          rescue LoadError
            # Do nothing
          end
        end
        yield if block_given?
        true
      end
      private
      def _combine_only(only)
        return @only unless only
        only = [only].flatten.compact.uniq.map { |o| o.to_s }
        only &= @only if @only
        only
      end
      def _combine_except(except)
        return @except unless except
        except = [except].flatten.compact.uniq.map { |o| o.to_s }
        except |= @except if @except
        except
      end
    end
    context.new(env && env.to_s).instance_eval(File.read(@gemfile), @gemfile, 1)
  end
end

module Gem
  @loaded_stacks = Hash.new { |h,k| h[k] = [] }

  def source_index.refresh!
    super
    Bundler.add_specs_to_index
  end
end
