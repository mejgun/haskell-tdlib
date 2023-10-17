module TD.Data.ChatNearby
  (ChatNearby(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ChatNearby
  = ChatNearby -- ^ Describes a chat located nearby
    { chat_id  :: Maybe Int -- ^ Chat identifier
    , distance :: Maybe Int -- ^ Distance to the chat location, in meters
    }
  deriving (Eq, Show)

instance I.ShortShow ChatNearby where
  shortShow ChatNearby
    { chat_id  = chat_id_
    , distance = distance_
    }
      = "ChatNearby"
        ++ I.cc
        [ "chat_id"  `I.p` chat_id_
        , "distance" `I.p` distance_
        ]

instance AT.FromJSON ChatNearby where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatNearby" -> parseChatNearby v
      _            -> mempty
    
    where
      parseChatNearby :: A.Value -> AT.Parser ChatNearby
      parseChatNearby = A.withObject "ChatNearby" $ \o -> do
        chat_id_  <- o A..:?  "chat_id"
        distance_ <- o A..:?  "distance"
        pure $ ChatNearby
          { chat_id  = chat_id_
          , distance = distance_
          }
  parseJSON _ = mempty

