module TD.Data.ChatBoost
  (ChatBoost(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ChatBoost
  = ChatBoost -- ^ Describes a boost of a chat
    { user_id         :: Maybe Int -- ^ Identifier of a user that boosted the chat
    , expiration_date :: Maybe Int -- ^ Point in time (Unix timestamp) when the boost will automatically expire if the user will not prolongate their Telegram Premium subscription
    }
  deriving (Eq, Show)

instance I.ShortShow ChatBoost where
  shortShow ChatBoost
    { user_id         = user_id_
    , expiration_date = expiration_date_
    }
      = "ChatBoost"
        ++ I.cc
        [ "user_id"         `I.p` user_id_
        , "expiration_date" `I.p` expiration_date_
        ]

instance AT.FromJSON ChatBoost where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatBoost" -> parseChatBoost v
      _           -> mempty
    
    where
      parseChatBoost :: A.Value -> AT.Parser ChatBoost
      parseChatBoost = A.withObject "ChatBoost" $ \o -> do
        user_id_         <- o A..:?  "user_id"
        expiration_date_ <- o A..:?  "expiration_date"
        pure $ ChatBoost
          { user_id         = user_id_
          , expiration_date = expiration_date_
          }
  parseJSON _ = mempty

