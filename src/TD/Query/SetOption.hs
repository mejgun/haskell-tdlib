module TD.Query.SetOption
  (SetOption(..)
  , defaultSetOption
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.OptionValue as OptionValue

-- | Sets the value of an option. (Check the list of available options on https://core.telegram.org/tdlib/options.) Only writable options can be set. Can be called before authorization. Returns 'TD.Data.Ok.Ok'
data SetOption
  = SetOption
    { name  :: Maybe T.Text                  -- ^ The name of the option
    , value :: Maybe OptionValue.OptionValue -- ^ The new value of the option; pass null to reset option value to a default value
    }
  deriving (Eq, Show)

instance I.ShortShow SetOption where
  shortShow
    SetOption
      { name  = name_
      , value = value_
      }
        = "SetOption"
          ++ I.cc
          [ "name"  `I.p` name_
          , "value" `I.p` value_
          ]

instance AT.ToJSON SetOption where
  toJSON
    SetOption
      { name  = name_
      , value = value_
      }
        = A.object
          [ "@type" A..= AT.String "setOption"
          , "name"  A..= name_
          , "value" A..= value_
          ]

defaultSetOption :: SetOption
defaultSetOption =
  SetOption
    { name  = Nothing
    , value = Nothing
    }

