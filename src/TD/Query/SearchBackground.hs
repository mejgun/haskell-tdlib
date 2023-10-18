module TD.Query.SearchBackground
  (SearchBackground(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for a background by its name. Returns 'TD.Data.Background.Background'
data SearchBackground
  = SearchBackground
    { name :: Maybe T.Text -- ^ The name of the background
    }
  deriving (Eq, Show)

instance I.ShortShow SearchBackground where
  shortShow
    SearchBackground
      { name = name_
      }
        = "SearchBackground"
          ++ I.cc
          [ "name" `I.p` name_
          ]

instance AT.ToJSON SearchBackground where
  toJSON
    SearchBackground
      { name = name_
      }
        = A.object
          [ "@type" A..= AT.String "searchBackground"
          , "name"  A..= name_
          ]

