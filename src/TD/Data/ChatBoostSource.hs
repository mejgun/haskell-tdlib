module TD.Data.ChatBoostSource
  (ChatBoostSource(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes source of a chat boost
data ChatBoostSource
  = ChatBoostSourceGiftCode -- ^ The chat created a Telegram Premium gift code for a user
    { user_id   :: Maybe Int    -- ^ Identifier of a user, for which the gift code was created
    , gift_code :: Maybe T.Text -- ^ The created Telegram Premium gift code, which is known only if this is a gift code for the current user, or it has already been claimed
    }
  | ChatBoostSourceGiveaway -- ^ The chat created a giveaway
    { user_id             :: Maybe Int    -- ^ Identifier of a user that won in the giveaway; 0 if none
    , gift_code           :: Maybe T.Text -- ^ The created Telegram Premium gift code if it was used by the user or can be claimed by the current user; an empty string otherwise; for Telegram Premium giveways only
    , star_count          :: Maybe Int    -- ^ Number of Telegram Stars distributed among winners of the giveaway
    , giveaway_message_id :: Maybe Int    -- ^ Identifier of the corresponding giveaway message; can be an identifier of a deleted message
    , is_unclaimed        :: Maybe Bool   -- ^ True, if the winner for the corresponding giveaway prize wasn't chosen, because there were not enough participants
    }
  | ChatBoostSourcePremium -- ^ A user with Telegram Premium subscription or gifted Telegram Premium boosted the chat
    { user_id :: Maybe Int -- ^ Identifier of the user
    }
  deriving (Eq, Show)

instance I.ShortShow ChatBoostSource where
  shortShow ChatBoostSourceGiftCode
    { user_id   = user_id_
    , gift_code = gift_code_
    }
      = "ChatBoostSourceGiftCode"
        ++ I.cc
        [ "user_id"   `I.p` user_id_
        , "gift_code" `I.p` gift_code_
        ]
  shortShow ChatBoostSourceGiveaway
    { user_id             = user_id_
    , gift_code           = gift_code_
    , star_count          = star_count_
    , giveaway_message_id = giveaway_message_id_
    , is_unclaimed        = is_unclaimed_
    }
      = "ChatBoostSourceGiveaway"
        ++ I.cc
        [ "user_id"             `I.p` user_id_
        , "gift_code"           `I.p` gift_code_
        , "star_count"          `I.p` star_count_
        , "giveaway_message_id" `I.p` giveaway_message_id_
        , "is_unclaimed"        `I.p` is_unclaimed_
        ]
  shortShow ChatBoostSourcePremium
    { user_id = user_id_
    }
      = "ChatBoostSourcePremium"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        ]

instance AT.FromJSON ChatBoostSource where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatBoostSourceGiftCode" -> parseChatBoostSourceGiftCode v
      "chatBoostSourceGiveaway" -> parseChatBoostSourceGiveaway v
      "chatBoostSourcePremium"  -> parseChatBoostSourcePremium v
      _                         -> mempty
    
    where
      parseChatBoostSourceGiftCode :: A.Value -> AT.Parser ChatBoostSource
      parseChatBoostSourceGiftCode = A.withObject "ChatBoostSourceGiftCode" $ \o -> do
        user_id_   <- o A..:?  "user_id"
        gift_code_ <- o A..:?  "gift_code"
        pure $ ChatBoostSourceGiftCode
          { user_id   = user_id_
          , gift_code = gift_code_
          }
      parseChatBoostSourceGiveaway :: A.Value -> AT.Parser ChatBoostSource
      parseChatBoostSourceGiveaway = A.withObject "ChatBoostSourceGiveaway" $ \o -> do
        user_id_             <- o A..:?  "user_id"
        gift_code_           <- o A..:?  "gift_code"
        star_count_          <- o A..:?  "star_count"
        giveaway_message_id_ <- o A..:?  "giveaway_message_id"
        is_unclaimed_        <- o A..:?  "is_unclaimed"
        pure $ ChatBoostSourceGiveaway
          { user_id             = user_id_
          , gift_code           = gift_code_
          , star_count          = star_count_
          , giveaway_message_id = giveaway_message_id_
          , is_unclaimed        = is_unclaimed_
          }
      parseChatBoostSourcePremium :: A.Value -> AT.Parser ChatBoostSource
      parseChatBoostSourcePremium = A.withObject "ChatBoostSourcePremium" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        pure $ ChatBoostSourcePremium
          { user_id = user_id_
          }
  parseJSON _ = mempty

