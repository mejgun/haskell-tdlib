{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatEventLogFilters where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatEventLogFilters = -- | Represents a set of filters used to obtain a chat event log
  ChatEventLogFilters
  { -- | True, if video chat actions need to be returned
    video_chat_changes :: Maybe Bool,
    -- | True, if changes to invite links need to be returned
    invite_link_changes :: Maybe Bool,
    -- | True, if changes in chat settings need to be returned
    setting_changes :: Maybe Bool,
    -- | True, if changes in chat information need to be returned
    info_changes :: Maybe Bool,
    -- | True, if member restricted/unrestricted/banned/unbanned events need to be returned
    member_restrictions :: Maybe Bool,
    -- | True, if member promotion/demotion events need to be returned
    member_promotions :: Maybe Bool,
    -- | True, if invited member events need to be returned
    member_invites :: Maybe Bool,
    -- | True, if members leaving events need to be returned
    member_leaves :: Maybe Bool,
    -- | True, if members joining events need to be returned
    member_joins :: Maybe Bool,
    -- | True, if pin/unpin events need to be returned
    message_pins :: Maybe Bool,
    -- | True, if message deletions need to be returned
    message_deletions :: Maybe Bool,
    -- | True, if message edits need to be returned
    message_edits :: Maybe Bool
  }
  deriving (Eq)

instance Show ChatEventLogFilters where
  show
    ChatEventLogFilters
      { video_chat_changes = video_chat_changes_,
        invite_link_changes = invite_link_changes_,
        setting_changes = setting_changes_,
        info_changes = info_changes_,
        member_restrictions = member_restrictions_,
        member_promotions = member_promotions_,
        member_invites = member_invites_,
        member_leaves = member_leaves_,
        member_joins = member_joins_,
        message_pins = message_pins_,
        message_deletions = message_deletions_,
        message_edits = message_edits_
      } =
      "ChatEventLogFilters"
        ++ U.cc
          [ U.p "video_chat_changes" video_chat_changes_,
            U.p "invite_link_changes" invite_link_changes_,
            U.p "setting_changes" setting_changes_,
            U.p "info_changes" info_changes_,
            U.p "member_restrictions" member_restrictions_,
            U.p "member_promotions" member_promotions_,
            U.p "member_invites" member_invites_,
            U.p "member_leaves" member_leaves_,
            U.p "member_joins" member_joins_,
            U.p "message_pins" message_pins_,
            U.p "message_deletions" message_deletions_,
            U.p "message_edits" message_edits_
          ]

instance T.FromJSON ChatEventLogFilters where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatEventLogFilters" -> parseChatEventLogFilters v
      _ -> mempty
    where
      parseChatEventLogFilters :: A.Value -> T.Parser ChatEventLogFilters
      parseChatEventLogFilters = A.withObject "ChatEventLogFilters" $ \o -> do
        video_chat_changes_ <- o A..:? "video_chat_changes"
        invite_link_changes_ <- o A..:? "invite_link_changes"
        setting_changes_ <- o A..:? "setting_changes"
        info_changes_ <- o A..:? "info_changes"
        member_restrictions_ <- o A..:? "member_restrictions"
        member_promotions_ <- o A..:? "member_promotions"
        member_invites_ <- o A..:? "member_invites"
        member_leaves_ <- o A..:? "member_leaves"
        member_joins_ <- o A..:? "member_joins"
        message_pins_ <- o A..:? "message_pins"
        message_deletions_ <- o A..:? "message_deletions"
        message_edits_ <- o A..:? "message_edits"
        return $ ChatEventLogFilters {video_chat_changes = video_chat_changes_, invite_link_changes = invite_link_changes_, setting_changes = setting_changes_, info_changes = info_changes_, member_restrictions = member_restrictions_, member_promotions = member_promotions_, member_invites = member_invites_, member_leaves = member_leaves_, member_joins = member_joins_, message_pins = message_pins_, message_deletions = message_deletions_, message_edits = message_edits_}
  parseJSON _ = mempty

instance T.ToJSON ChatEventLogFilters where
  toJSON
    ChatEventLogFilters
      { video_chat_changes = video_chat_changes_,
        invite_link_changes = invite_link_changes_,
        setting_changes = setting_changes_,
        info_changes = info_changes_,
        member_restrictions = member_restrictions_,
        member_promotions = member_promotions_,
        member_invites = member_invites_,
        member_leaves = member_leaves_,
        member_joins = member_joins_,
        message_pins = message_pins_,
        message_deletions = message_deletions_,
        message_edits = message_edits_
      } =
      A.object
        [ "@type" A..= T.String "chatEventLogFilters",
          "video_chat_changes" A..= video_chat_changes_,
          "invite_link_changes" A..= invite_link_changes_,
          "setting_changes" A..= setting_changes_,
          "info_changes" A..= info_changes_,
          "member_restrictions" A..= member_restrictions_,
          "member_promotions" A..= member_promotions_,
          "member_invites" A..= member_invites_,
          "member_leaves" A..= member_leaves_,
          "member_joins" A..= member_joins_,
          "message_pins" A..= message_pins_,
          "message_deletions" A..= message_deletions_,
          "message_edits" A..= message_edits_
        ]
