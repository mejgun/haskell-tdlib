{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetOption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.OptionValue as OptionValue
import qualified Utils as U

-- |
-- Sets the value of an option. (Check the list of available options on https://core.telegram.org/tdlib/options.) Only writable options can be set. Can be called before authorization
data SetOption = SetOption
  { -- | The new value of the option; pass null to reset option value to a default value
    value :: Maybe OptionValue.OptionValue,
    -- | The name of the option
    name :: Maybe String
  }
  deriving (Eq)

instance Show SetOption where
  show
    SetOption
      { value = value_,
        name = name_
      } =
      "SetOption"
        ++ U.cc
          [ U.p "value" value_,
            U.p "name" name_
          ]

instance T.ToJSON SetOption where
  toJSON
    SetOption
      { value = value_,
        name = name_
      } =
      A.object
        [ "@type" A..= T.String "setOption",
          "value" A..= value_,
          "name" A..= name_
        ]
