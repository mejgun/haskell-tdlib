module TD.Data.ChatBoostStatus
  (ChatBoostStatus(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.PrepaidGiveaway as PrepaidGiveaway

data ChatBoostStatus
  = ChatBoostStatus -- ^ Describes current boost status of a chat
    { boost_url                 :: Maybe T.Text                            -- ^ An HTTP URL, which can be used to boost the chat
    , applied_slot_ids          :: Maybe [Int]                             -- ^ Identifiers of boost slots of the current user applied to the chat
    , level                     :: Maybe Int                               -- ^ Current boost level of the chat
    , gift_code_boost_count     :: Maybe Int                               -- ^ The number of boosts received by the chat from created Telegram Premium gift codes and giveaways; always 0 if the current user isn't an administrator in the chat
    , boost_count               :: Maybe Int                               -- ^ The number of boosts received by the chat
    , current_level_boost_count :: Maybe Int                               -- ^ The number of boosts added to reach the current level
    , next_level_boost_count    :: Maybe Int                               -- ^ The number of boosts needed to reach the next level; 0 if the next level isn't available
    , premium_member_count      :: Maybe Int                               -- ^ Approximate number of Telegram Premium subscribers joined the chat; always 0 if the current user isn't an administrator in the chat
    , premium_member_percentage :: Maybe Double                            -- ^ A percentage of Telegram Premium subscribers joined the chat; always 0 if the current user isn't an administrator in the chat
    , prepaid_giveaways         :: Maybe [PrepaidGiveaway.PrepaidGiveaway] -- ^ The list of prepaid giveaways available for the chat; only for chat administrators
    }
  deriving (Eq, Show)

instance I.ShortShow ChatBoostStatus where
  shortShow ChatBoostStatus
    { boost_url                 = boost_url_
    , applied_slot_ids          = applied_slot_ids_
    , level                     = level_
    , gift_code_boost_count     = gift_code_boost_count_
    , boost_count               = boost_count_
    , current_level_boost_count = current_level_boost_count_
    , next_level_boost_count    = next_level_boost_count_
    , premium_member_count      = premium_member_count_
    , premium_member_percentage = premium_member_percentage_
    , prepaid_giveaways         = prepaid_giveaways_
    }
      = "ChatBoostStatus"
        ++ I.cc
        [ "boost_url"                 `I.p` boost_url_
        , "applied_slot_ids"          `I.p` applied_slot_ids_
        , "level"                     `I.p` level_
        , "gift_code_boost_count"     `I.p` gift_code_boost_count_
        , "boost_count"               `I.p` boost_count_
        , "current_level_boost_count" `I.p` current_level_boost_count_
        , "next_level_boost_count"    `I.p` next_level_boost_count_
        , "premium_member_count"      `I.p` premium_member_count_
        , "premium_member_percentage" `I.p` premium_member_percentage_
        , "prepaid_giveaways"         `I.p` prepaid_giveaways_
        ]

instance AT.FromJSON ChatBoostStatus where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatBoostStatus" -> parseChatBoostStatus v
      _                 -> mempty
    
    where
      parseChatBoostStatus :: A.Value -> AT.Parser ChatBoostStatus
      parseChatBoostStatus = A.withObject "ChatBoostStatus" $ \o -> do
        boost_url_                 <- o A..:?  "boost_url"
        applied_slot_ids_          <- o A..:?  "applied_slot_ids"
        level_                     <- o A..:?  "level"
        gift_code_boost_count_     <- o A..:?  "gift_code_boost_count"
        boost_count_               <- o A..:?  "boost_count"
        current_level_boost_count_ <- o A..:?  "current_level_boost_count"
        next_level_boost_count_    <- o A..:?  "next_level_boost_count"
        premium_member_count_      <- o A..:?  "premium_member_count"
        premium_member_percentage_ <- o A..:?  "premium_member_percentage"
        prepaid_giveaways_         <- o A..:?  "prepaid_giveaways"
        pure $ ChatBoostStatus
          { boost_url                 = boost_url_
          , applied_slot_ids          = applied_slot_ids_
          , level                     = level_
          , gift_code_boost_count     = gift_code_boost_count_
          , boost_count               = boost_count_
          , current_level_boost_count = current_level_boost_count_
          , next_level_boost_count    = next_level_boost_count_
          , premium_member_count      = premium_member_count_
          , premium_member_percentage = premium_member_percentage_
          , prepaid_giveaways         = prepaid_giveaways_
          }
  parseJSON _ = mempty

