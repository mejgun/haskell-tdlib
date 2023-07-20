{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Story where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.StoryContent as StoryContent
import qualified TD.Data.StoryInteractionInfo as StoryInteractionInfo
import qualified TD.Data.StoryPrivacySettings as StoryPrivacySettings
import qualified Utils as U

-- |
data Story = -- | Represents a story
  Story
  { -- | Caption of the story
    caption :: Maybe FormattedText.FormattedText,
    -- | Content of the story
    content :: Maybe StoryContent.StoryContent,
    -- | Privacy rules affecting story visibility; may be approximate for non-owned stories
    privacy_settings :: Maybe StoryPrivacySettings.StoryPrivacySettings,
    -- | Information about interactions with the story; may be null if the story isn't owned or there were no interactions
    interaction_info :: Maybe StoryInteractionInfo.StoryInteractionInfo,
    -- | True, if users viewed the story can't be received, because the story has expired more than getOption("story_viewers_expiration_delay") seconds ago
    has_expired_viewers :: Maybe Bool,
    -- | True, if users viewed the story can be received through getStoryViewers
    can_get_viewers :: Maybe Bool,
    -- | True, if the story can be replied in the chat with the story sender
    can_be_replied :: Maybe Bool,
    -- | True, if the story can be forwarded as a message. Otherwise, screenshots and saving of the story content must be also forbidden
    can_be_forwarded :: Maybe Bool,
    -- | True, if the story is visible only for the current user
    is_visible_only_for_self :: Maybe Bool,
    -- | True, if the story is saved in the sender's profile and will be available there after expiration
    is_pinned :: Maybe Bool,
    -- | True, if the story was edited
    is_edited :: Maybe Bool,
    -- | True, if the story is being edited by the current user
    is_being_edited :: Maybe Bool,
    -- | Point in time (Unix timestamp) when the story was published
    date :: Maybe Int,
    -- | Identifier of the chat that posted the story
    sender_chat_id :: Maybe Int,
    -- | Unique story identifier among stories of the given sender
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show Story where
  show
    Story
      { caption = caption_,
        content = content_,
        privacy_settings = privacy_settings_,
        interaction_info = interaction_info_,
        has_expired_viewers = has_expired_viewers_,
        can_get_viewers = can_get_viewers_,
        can_be_replied = can_be_replied_,
        can_be_forwarded = can_be_forwarded_,
        is_visible_only_for_self = is_visible_only_for_self_,
        is_pinned = is_pinned_,
        is_edited = is_edited_,
        is_being_edited = is_being_edited_,
        date = date_,
        sender_chat_id = sender_chat_id_,
        _id = _id_
      } =
      "Story"
        ++ U.cc
          [ U.p "caption" caption_,
            U.p "content" content_,
            U.p "privacy_settings" privacy_settings_,
            U.p "interaction_info" interaction_info_,
            U.p "has_expired_viewers" has_expired_viewers_,
            U.p "can_get_viewers" can_get_viewers_,
            U.p "can_be_replied" can_be_replied_,
            U.p "can_be_forwarded" can_be_forwarded_,
            U.p "is_visible_only_for_self" is_visible_only_for_self_,
            U.p "is_pinned" is_pinned_,
            U.p "is_edited" is_edited_,
            U.p "is_being_edited" is_being_edited_,
            U.p "date" date_,
            U.p "sender_chat_id" sender_chat_id_,
            U.p "_id" _id_
          ]

instance T.FromJSON Story where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "story" -> parseStory v
      _ -> mempty
    where
      parseStory :: A.Value -> T.Parser Story
      parseStory = A.withObject "Story" $ \o -> do
        caption_ <- o A..:? "caption"
        content_ <- o A..:? "content"
        privacy_settings_ <- o A..:? "privacy_settings"
        interaction_info_ <- o A..:? "interaction_info"
        has_expired_viewers_ <- o A..:? "has_expired_viewers"
        can_get_viewers_ <- o A..:? "can_get_viewers"
        can_be_replied_ <- o A..:? "can_be_replied"
        can_be_forwarded_ <- o A..:? "can_be_forwarded"
        is_visible_only_for_self_ <- o A..:? "is_visible_only_for_self"
        is_pinned_ <- o A..:? "is_pinned"
        is_edited_ <- o A..:? "is_edited"
        is_being_edited_ <- o A..:? "is_being_edited"
        date_ <- o A..:? "date"
        sender_chat_id_ <- o A..:? "sender_chat_id"
        _id_ <- o A..:? "id"
        return $ Story {caption = caption_, content = content_, privacy_settings = privacy_settings_, interaction_info = interaction_info_, has_expired_viewers = has_expired_viewers_, can_get_viewers = can_get_viewers_, can_be_replied = can_be_replied_, can_be_forwarded = can_be_forwarded_, is_visible_only_for_self = is_visible_only_for_self_, is_pinned = is_pinned_, is_edited = is_edited_, is_being_edited = is_being_edited_, date = date_, sender_chat_id = sender_chat_id_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON Story where
  toJSON
    Story
      { caption = caption_,
        content = content_,
        privacy_settings = privacy_settings_,
        interaction_info = interaction_info_,
        has_expired_viewers = has_expired_viewers_,
        can_get_viewers = can_get_viewers_,
        can_be_replied = can_be_replied_,
        can_be_forwarded = can_be_forwarded_,
        is_visible_only_for_self = is_visible_only_for_self_,
        is_pinned = is_pinned_,
        is_edited = is_edited_,
        is_being_edited = is_being_edited_,
        date = date_,
        sender_chat_id = sender_chat_id_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "story",
          "caption" A..= caption_,
          "content" A..= content_,
          "privacy_settings" A..= privacy_settings_,
          "interaction_info" A..= interaction_info_,
          "has_expired_viewers" A..= has_expired_viewers_,
          "can_get_viewers" A..= can_get_viewers_,
          "can_be_replied" A..= can_be_replied_,
          "can_be_forwarded" A..= can_be_forwarded_,
          "is_visible_only_for_self" A..= is_visible_only_for_self_,
          "is_pinned" A..= is_pinned_,
          "is_edited" A..= is_edited_,
          "is_being_edited" A..= is_being_edited_,
          "date" A..= date_,
          "sender_chat_id" A..= sender_chat_id_,
          "id" A..= _id_
        ]
