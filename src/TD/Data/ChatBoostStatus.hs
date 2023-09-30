{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatBoostStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatBoostStatus = -- | Describes current boost status of a chat
  ChatBoostStatus
  { -- | A percentage of Telegram Premium subscribers joined the chat; always 0 if the current user isn't an administrator in the chat
    premium_member_percentage :: Maybe Float,
    -- | Approximate number of Telegram Premium subscribers joined the chat; always 0 if the current user isn't an administrator in the chat
    premium_member_count :: Maybe Int,
    -- | The number of boosts needed to reach the next level; 0 if the next level isn't available
    next_level_boost_count :: Maybe Int,
    -- | The number of boosts added to reach the current level
    current_level_boost_count :: Maybe Int,
    -- | The number of times the chat was boosted
    boost_count :: Maybe Int,
    -- | Current boost level of the chat
    level :: Maybe Int,
    -- | True, if the current user has already boosted the chat
    is_boosted :: Maybe Bool
  }
  deriving (Eq)

instance Show ChatBoostStatus where
  show
    ChatBoostStatus
      { premium_member_percentage = premium_member_percentage_,
        premium_member_count = premium_member_count_,
        next_level_boost_count = next_level_boost_count_,
        current_level_boost_count = current_level_boost_count_,
        boost_count = boost_count_,
        level = level_,
        is_boosted = is_boosted_
      } =
      "ChatBoostStatus"
        ++ U.cc
          [ U.p "premium_member_percentage" premium_member_percentage_,
            U.p "premium_member_count" premium_member_count_,
            U.p "next_level_boost_count" next_level_boost_count_,
            U.p "current_level_boost_count" current_level_boost_count_,
            U.p "boost_count" boost_count_,
            U.p "level" level_,
            U.p "is_boosted" is_boosted_
          ]

instance T.FromJSON ChatBoostStatus where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatBoostStatus" -> parseChatBoostStatus v
      _ -> mempty
    where
      parseChatBoostStatus :: A.Value -> T.Parser ChatBoostStatus
      parseChatBoostStatus = A.withObject "ChatBoostStatus" $ \o -> do
        premium_member_percentage_ <- o A..:? "premium_member_percentage"
        premium_member_count_ <- o A..:? "premium_member_count"
        next_level_boost_count_ <- o A..:? "next_level_boost_count"
        current_level_boost_count_ <- o A..:? "current_level_boost_count"
        boost_count_ <- o A..:? "boost_count"
        level_ <- o A..:? "level"
        is_boosted_ <- o A..:? "is_boosted"
        return $ ChatBoostStatus {premium_member_percentage = premium_member_percentage_, premium_member_count = premium_member_count_, next_level_boost_count = next_level_boost_count_, current_level_boost_count = current_level_boost_count_, boost_count = boost_count_, level = level_, is_boosted = is_boosted_}
  parseJSON _ = mempty

instance T.ToJSON ChatBoostStatus where
  toJSON
    ChatBoostStatus
      { premium_member_percentage = premium_member_percentage_,
        premium_member_count = premium_member_count_,
        next_level_boost_count = next_level_boost_count_,
        current_level_boost_count = current_level_boost_count_,
        boost_count = boost_count_,
        level = level_,
        is_boosted = is_boosted_
      } =
      A.object
        [ "@type" A..= T.String "chatBoostStatus",
          "premium_member_percentage" A..= premium_member_percentage_,
          "premium_member_count" A..= premium_member_count_,
          "next_level_boost_count" A..= next_level_boost_count_,
          "current_level_boost_count" A..= current_level_boost_count_,
          "boost_count" A..= boost_count_,
          "level" A..= level_,
          "is_boosted" A..= is_boosted_
        ]
