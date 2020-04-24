-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatEventLogFilters where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ChatEventLogFilters = 
 ChatEventLogFilters { setting_changes :: Maybe Bool, info_changes :: Maybe Bool, member_restrictions :: Maybe Bool, member_promotions :: Maybe Bool, member_invites :: Maybe Bool, member_leaves :: Maybe Bool, member_joins :: Maybe Bool, message_pins :: Maybe Bool, message_deletions :: Maybe Bool, message_edits :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON ChatEventLogFilters where
 toJSON (ChatEventLogFilters { setting_changes = setting_changes, info_changes = info_changes, member_restrictions = member_restrictions, member_promotions = member_promotions, member_invites = member_invites, member_leaves = member_leaves, member_joins = member_joins, message_pins = message_pins, message_deletions = message_deletions, message_edits = message_edits }) =
  A.object [ "@type" A..= T.String "chatEventLogFilters", "setting_changes" A..= setting_changes, "info_changes" A..= info_changes, "member_restrictions" A..= member_restrictions, "member_promotions" A..= member_promotions, "member_invites" A..= member_invites, "member_leaves" A..= member_leaves, "member_joins" A..= member_joins, "message_pins" A..= message_pins, "message_deletions" A..= message_deletions, "message_edits" A..= message_edits ]

instance T.FromJSON ChatEventLogFilters where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatEventLogFilters" -> parseChatEventLogFilters v
   _ -> mempty
  where
   parseChatEventLogFilters :: A.Value -> T.Parser ChatEventLogFilters
   parseChatEventLogFilters = A.withObject "ChatEventLogFilters" $ \o -> do
    setting_changes <- optional $ o A..: "setting_changes"
    info_changes <- optional $ o A..: "info_changes"
    member_restrictions <- optional $ o A..: "member_restrictions"
    member_promotions <- optional $ o A..: "member_promotions"
    member_invites <- optional $ o A..: "member_invites"
    member_leaves <- optional $ o A..: "member_leaves"
    member_joins <- optional $ o A..: "member_joins"
    message_pins <- optional $ o A..: "message_pins"
    message_deletions <- optional $ o A..: "message_deletions"
    message_edits <- optional $ o A..: "message_edits"
    return $ ChatEventLogFilters { setting_changes = setting_changes, info_changes = info_changes, member_restrictions = member_restrictions, member_promotions = member_promotions, member_invites = member_invites, member_leaves = member_leaves, member_joins = member_joins, message_pins = message_pins, message_deletions = message_deletions, message_edits = message_edits }