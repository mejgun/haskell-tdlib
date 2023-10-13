module TD.Query.SearchBackground
  (SearchBackground(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data SearchBackground -- ^ Searches for a background by its name
  = SearchBackground
    { name :: Maybe T.Text -- ^ The name of the background
    }
  deriving (Eq)

instance Show SearchBackground where
  show
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

