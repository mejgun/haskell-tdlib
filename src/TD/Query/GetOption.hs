module TD.Query.GetOption
  (GetOption(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns the value of an option by its name. (Check the list of available options on https://core.telegram.org/tdlib/options.) Can be called before authorization. Can be called synchronously for options "version" and "commit_hash"
data GetOption
  = GetOption
    { name :: Maybe T.Text -- ^ The name of the option
    }
  deriving (Eq)

instance Show GetOption where
  show
    GetOption
      { name = name_
      }
        = "GetOption"
          ++ I.cc
          [ "name" `I.p` name_
          ]

instance AT.ToJSON GetOption where
  toJSON
    GetOption
      { name = name_
      }
        = A.object
          [ "@type" A..= AT.String "getOption"
          , "name"  A..= name_
          ]

