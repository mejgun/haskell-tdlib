module TD.Query.SearchChatsOnServer where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data SearchChatsOnServer -- ^ Searches for the specified query in the title and username of already known chats via request to the server. Returns chats in the order seen in the main chat list
  = SearchChatsOnServer
    { query :: Maybe T.Text -- ^ Query to search for
    , limit :: Maybe Int    -- ^ The maximum number of chats to be returned
    }
  deriving (Eq)

instance Show SearchChatsOnServer where
  show
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
