module TD.Data.SearchMessagesFilter
  (SearchMessagesFilter(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Represents a filter for message search results
data SearchMessagesFilter
  = SearchMessagesFilterEmpty -- ^ Returns all found messages, no filter is applied
  | SearchMessagesFilterAnimation -- ^ Returns only animation messages
  | SearchMessagesFilterAudio -- ^ Returns only audio messages
  | SearchMessagesFilterDocument -- ^ Returns only document messages
  | SearchMessagesFilterPhoto -- ^ Returns only photo messages
  | SearchMessagesFilterVideo -- ^ Returns only video messages
  | SearchMessagesFilterVoiceNote -- ^ Returns only voice note messages
  | SearchMessagesFilterPhotoAndVideo -- ^ Returns only photo and video messages
  | SearchMessagesFilterUrl -- ^ Returns only messages containing URLs
  | SearchMessagesFilterChatPhoto -- ^ Returns only messages containing chat photos
  | SearchMessagesFilterVideoNote -- ^ Returns only video note messages
  | SearchMessagesFilterVoiceAndVideoNote -- ^ Returns only voice and video note messages
  | SearchMessagesFilterMention -- ^ Returns only messages with mentions of the current user, or messages that are replies to their messages
  | SearchMessagesFilterUnreadMention -- ^ Returns only messages with unread mentions of the current user, or messages that are replies to their messages. When using this filter the results can't be additionally filtered by a query, a message thread or by the sending user
  | SearchMessagesFilterUnreadReaction -- ^ Returns only messages with unread reactions for the current user. When using this filter the results can't be additionally filtered by a query, a message thread or by the sending user
  | SearchMessagesFilterFailedToSend -- ^ Returns only failed to send messages. This filter can be used only if the message database is used
  | SearchMessagesFilterPinned -- ^ Returns only pinned messages
  deriving (Eq, Show)

instance I.ShortShow SearchMessagesFilter where
  shortShow SearchMessagesFilterEmpty
      = "SearchMessagesFilterEmpty"
  shortShow SearchMessagesFilterAnimation
      = "SearchMessagesFilterAnimation"
  shortShow SearchMessagesFilterAudio
      = "SearchMessagesFilterAudio"
  shortShow SearchMessagesFilterDocument
      = "SearchMessagesFilterDocument"
  shortShow SearchMessagesFilterPhoto
      = "SearchMessagesFilterPhoto"
  shortShow SearchMessagesFilterVideo
      = "SearchMessagesFilterVideo"
  shortShow SearchMessagesFilterVoiceNote
      = "SearchMessagesFilterVoiceNote"
  shortShow SearchMessagesFilterPhotoAndVideo
      = "SearchMessagesFilterPhotoAndVideo"
  shortShow SearchMessagesFilterUrl
      = "SearchMessagesFilterUrl"
  shortShow SearchMessagesFilterChatPhoto
      = "SearchMessagesFilterChatPhoto"
  shortShow SearchMessagesFilterVideoNote
      = "SearchMessagesFilterVideoNote"
  shortShow SearchMessagesFilterVoiceAndVideoNote
      = "SearchMessagesFilterVoiceAndVideoNote"
  shortShow SearchMessagesFilterMention
      = "SearchMessagesFilterMention"
  shortShow SearchMessagesFilterUnreadMention
      = "SearchMessagesFilterUnreadMention"
  shortShow SearchMessagesFilterUnreadReaction
      = "SearchMessagesFilterUnreadReaction"
  shortShow SearchMessagesFilterFailedToSend
      = "SearchMessagesFilterFailedToSend"
  shortShow SearchMessagesFilterPinned
      = "SearchMessagesFilterPinned"

instance AT.FromJSON SearchMessagesFilter where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "searchMessagesFilterEmpty"             -> pure SearchMessagesFilterEmpty
      "searchMessagesFilterAnimation"         -> pure SearchMessagesFilterAnimation
      "searchMessagesFilterAudio"             -> pure SearchMessagesFilterAudio
      "searchMessagesFilterDocument"          -> pure SearchMessagesFilterDocument
      "searchMessagesFilterPhoto"             -> pure SearchMessagesFilterPhoto
      "searchMessagesFilterVideo"             -> pure SearchMessagesFilterVideo
      "searchMessagesFilterVoiceNote"         -> pure SearchMessagesFilterVoiceNote
      "searchMessagesFilterPhotoAndVideo"     -> pure SearchMessagesFilterPhotoAndVideo
      "searchMessagesFilterUrl"               -> pure SearchMessagesFilterUrl
      "searchMessagesFilterChatPhoto"         -> pure SearchMessagesFilterChatPhoto
      "searchMessagesFilterVideoNote"         -> pure SearchMessagesFilterVideoNote
      "searchMessagesFilterVoiceAndVideoNote" -> pure SearchMessagesFilterVoiceAndVideoNote
      "searchMessagesFilterMention"           -> pure SearchMessagesFilterMention
      "searchMessagesFilterUnreadMention"     -> pure SearchMessagesFilterUnreadMention
      "searchMessagesFilterUnreadReaction"    -> pure SearchMessagesFilterUnreadReaction
      "searchMessagesFilterFailedToSend"      -> pure SearchMessagesFilterFailedToSend
      "searchMessagesFilterPinned"            -> pure SearchMessagesFilterPinned
      _                                       -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON SearchMessagesFilter where
  toJSON SearchMessagesFilterEmpty
      = A.object
        [ "@type" A..= AT.String "searchMessagesFilterEmpty"
        ]
  toJSON SearchMessagesFilterAnimation
      = A.object
        [ "@type" A..= AT.String "searchMessagesFilterAnimation"
        ]
  toJSON SearchMessagesFilterAudio
      = A.object
        [ "@type" A..= AT.String "searchMessagesFilterAudio"
        ]
  toJSON SearchMessagesFilterDocument
      = A.object
        [ "@type" A..= AT.String "searchMessagesFilterDocument"
        ]
  toJSON SearchMessagesFilterPhoto
      = A.object
        [ "@type" A..= AT.String "searchMessagesFilterPhoto"
        ]
  toJSON SearchMessagesFilterVideo
      = A.object
        [ "@type" A..= AT.String "searchMessagesFilterVideo"
        ]
  toJSON SearchMessagesFilterVoiceNote
      = A.object
        [ "@type" A..= AT.String "searchMessagesFilterVoiceNote"
        ]
  toJSON SearchMessagesFilterPhotoAndVideo
      = A.object
        [ "@type" A..= AT.String "searchMessagesFilterPhotoAndVideo"
        ]
  toJSON SearchMessagesFilterUrl
      = A.object
        [ "@type" A..= AT.String "searchMessagesFilterUrl"
        ]
  toJSON SearchMessagesFilterChatPhoto
      = A.object
        [ "@type" A..= AT.String "searchMessagesFilterChatPhoto"
        ]
  toJSON SearchMessagesFilterVideoNote
      = A.object
        [ "@type" A..= AT.String "searchMessagesFilterVideoNote"
        ]
  toJSON SearchMessagesFilterVoiceAndVideoNote
      = A.object
        [ "@type" A..= AT.String "searchMessagesFilterVoiceAndVideoNote"
        ]
  toJSON SearchMessagesFilterMention
      = A.object
        [ "@type" A..= AT.String "searchMessagesFilterMention"
        ]
  toJSON SearchMessagesFilterUnreadMention
      = A.object
        [ "@type" A..= AT.String "searchMessagesFilterUnreadMention"
        ]
  toJSON SearchMessagesFilterUnreadReaction
      = A.object
        [ "@type" A..= AT.String "searchMessagesFilterUnreadReaction"
        ]
  toJSON SearchMessagesFilterFailedToSend
      = A.object
        [ "@type" A..= AT.String "searchMessagesFilterFailedToSend"
        ]
  toJSON SearchMessagesFilterPinned
      = A.object
        [ "@type" A..= AT.String "searchMessagesFilterPinned"
        ]

