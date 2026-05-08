module TD.Query.GetTextCompositionStyleExample
  (GetTextCompositionStyleExample(..)
  , defaultGetTextCompositionStyleExample
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns an example of usage of a custom text composition style. Returns 'TD.Data.TextCompositionStyleExample.TextCompositionStyleExample'
data GetTextCompositionStyleExample
  = GetTextCompositionStyleExample
    { name           :: Maybe T.Text -- ^ Name of the style
    , example_number :: Maybe Int    -- ^ 0-based unique number of the requested example; must be non-negative and less than getOption("text_composition_style_example_count")
    }
  deriving (Eq, Show)

instance I.ShortShow GetTextCompositionStyleExample where
  shortShow
    GetTextCompositionStyleExample
      { name           = name_
      , example_number = example_number_
      }
        = "GetTextCompositionStyleExample"
          ++ I.cc
          [ "name"           `I.p` name_
          , "example_number" `I.p` example_number_
          ]

instance AT.ToJSON GetTextCompositionStyleExample where
  toJSON
    GetTextCompositionStyleExample
      { name           = name_
      , example_number = example_number_
      }
        = A.object
          [ "@type"          A..= AT.String "getTextCompositionStyleExample"
          , "name"           A..= name_
          , "example_number" A..= example_number_
          ]

defaultGetTextCompositionStyleExample :: GetTextCompositionStyleExample
defaultGetTextCompositionStyleExample =
  GetTextCompositionStyleExample
    { name           = Nothing
    , example_number = Nothing
    }

