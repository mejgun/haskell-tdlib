module TD.Query.GetSearchSponsoredChats
  (GetSearchSponsoredChats(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns sponsored chats to be shown in the search results. Returns 'TD.Data.SponsoredChats.SponsoredChats'
data GetSearchSponsoredChats
  = GetSearchSponsoredChats
    { query :: Maybe T.Text -- ^ Query the user searches for
    }
  deriving (Eq, Show)

instance I.ShortShow GetSearchSponsoredChats where
  shortShow
    GetSearchSponsoredChats
      { query = query_
      }
        = "GetSearchSponsoredChats"
          ++ I.cc
          [ "query" `I.p` query_
          ]

instance AT.ToJSON GetSearchSponsoredChats where
  toJSON
    GetSearchSponsoredChats
      { query = query_
      }
        = A.object
          [ "@type" A..= AT.String "getSearchSponsoredChats"
          , "query" A..= query_
          ]

