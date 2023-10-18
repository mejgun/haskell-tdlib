module TD.Query.SearchOutgoingDocumentMessages
  (SearchOutgoingDocumentMessages(..)
  , defaultSearchOutgoingDocumentMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Searches for outgoing messages with content of the type messageDocument in all chats except secret chats. Returns the results in reverse chronological order. Returns 'TD.Data.FoundMessages.FoundMessages'
data SearchOutgoingDocumentMessages
  = SearchOutgoingDocumentMessages
    { query :: Maybe T.Text -- ^ Query to search for in document file name and message caption
    , limit :: Maybe Int    -- ^ The maximum number of messages to be returned; up to 100
    }
  deriving (Eq, Show)

instance I.ShortShow SearchOutgoingDocumentMessages where
  shortShow
    SearchOutgoingDocumentMessages
      { query = query_
      , limit = limit_
      }
        = "SearchOutgoingDocumentMessages"
          ++ I.cc
          [ "query" `I.p` query_
          , "limit" `I.p` limit_
          ]

instance AT.ToJSON SearchOutgoingDocumentMessages where
  toJSON
    SearchOutgoingDocumentMessages
      { query = query_
      , limit = limit_
      }
        = A.object
          [ "@type" A..= AT.String "searchOutgoingDocumentMessages"
          , "query" A..= query_
          , "limit" A..= limit_
          ]

defaultSearchOutgoingDocumentMessages :: SearchOutgoingDocumentMessages
defaultSearchOutgoingDocumentMessages =
  SearchOutgoingDocumentMessages
    { query = Nothing
    , limit = Nothing
    }

