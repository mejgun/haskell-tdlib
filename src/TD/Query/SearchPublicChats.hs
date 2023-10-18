module TD.Query.SearchPublicChats
  (SearchPublicChats(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches public chats by looking for specified query in their username and title. Currently, only private chats, supergroups and channels can be public. Returns a meaningful number of results. Excludes private chats with contacts and chats from the chat list from the results. Returns 'TD.Data.Chats.Chats'
data SearchPublicChats
  = SearchPublicChats
    { query :: Maybe T.Text -- ^ Query to search for
    }
  deriving (Eq, Show)

instance I.ShortShow SearchPublicChats where
  shortShow
    SearchPublicChats
      { query = query_
      }
        = "SearchPublicChats"
          ++ I.cc
          [ "query" `I.p` query_
          ]

instance AT.ToJSON SearchPublicChats where
  toJSON
    SearchPublicChats
      { query = query_
      }
        = A.object
          [ "@type" A..= AT.String "searchPublicChats"
          , "query" A..= query_
          ]

