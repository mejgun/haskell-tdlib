module TD.Data.Story
  (Story(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StoryInteractionInfo as StoryInteractionInfo
import qualified TD.Data.StoryPrivacySettings as StoryPrivacySettings
import qualified TD.Data.StoryContent as StoryContent
import qualified TD.Data.FormattedText as FormattedText

data Story
  = Story -- ^ Represents a story
    { _id                      :: Maybe Int                                       -- ^ Unique story identifier among stories of the given sender
    , sender_chat_id           :: Maybe Int                                       -- ^ Identifier of the chat that posted the story
    , date                     :: Maybe Int                                       -- ^ Point in time (Unix timestamp) when the story was published
    , is_being_edited          :: Maybe Bool                                      -- ^ True, if the story is being edited by the current user
    , is_edited                :: Maybe Bool                                      -- ^ True, if the story was edited
    , is_pinned                :: Maybe Bool                                      -- ^ True, if the story is saved in the sender's profile and will be available there after expiration
    , is_visible_only_for_self :: Maybe Bool                                      -- ^ True, if the story is visible only for the current user
    , can_be_forwarded         :: Maybe Bool                                      -- ^ True, if the story can be forwarded as a message. Otherwise, screenshots and saving of the story content must be also forbidden
    , can_be_replied           :: Maybe Bool                                      -- ^ True, if the story can be replied in the chat with the story sender
    , can_get_viewers          :: Maybe Bool                                      -- ^ True, if users viewed the story can be received through getStoryViewers
    , has_expired_viewers      :: Maybe Bool                                      -- ^ True, if users viewed the story can't be received, because the story has expired more than getOption("story_viewers_expiration_delay") seconds ago
    , interaction_info         :: Maybe StoryInteractionInfo.StoryInteractionInfo -- ^ Information about interactions with the story; may be null if the story isn't owned or there were no interactions
    , privacy_settings         :: Maybe StoryPrivacySettings.StoryPrivacySettings -- ^ Privacy rules affecting story visibility; may be approximate for non-owned stories
    , content                  :: Maybe StoryContent.StoryContent                 -- ^ Content of the story
    , caption                  :: Maybe FormattedText.FormattedText               -- ^ Caption of the story
    }
  deriving (Eq)

instance Show Story where
  show Story
    { _id                      = _id_
    , sender_chat_id           = sender_chat_id_
    , date                     = date_
    , is_being_edited          = is_being_edited_
    , is_edited                = is_edited_
    , is_pinned                = is_pinned_
    , is_visible_only_for_self = is_visible_only_for_self_
    , can_be_forwarded         = can_be_forwarded_
    , can_be_replied           = can_be_replied_
    , can_get_viewers          = can_get_viewers_
    , has_expired_viewers      = has_expired_viewers_
    , interaction_info         = interaction_info_
    , privacy_settings         = privacy_settings_
    , content                  = content_
    , caption                  = caption_
    }
      = "Story"
        ++ I.cc
        [ "_id"                      `I.p` _id_
        , "sender_chat_id"           `I.p` sender_chat_id_
        , "date"                     `I.p` date_
        , "is_being_edited"          `I.p` is_being_edited_
        , "is_edited"                `I.p` is_edited_
        , "is_pinned"                `I.p` is_pinned_
        , "is_visible_only_for_self" `I.p` is_visible_only_for_self_
        , "can_be_forwarded"         `I.p` can_be_forwarded_
        , "can_be_replied"           `I.p` can_be_replied_
        , "can_get_viewers"          `I.p` can_get_viewers_
        , "has_expired_viewers"      `I.p` has_expired_viewers_
        , "interaction_info"         `I.p` interaction_info_
        , "privacy_settings"         `I.p` privacy_settings_
        , "content"                  `I.p` content_
        , "caption"                  `I.p` caption_
        ]

instance AT.FromJSON Story where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "story" -> parseStory v
      _       -> mempty
    
    where
      parseStory :: A.Value -> AT.Parser Story
      parseStory = A.withObject "Story" $ \o -> do
        _id_                      <- o A..:?  "id"
        sender_chat_id_           <- o A..:?  "sender_chat_id"
        date_                     <- o A..:?  "date"
        is_being_edited_          <- o A..:?  "is_being_edited"
        is_edited_                <- o A..:?  "is_edited"
        is_pinned_                <- o A..:?  "is_pinned"
        is_visible_only_for_self_ <- o A..:?  "is_visible_only_for_self"
        can_be_forwarded_         <- o A..:?  "can_be_forwarded"
        can_be_replied_           <- o A..:?  "can_be_replied"
        can_get_viewers_          <- o A..:?  "can_get_viewers"
        has_expired_viewers_      <- o A..:?  "has_expired_viewers"
        interaction_info_         <- o A..:?  "interaction_info"
        privacy_settings_         <- o A..:?  "privacy_settings"
        content_                  <- o A..:?  "content"
        caption_                  <- o A..:?  "caption"
        pure $ Story
          { _id                      = _id_
          , sender_chat_id           = sender_chat_id_
          , date                     = date_
          , is_being_edited          = is_being_edited_
          , is_edited                = is_edited_
          , is_pinned                = is_pinned_
          , is_visible_only_for_self = is_visible_only_for_self_
          , can_be_forwarded         = can_be_forwarded_
          , can_be_replied           = can_be_replied_
          , can_get_viewers          = can_get_viewers_
          , has_expired_viewers      = has_expired_viewers_
          , interaction_info         = interaction_info_
          , privacy_settings         = privacy_settings_
          , content                  = content_
          , caption                  = caption_
          }
  parseJSON _ = mempty

