-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatEventLogFilters where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Represents a set of filters used to obtain a chat event log
-- 
-- __message_edits__ True, if message edits should be returned
-- 
-- __message_deletions__ True, if message deletions should be returned
-- 
-- __message_pins__ True, if pin/unpin events should be returned
-- 
-- __member_joins__ True, if members joining events should be returned
-- 
-- __member_leaves__ True, if members leaving events should be returned
-- 
-- __member_invites__ True, if invited member events should be returned
-- 
-- __member_promotions__ True, if member promotion/demotion events should be returned
-- 
-- __member_restrictions__ True, if member restricted/unrestricted/banned/unbanned events should be returned
-- 
-- __info_changes__ True, if changes in chat information should be returned
-- 
-- __setting_changes__ True, if changes in chat settings should be returned
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
    setting_changes <- o A..:? "setting_changes"
    info_changes <- o A..:? "info_changes"
    member_restrictions <- o A..:? "member_restrictions"
    member_promotions <- o A..:? "member_promotions"
    member_invites <- o A..:? "member_invites"
    member_leaves <- o A..:? "member_leaves"
    member_joins <- o A..:? "member_joins"
    message_pins <- o A..:? "message_pins"
    message_deletions <- o A..:? "message_deletions"
    message_edits <- o A..:? "message_edits"
    return $ ChatEventLogFilters { setting_changes = setting_changes, info_changes = info_changes, member_restrictions = member_restrictions, member_promotions = member_promotions, member_invites = member_invites, member_leaves = member_leaves, member_joins = member_joins, message_pins = message_pins, message_deletions = message_deletions, message_edits = message_edits }