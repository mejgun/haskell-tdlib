module TD.Query.SearchChatsOnServer
  (SearchChatsOnServer(..)
  , defaultSearchChatsOnServer
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for the specified query in the title and username of already known chats via request to the server. Returns chats in the order seen in the main chat list. Returns 'TD.Data.Chats.Chats'
data SearchChatsOnServer
  = SearchChatsOnServer
    { query :: Maybe T.Text -- ^ Query to search for
    , limit :: Maybe Int    -- ^ The maximum number of chats to be returned
    }
  deriving (Eq, Show)

instance I.ShortShow SearchChatsOnServer where
  shortShow
    SearchChatsOnServer
      { query = query_
      , limit = limit_
      }
        = "SearchChatsOnServer"
          ++ I.cc
          [ "query" `I.p` query_
          , "limit" `I.p` limit_
          ]

instance AT.ToJSON SearchChatsOnServer where
  toJSON
    SearchChatsOnServer
      { query = query_
      , limit = limit_
      }
        = A.object
          [ "@type" A..= AT.String "searchChatsOnServer"
          , "query" A..= query_
          , "limit" A..= limit_
          ]

defaultSearchChatsOnServer :: SearchChatsOnServer
defaultSearchChatsOnServer =
  SearchChatsOnServer
    { query = Nothing
    , limit = Nothing
    }

