module TD.Data.ChatBoostSlot
  (ChatBoostSlot(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ChatBoostSlot
  = ChatBoostSlot -- ^ Describes a slot for chat boost
    { slot_id                   :: Maybe Int -- ^ Unique identifier of the slot
    , currently_boosted_chat_id :: Maybe Int -- ^ Identifier of the currently boosted chat; 0 if none
    , start_date                :: Maybe Int -- ^ Point in time (Unix timestamp) when the chat was boosted; 0 if none
    , expiration_date           :: Maybe Int -- ^ Point in time (Unix timestamp) when the boost will expire
    , cooldown_until_date       :: Maybe Int -- ^ Point in time (Unix timestamp) after which the boost can be used for another chat
    }
  deriving (Eq, Show)

instance I.ShortShow ChatBoostSlot where
  shortShow ChatBoostSlot
    { slot_id                   = slot_id_
    , currently_boosted_chat_id = currently_boosted_chat_id_
    , start_date                = start_date_
    , expiration_date           = expiration_date_
    , cooldown_until_date       = cooldown_until_date_
    }
      = "ChatBoostSlot"
        ++ I.cc
        [ "slot_id"                   `I.p` slot_id_
        , "currently_boosted_chat_id" `I.p` currently_boosted_chat_id_
        , "start_date"                `I.p` start_date_
        , "expiration_date"           `I.p` expiration_date_
        , "cooldown_until_date"       `I.p` cooldown_until_date_
        ]

instance AT.FromJSON ChatBoostSlot where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatBoostSlot" -> parseChatBoostSlot v
      _               -> mempty
    
    where
      parseChatBoostSlot :: A.Value -> AT.Parser ChatBoostSlot
      parseChatBoostSlot = A.withObject "ChatBoostSlot" $ \o -> do
        slot_id_                   <- o A..:?  "slot_id"
        currently_boosted_chat_id_ <- o A..:?  "currently_boosted_chat_id"
        start_date_                <- o A..:?  "start_date"
        expiration_date_           <- o A..:?  "expiration_date"
        cooldown_until_date_       <- o A..:?  "cooldown_until_date"
        pure $ ChatBoostSlot
          { slot_id                   = slot_id_
          , currently_boosted_chat_id = currently_boosted_chat_id_
          , start_date                = start_date_
          , expiration_date           = expiration_date_
          , cooldown_until_date       = cooldown_until_date_
          }
  parseJSON _ = mempty

