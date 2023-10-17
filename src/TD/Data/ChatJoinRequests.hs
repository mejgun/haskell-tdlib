module TD.Data.ChatJoinRequests
  (ChatJoinRequests(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatJoinRequest as ChatJoinRequest

data ChatJoinRequests
  = ChatJoinRequests -- ^ Contains a list of requests to join a chat
    { total_count :: Maybe Int                               -- ^ Approximate total number of requests found
    , requests    :: Maybe [ChatJoinRequest.ChatJoinRequest] -- ^ List of the requests
    }
  deriving (Eq, Show)

instance I.ShortShow ChatJoinRequests where
  shortShow ChatJoinRequests
    { total_count = total_count_
    , requests    = requests_
    }
      = "ChatJoinRequests"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "requests"    `I.p` requests_
        ]

instance AT.FromJSON ChatJoinRequests where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatJoinRequests" -> parseChatJoinRequests v
      _                  -> mempty
    
    where
      parseChatJoinRequests :: A.Value -> AT.Parser ChatJoinRequests
      parseChatJoinRequests = A.withObject "ChatJoinRequests" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        requests_    <- o A..:?  "requests"
        pure $ ChatJoinRequests
          { total_count = total_count_
          , requests    = requests_
          }
  parseJSON _ = mempty

