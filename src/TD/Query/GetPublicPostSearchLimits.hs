module TD.Query.GetPublicPostSearchLimits
  (GetPublicPostSearchLimits(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks public post search limits without actually performing the search. Returns 'TD.Data.PublicPostSearchLimits.PublicPostSearchLimits'
data GetPublicPostSearchLimits
  = GetPublicPostSearchLimits
    { query :: Maybe T.Text -- ^ Query that will be searched for
    }
  deriving (Eq, Show)

instance I.ShortShow GetPublicPostSearchLimits where
  shortShow
    GetPublicPostSearchLimits
      { query = query_
      }
        = "GetPublicPostSearchLimits"
          ++ I.cc
          [ "query" `I.p` query_
          ]

instance AT.ToJSON GetPublicPostSearchLimits where
  toJSON
    GetPublicPostSearchLimits
      { query = query_
      }
        = A.object
          [ "@type" A..= AT.String "getPublicPostSearchLimits"
          , "query" A..= query_
          ]

