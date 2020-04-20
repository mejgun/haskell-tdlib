-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatEventLogFilters where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ChatEventLogFilters = 
 ChatEventLogFilters { setting_changes :: Bool, info_changes :: Bool, member_restrictions :: Bool, member_promotions :: Bool, member_invites :: Bool, member_leaves :: Bool, member_joins :: Bool, message_pins :: Bool, message_deletions :: Bool, message_edits :: Bool }  -- deriving (Show)

instance T.ToJSON ChatEventLogFilters where
 toJSON (ChatEventLogFilters { setting_changes = setting_changes, info_changes = info_changes, member_restrictions = member_restrictions, member_promotions = member_promotions, member_invites = member_invites, member_leaves = member_leaves, member_joins = member_joins, message_pins = message_pins, message_deletions = message_deletions, message_edits = message_edits }) =
  A.object [ "@type" A..= T.String "chatEventLogFilters", "setting_changes" A..= setting_changes, "info_changes" A..= info_changes, "member_restrictions" A..= member_restrictions, "member_promotions" A..= member_promotions, "member_invites" A..= member_invites, "member_leaves" A..= member_leaves, "member_joins" A..= member_joins, "message_pins" A..= message_pins, "message_deletions" A..= message_deletions, "message_edits" A..= message_edits ]
-- chatEventLogFilters ChatEventLogFilters  { setting_changes :: Bool, info_changes :: Bool, member_restrictions :: Bool, member_promotions :: Bool, member_invites :: Bool, member_leaves :: Bool, member_joins :: Bool, message_pins :: Bool, message_deletions :: Bool, message_edits :: Bool } 

