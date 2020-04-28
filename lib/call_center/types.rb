# frozen_string_literal: true

require 'dry-types'

module CallCenter
  module Types
    send(:include, Dry.Types())
    include Dry::Logic


    ChannelType       = Types::Coercible::String.default("VOICE").enum("VOICE", "CHAT")
    PhoneType         = Types::Coercible::String.default("SOFT_PHONE").enum("SOFT_PHONE", "DESK_PHONE")
    PhoneNumber       = Types::String

    Email             = String.constrained(format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
    EmailOrString     = CallCenter::Types::Email | Types::String

    Environment       = Types::Coercible::Symbol.default(:production).enum(:development, :test, :production)
    Serializers       = Types::String.default('yaml_serializer'.freeze).enum('yaml_serializer', 'xml_serializer')
    Stores            = Types::String.default('file_store'.freeze).enum('file_store')

    CallableDate      = Types::Date.default { Date.today }
    CallableDateTime  = Types::DateTime.default { DateTime.now }

    RequiredSymbol    = Types::Strict::Symbol.constrained(min_size: 2)

    HashOrNil         = Types::Hash | Types::Nil
    StringOrNil       = Types::String | Types::Nil


    RequiredString    = Types::Strict::String.constrained(min_size: 1)
    StrippedString    = Types::String.constructor(&:strip)
    SymbolOrString    = Types::Symbol | Types::String
    NilOrString       = Types::Nil | Types::String

    StrictSymbolizingHash = Types::Hash.schema({}).strict.with_key_transform(&:to_sym)

    Callable   = Types.Interface(:call)

  end
end
