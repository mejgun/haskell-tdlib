module TD.Query.SearchTextCompositionStyle
  (SearchTextCompositionStyle(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches a custom text composition style by its name. Returns 'TD.Data.TextCompositionStyle.TextCompositionStyle'
data SearchTextCompositionStyle
  = SearchTextCompositionStyle
    { name :: Maybe T.Text -- ^ Name of the style
    }
  deriving (Eq, Show)

instance I.ShortShow SearchTextCompositionStyle where
  shortShow
    SearchTextCompositionStyle
      { name = name_
      }
        = "SearchTextCompositionStyle"
          ++ I.cc
          [ "name" `I.p` name_
          ]

instance AT.ToJSON SearchTextCompositionStyle where
  toJSON
    SearchTextCompositionStyle
      { name = name_
      }
        = A.object
          [ "@type" A..= AT.String "searchTextCompositionStyle"
          , "name"  A..= name_
          ]

