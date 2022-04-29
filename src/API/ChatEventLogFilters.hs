-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatEventLogFilters where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Represents a set of filters used to obtain a chat event log
-- 
-- __message_edits__ True, if message edits need to be returned
-- 
-- __message_deletions__ True, if message deletions need to be returned
-- 
-- __message_pins__ True, if pin/unpin events need to be returned
-- 
-- __member_joins__ True, if members joining events need to be returned
-- 
-- __member_leaves__ True, if members leaving events need to be returned
-- 
-- __member_invites__ True, if invited member events need to be returned
-- 
-- __member_promotions__ True, if member promotion/demotion events need to be returned
-- 
-- __member_restrictions__ True, if member restricted/unrestricted/banned/unbanned events need to be returned
-- 
-- __info_changes__ True, if changes in chat information need to be returned
-- 
-- __setting_changes__ True, if changes in chat settings need to be returned
-- 
-- __invite_link_changes__ True, if changes to invite links need to be returned
-- 
-- __video_chat_changes__ True, if video chat actions need to be returned
data ChatEventLogFilters = 

 ChatEventLogFilters { video_chat_changes :: Maybe Bool, invite_link_changes :: Maybe Bool, setting_changes :: Maybe Bool, info_changes :: Maybe Bool, member_restrictions :: Maybe Bool, member_promotions :: Maybe Bool, member_invites :: Maybe Bool, member_leaves :: Maybe Bool, member_joins :: Maybe Bool, message_pins :: Maybe Bool, message_deletions :: Maybe Bool, message_edits :: Maybe Bool }  deriving (Eq)

instance Show ChatEventLogFilters where
 show ChatEventLogFilters { video_chat_changes=video_chat_changes, invite_link_changes=invite_link_changes, setting_changes=setting_changes, info_changes=info_changes, member_restrictions=member_restrictions, member_promotions=member_promotions, member_invites=member_invites, member_leaves=member_leaves, member_joins=member_joins, message_pins=message_pins, message_deletions=message_deletions, message_edits=message_edits } =
  "ChatEventLogFilters" ++ cc [p "video_chat_changes" video_chat_changes, p "invite_link_changes" invite_link_changes, p "setting_changes" setting_changes, p "info_changes" info_changes, p "member_restrictions" member_restrictions, p "member_promotions" member_promotions, p "member_invites" member_invites, p "member_leaves" member_leaves, p "member_joins" member_joins, p "message_pins" message_pins, p "message_deletions" message_deletions, p "message_edits" message_edits ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChatEventLogFilters where
 toJSON ChatEventLogFilters { video_chat_changes = video_chat_changes, invite_link_changes = invite_link_changes, setting_changes = setting_changes, info_changes = info_changes, member_restrictions = member_restrictions, member_promotions = member_promotions, member_invites = member_invites, member_leaves = member_leaves, member_joins = member_joins, message_pins = message_pins, message_deletions = message_deletions, message_edits = message_edits } =
  A.object [ "@type" A..= T.String "chatEventLogFilters", "video_chat_changes" A..= video_chat_changes, "invite_link_changes" A..= invite_link_changes, "setting_changes" A..= setting_changes, "info_changes" A..= info_changes, "member_restrictions" A..= member_restrictions, "member_promotions" A..= member_promotions, "member_invites" A..= member_invites, "member_leaves" A..= member_leaves, "member_joins" A..= member_joins, "message_pins" A..= message_pins, "message_deletions" A..= message_deletions, "message_edits" A..= message_edits ]

instance T.FromJSON ChatEventLogFilters where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatEventLogFilters" -> parseChatEventLogFilters v
   _ -> mempty
  where
   parseChatEventLogFilters :: A.Value -> T.Parser ChatEventLogFilters
   parseChatEventLogFilters = A.withObject "ChatEventLogFilters" $ \o -> do
    video_chat_changes <- o A..:? "video_chat_changes"
    invite_link_changes <- o A..:? "invite_link_changes"
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
    return $ ChatEventLogFilters { video_chat_changes = video_chat_changes, invite_link_changes = invite_link_changes, setting_changes = setting_changes, info_changes = info_changes, member_restrictions = member_restrictions, member_promotions = member_promotions, member_invites = member_invites, member_leaves = member_leaves, member_joins = member_joins, message_pins = message_pins, message_deletions = message_deletions, message_edits = message_edits }
 parseJSON _ = mempty
