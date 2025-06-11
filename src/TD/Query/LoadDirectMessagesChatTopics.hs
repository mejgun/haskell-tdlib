module TD.Query.LoadDirectMessagesChatTopics
  (LoadDirectMessagesChatTopics(..)
  , defaultLoadDirectMessagesChatTopics
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Loads more topics in a channel direct messages chat administered by the current user. The loaded topics will be sent through updateDirectMessagesChatTopic. Topics are sorted by their topic.order in descending order. Returns a 404 error if all topics have been loaded. Returns 'TD.Data.Ok.Ok'
data LoadDirectMessagesChatTopics
  = LoadDirectMessagesChatTopics
    { chat_id :: Maybe Int -- ^ Chat identifier of the channel direct messages chat
    , limit   :: Maybe Int -- ^ The maximum number of topics to be loaded. For optimal performance, the number of loaded topics is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached
    }
  deriving (Eq, Show)

instance I.ShortShow LoadDirectMessagesChatTopics where
  shortShow
    LoadDirectMessagesChatTopics
      { chat_id = chat_id_
      , limit   = limit_
      }
        = "LoadDirectMessagesChatTopics"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "limit"   `I.p` limit_
          ]

instance AT.ToJSON LoadDirectMessagesChatTopics where
  toJSON
    LoadDirectMessagesChatTopics
      { chat_id = chat_id_
      , limit   = limit_
      }
        = A.object
          [ "@type"   A..= AT.String "loadDirectMessagesChatTopics"
          , "chat_id" A..= chat_id_
          , "limit"   A..= limit_
          ]

defaultLoadDirectMessagesChatTopics :: LoadDirectMessagesChatTopics
defaultLoadDirectMessagesChatTopics =
  LoadDirectMessagesChatTopics
    { chat_id = Nothing
    , limit   = Nothing
    }

