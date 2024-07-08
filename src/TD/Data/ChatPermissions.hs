module TD.Data.ChatPermissions
  ( ChatPermissions(..)    
  , defaultChatPermissions 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ChatPermissions
  = ChatPermissions -- ^ Describes actions that a user is allowed to take in a chat
    { can_send_basic_messages :: Maybe Bool -- ^ True, if the user can send text messages, contacts, giveaways, giveaway winners, invoices, locations, and venues
    , can_send_audios         :: Maybe Bool -- ^ True, if the user can send music files
    , can_send_documents      :: Maybe Bool -- ^ True, if the user can send documents
    , can_send_photos         :: Maybe Bool -- ^ True, if the user can send photos
    , can_send_videos         :: Maybe Bool -- ^ True, if the user can send videos
    , can_send_video_notes    :: Maybe Bool -- ^ True, if the user can send video notes
    , can_send_voice_notes    :: Maybe Bool -- ^ True, if the user can send voice notes
    , can_send_polls          :: Maybe Bool -- ^ True, if the user can send polls
    , can_send_other_messages :: Maybe Bool -- ^ True, if the user can send animations, games, stickers, and dice and use inline bots
    , can_add_link_previews   :: Maybe Bool -- ^ True, if the user may add a link preview to their messages
    , can_change_info         :: Maybe Bool -- ^ True, if the user can change the chat title, photo, and other settings
    , can_invite_users        :: Maybe Bool -- ^ True, if the user can invite new users to the chat
    , can_pin_messages        :: Maybe Bool -- ^ True, if the user can pin messages
    , can_create_topics       :: Maybe Bool -- ^ True, if the user can create topics
    }
  deriving (Eq, Show)

instance I.ShortShow ChatPermissions where
  shortShow ChatPermissions
    { can_send_basic_messages = can_send_basic_messages_
    , can_send_audios         = can_send_audios_
    , can_send_documents      = can_send_documents_
    , can_send_photos         = can_send_photos_
    , can_send_videos         = can_send_videos_
    , can_send_video_notes    = can_send_video_notes_
    , can_send_voice_notes    = can_send_voice_notes_
    , can_send_polls          = can_send_polls_
    , can_send_other_messages = can_send_other_messages_
    , can_add_link_previews   = can_add_link_previews_
    , can_change_info         = can_change_info_
    , can_invite_users        = can_invite_users_
    , can_pin_messages        = can_pin_messages_
    , can_create_topics       = can_create_topics_
    }
      = "ChatPermissions"
        ++ I.cc
        [ "can_send_basic_messages" `I.p` can_send_basic_messages_
        , "can_send_audios"         `I.p` can_send_audios_
        , "can_send_documents"      `I.p` can_send_documents_
        , "can_send_photos"         `I.p` can_send_photos_
        , "can_send_videos"         `I.p` can_send_videos_
        , "can_send_video_notes"    `I.p` can_send_video_notes_
        , "can_send_voice_notes"    `I.p` can_send_voice_notes_
        , "can_send_polls"          `I.p` can_send_polls_
        , "can_send_other_messages" `I.p` can_send_other_messages_
        , "can_add_link_previews"   `I.p` can_add_link_previews_
        , "can_change_info"         `I.p` can_change_info_
        , "can_invite_users"        `I.p` can_invite_users_
        , "can_pin_messages"        `I.p` can_pin_messages_
        , "can_create_topics"       `I.p` can_create_topics_
        ]

instance AT.FromJSON ChatPermissions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatPermissions" -> parseChatPermissions v
      _                 -> mempty
    
    where
      parseChatPermissions :: A.Value -> AT.Parser ChatPermissions
      parseChatPermissions = A.withObject "ChatPermissions" $ \o -> do
        can_send_basic_messages_ <- o A..:?  "can_send_basic_messages"
        can_send_audios_         <- o A..:?  "can_send_audios"
        can_send_documents_      <- o A..:?  "can_send_documents"
        can_send_photos_         <- o A..:?  "can_send_photos"
        can_send_videos_         <- o A..:?  "can_send_videos"
        can_send_video_notes_    <- o A..:?  "can_send_video_notes"
        can_send_voice_notes_    <- o A..:?  "can_send_voice_notes"
        can_send_polls_          <- o A..:?  "can_send_polls"
        can_send_other_messages_ <- o A..:?  "can_send_other_messages"
        can_add_link_previews_   <- o A..:?  "can_add_link_previews"
        can_change_info_         <- o A..:?  "can_change_info"
        can_invite_users_        <- o A..:?  "can_invite_users"
        can_pin_messages_        <- o A..:?  "can_pin_messages"
        can_create_topics_       <- o A..:?  "can_create_topics"
        pure $ ChatPermissions
          { can_send_basic_messages = can_send_basic_messages_
          , can_send_audios         = can_send_audios_
          , can_send_documents      = can_send_documents_
          , can_send_photos         = can_send_photos_
          , can_send_videos         = can_send_videos_
          , can_send_video_notes    = can_send_video_notes_
          , can_send_voice_notes    = can_send_voice_notes_
          , can_send_polls          = can_send_polls_
          , can_send_other_messages = can_send_other_messages_
          , can_add_link_previews   = can_add_link_previews_
          , can_change_info         = can_change_info_
          , can_invite_users        = can_invite_users_
          , can_pin_messages        = can_pin_messages_
          , can_create_topics       = can_create_topics_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatPermissions where
  toJSON ChatPermissions
    { can_send_basic_messages = can_send_basic_messages_
    , can_send_audios         = can_send_audios_
    , can_send_documents      = can_send_documents_
    , can_send_photos         = can_send_photos_
    , can_send_videos         = can_send_videos_
    , can_send_video_notes    = can_send_video_notes_
    , can_send_voice_notes    = can_send_voice_notes_
    , can_send_polls          = can_send_polls_
    , can_send_other_messages = can_send_other_messages_
    , can_add_link_previews   = can_add_link_previews_
    , can_change_info         = can_change_info_
    , can_invite_users        = can_invite_users_
    , can_pin_messages        = can_pin_messages_
    , can_create_topics       = can_create_topics_
    }
      = A.object
        [ "@type"                   A..= AT.String "chatPermissions"
        , "can_send_basic_messages" A..= can_send_basic_messages_
        , "can_send_audios"         A..= can_send_audios_
        , "can_send_documents"      A..= can_send_documents_
        , "can_send_photos"         A..= can_send_photos_
        , "can_send_videos"         A..= can_send_videos_
        , "can_send_video_notes"    A..= can_send_video_notes_
        , "can_send_voice_notes"    A..= can_send_voice_notes_
        , "can_send_polls"          A..= can_send_polls_
        , "can_send_other_messages" A..= can_send_other_messages_
        , "can_add_link_previews"   A..= can_add_link_previews_
        , "can_change_info"         A..= can_change_info_
        , "can_invite_users"        A..= can_invite_users_
        , "can_pin_messages"        A..= can_pin_messages_
        , "can_create_topics"       A..= can_create_topics_
        ]

defaultChatPermissions :: ChatPermissions
defaultChatPermissions =
  ChatPermissions
    { can_send_basic_messages = Nothing
    , can_send_audios         = Nothing
    , can_send_documents      = Nothing
    , can_send_photos         = Nothing
    , can_send_videos         = Nothing
    , can_send_video_notes    = Nothing
    , can_send_voice_notes    = Nothing
    , can_send_polls          = Nothing
    , can_send_other_messages = Nothing
    , can_add_link_previews   = Nothing
    , can_change_info         = Nothing
    , can_invite_users        = Nothing
    , can_pin_messages        = Nothing
    , can_create_topics       = Nothing
    }

