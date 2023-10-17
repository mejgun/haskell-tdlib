module TD.Data.ChatBoostStatus
  (ChatBoostStatus(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data ChatBoostStatus
  = ChatBoostStatus -- ^ Describes current boost status of a chat
    { boost_url                 :: Maybe T.Text -- ^ An HTTP URL, which can be used to boost the chat
    , is_boosted                :: Maybe Bool   -- ^ True, if the current user has already boosted the chat
    , level                     :: Maybe Int    -- ^ Current boost level of the chat
    , boost_count               :: Maybe Int    -- ^ The number of times the chat was boosted
    , current_level_boost_count :: Maybe Int    -- ^ The number of boosts added to reach the current level
    , next_level_boost_count    :: Maybe Int    -- ^ The number of boosts needed to reach the next level; 0 if the next level isn't available
    , premium_member_count      :: Maybe Int    -- ^ Approximate number of Telegram Premium subscribers joined the chat; always 0 if the current user isn't an administrator in the chat
    , premium_member_percentage :: Maybe Double -- ^ A percentage of Telegram Premium subscribers joined the chat; always 0 if the current user isn't an administrator in the chat
    }
  deriving (Eq, Show)

instance I.ShortShow ChatBoostStatus where
  shortShow ChatBoostStatus
    { boost_url                 = boost_url_
    , is_boosted                = is_boosted_
    , level                     = level_
    , boost_count               = boost_count_
    , current_level_boost_count = current_level_boost_count_
    , next_level_boost_count    = next_level_boost_count_
    , premium_member_count      = premium_member_count_
    , premium_member_percentage = premium_member_percentage_
    }
      = "ChatBoostStatus"
        ++ I.cc
        [ "boost_url"                 `I.p` boost_url_
        , "is_boosted"                `I.p` is_boosted_
        , "level"                     `I.p` level_
        , "boost_count"               `I.p` boost_count_
        , "current_level_boost_count" `I.p` current_level_boost_count_
        , "next_level_boost_count"    `I.p` next_level_boost_count_
        , "premium_member_count"      `I.p` premium_member_count_
        , "premium_member_percentage" `I.p` premium_member_percentage_
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
        is_boosted_                <- o A..:?  "is_boosted"
        level_                     <- o A..:?  "level"
        boost_count_               <- o A..:?  "boost_count"
        current_level_boost_count_ <- o A..:?  "current_level_boost_count"
        next_level_boost_count_    <- o A..:?  "next_level_boost_count"
        premium_member_count_      <- o A..:?  "premium_member_count"
        premium_member_percentage_ <- o A..:?  "premium_member_percentage"
        pure $ ChatBoostStatus
          { boost_url                 = boost_url_
          , is_boosted                = is_boosted_
          , level                     = level_
          , boost_count               = boost_count_
          , current_level_boost_count = current_level_boost_count_
          , next_level_boost_count    = next_level_boost_count_
          , premium_member_count      = premium_member_count_
          , premium_member_percentage = premium_member_percentage_
          }
  parseJSON _ = mempty

