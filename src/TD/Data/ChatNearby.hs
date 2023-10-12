module TD.Data.ChatNearby where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ChatNearby
  = ChatNearby -- ^ Describes a chat located nearby
    { chat_id  :: Maybe Int -- ^ Chat identifier
    , distance :: Maybe Int -- ^ Distance to the chat location, in meters
    }
  deriving (Eq)

instance Show ChatNearby where
  show ChatNearby
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

instance AT.ToJSON ChatNearby where
  toJSON ChatNearby
    { chat_id  = chat_id_
    , distance = distance_
    }
      = A.object
        [ "@type"    A..= AT.String "chatNearby"
        , "chat_id"  A..= chat_id_
        , "distance" A..= distance_
        ]
