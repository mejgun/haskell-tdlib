module TD.Query.GetStoryAvailableReactions
  (GetStoryAvailableReactions(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns reactions, which can be chosen for a story. Returns 'TD.Data.AvailableReactions.AvailableReactions'
data GetStoryAvailableReactions
  = GetStoryAvailableReactions
    { row_size :: Maybe Int -- ^ Number of reaction per row, 5-25
    }
  deriving (Eq, Show)

instance I.ShortShow GetStoryAvailableReactions where
  shortShow
    GetStoryAvailableReactions
      { row_size = row_size_
      }
        = "GetStoryAvailableReactions"
          ++ I.cc
          [ "row_size" `I.p` row_size_
          ]

instance AT.ToJSON GetStoryAvailableReactions where
  toJSON
    GetStoryAvailableReactions
      { row_size = row_size_
      }
        = A.object
          [ "@type"    A..= AT.String "getStoryAvailableReactions"
          , "row_size" A..= row_size_
          ]

