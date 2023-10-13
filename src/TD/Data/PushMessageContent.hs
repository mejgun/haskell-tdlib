module TD.Data.PushMessageContent
  ( PushMessageContent(..)                     
  , defaultPushMessageContentHidden            
  , defaultPushMessageContentAnimation         
  , defaultPushMessageContentAudio             
  , defaultPushMessageContentContact           
  , defaultPushMessageContentDocument          
  , defaultPushMessageContentGame              
  , defaultPushMessageContentGameScore         
  , defaultPushMessageContentInvoice           
  , defaultPushMessageContentLocation          
  , defaultPushMessageContentPhoto             
  , defaultPushMessageContentPoll              
  , defaultPushMessageContentSticker           
  , defaultPushMessageContentStory             
  , defaultPushMessageContentText              
  , defaultPushMessageContentVideo             
  , defaultPushMessageContentVideoNote         
  , defaultPushMessageContentVoiceNote         
  , defaultPushMessageContentChatAddMembers    
  , defaultPushMessageContentChatChangeTitle   
  , defaultPushMessageContentChatSetBackground 
  , defaultPushMessageContentChatSetTheme      
  , defaultPushMessageContentChatDeleteMember  
  , defaultPushMessageContentRecurringPayment  
  , defaultPushMessageContentMessageForwards   
  , defaultPushMessageContentMediaAlbum        
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Animation as Animation
import qualified Data.Text as T
import qualified TD.Data.Audio as Audio
import qualified TD.Data.Document as Document
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.Video as Video
import qualified TD.Data.VideoNote as VideoNote
import qualified TD.Data.VoiceNote as VoiceNote

-- | Contains content of a push message notification
data PushMessageContent
  = PushMessageContentHidden -- ^ A general message with hidden content
    { is_pinned :: Maybe Bool -- ^ True, if the message is a pinned message with the specified content
    }
  | PushMessageContentAnimation -- ^ An animation message (GIF-style).
    { animation :: Maybe Animation.Animation -- ^ Message content; may be null
    , caption   :: Maybe T.Text              -- ^ Animation caption
    , is_pinned :: Maybe Bool                -- ^ True, if the message is a pinned message with the specified content
    }
  | PushMessageContentAudio -- ^ An audio message
    { audio     :: Maybe Audio.Audio -- ^ Message content; may be null
    , is_pinned :: Maybe Bool        -- ^ True, if the message is a pinned message with the specified content
    }
  | PushMessageContentContact -- ^ A message with a user contact
    { name      :: Maybe T.Text -- ^ Contact's name
    , is_pinned :: Maybe Bool   -- ^ True, if the message is a pinned message with the specified content
    }
  | PushMessageContentContactRegistered -- ^ A contact has registered with Telegram
  | PushMessageContentDocument -- ^ A document message (a general file)
    { document  :: Maybe Document.Document -- ^ Message content; may be null
    , is_pinned :: Maybe Bool              -- ^ True, if the message is a pinned message with the specified content
    }
  | PushMessageContentGame -- ^ A message with a game
    { title     :: Maybe T.Text -- ^ Game title, empty for pinned game message
    , is_pinned :: Maybe Bool   -- ^ True, if the message is a pinned message with the specified content
    }
  | PushMessageContentGameScore -- ^ A new high score was achieved in a game
    { title     :: Maybe T.Text -- ^ Game title, empty for pinned message
    , score     :: Maybe Int    -- ^ New score, 0 for pinned message
    , is_pinned :: Maybe Bool   -- ^ True, if the message is a pinned message with the specified content
    }
  | PushMessageContentInvoice -- ^ A message with an invoice from a bot
    { price     :: Maybe T.Text -- ^ Product price
    , is_pinned :: Maybe Bool   -- ^ True, if the message is a pinned message with the specified content
    }
  | PushMessageContentLocation -- ^ A message with a location
    { is_live   :: Maybe Bool -- ^ True, if the location is live
    , is_pinned :: Maybe Bool -- ^ True, if the message is a pinned message with the specified content
    }
  | PushMessageContentPhoto -- ^ A photo message
    { photo     :: Maybe Photo.Photo -- ^ Message content; may be null
    , caption   :: Maybe T.Text      -- ^ Photo caption
    , is_secret :: Maybe Bool        -- ^ True, if the photo is secret
    , is_pinned :: Maybe Bool        -- ^ True, if the message is a pinned message with the specified content
    }
  | PushMessageContentPoll -- ^ A message with a poll
    { question   :: Maybe T.Text -- ^ Poll question
    , is_regular :: Maybe Bool   -- ^ True, if the poll is regular and not in quiz mode
    , is_pinned  :: Maybe Bool   -- ^ True, if the message is a pinned message with the specified content
    }
  | PushMessageContentScreenshotTaken -- ^ A screenshot of a message in the chat has been taken
  | PushMessageContentSticker -- ^ A message with a sticker
    { sticker   :: Maybe Sticker.Sticker -- ^ Message content; may be null
    , emoji     :: Maybe T.Text          -- ^ Emoji corresponding to the sticker; may be empty
    , is_pinned :: Maybe Bool            -- ^ True, if the message is a pinned message with the specified content
    }
  | PushMessageContentStory -- ^ A message with a story
    { is_pinned :: Maybe Bool -- ^ True, if the message is a pinned message with the specified content
    }
  | PushMessageContentText -- ^ A text message
    { text      :: Maybe T.Text -- ^ Message text
    , is_pinned :: Maybe Bool   -- ^ True, if the message is a pinned message with the specified content
    }
  | PushMessageContentVideo -- ^ A video message
    { video     :: Maybe Video.Video -- ^ Message content; may be null
    , caption   :: Maybe T.Text      -- ^ Video caption
    , is_secret :: Maybe Bool        -- ^ True, if the video is secret
    , is_pinned :: Maybe Bool        -- ^ True, if the message is a pinned message with the specified content
    }
  | PushMessageContentVideoNote -- ^ A video note message
    { video_note :: Maybe VideoNote.VideoNote -- ^ Message content; may be null
    , is_pinned  :: Maybe Bool                -- ^ True, if the message is a pinned message with the specified content
    }
  | PushMessageContentVoiceNote -- ^ A voice note message
    { voice_note :: Maybe VoiceNote.VoiceNote -- ^ Message content; may be null
    , is_pinned  :: Maybe Bool                -- ^ True, if the message is a pinned message with the specified content
    }
  | PushMessageContentBasicGroupChatCreate -- ^ A newly created basic group
  | PushMessageContentChatAddMembers -- ^ New chat members were invited to a group
    { member_name     :: Maybe T.Text -- ^ Name of the added member
    , is_current_user :: Maybe Bool   -- ^ True, if the current user was added to the group
    , is_returned     :: Maybe Bool   -- ^ True, if the user has returned to the group themselves
    }
  | PushMessageContentChatChangePhoto -- ^ A chat photo was edited
  | PushMessageContentChatChangeTitle -- ^ A chat title was edited
    { title :: Maybe T.Text -- ^ New chat title
    }
  | PushMessageContentChatSetBackground -- ^ A chat background was edited
    { is_same :: Maybe Bool -- ^ True, if the set background is the same as the background of the current user
    }
  | PushMessageContentChatSetTheme -- ^ A chat theme was edited
    { theme_name :: Maybe T.Text -- ^ If non-empty, name of a new theme, set for the chat. Otherwise, the chat theme was reset to the default one
    }
  | PushMessageContentChatDeleteMember -- ^ A chat member was deleted
    { member_name     :: Maybe T.Text -- ^ Name of the deleted member
    , is_current_user :: Maybe Bool   -- ^ True, if the current user was deleted from the group
    , is_left         :: Maybe Bool   -- ^ True, if the user has left the group themselves
    }
  | PushMessageContentChatJoinByLink -- ^ A new member joined the chat via an invite link
  | PushMessageContentChatJoinByRequest -- ^ A new member was accepted to the chat by an administrator
  | PushMessageContentRecurringPayment -- ^ A new recurring payment was made by the current user
    { amount :: Maybe T.Text -- ^ The paid amount
    }
  | PushMessageContentSuggestProfilePhoto -- ^ A profile photo was suggested to the user
  | PushMessageContentMessageForwards -- ^ A forwarded messages
    { total_count :: Maybe Int -- ^ Number of forwarded messages
    }
  | PushMessageContentMediaAlbum -- ^ A media album
    { total_count   :: Maybe Int  -- ^ Number of messages in the album
    , has_photos    :: Maybe Bool -- ^ True, if the album has at least one photo
    , has_videos    :: Maybe Bool -- ^ True, if the album has at least one video file
    , has_audios    :: Maybe Bool -- ^ True, if the album has at least one audio file
    , has_documents :: Maybe Bool -- ^ True, if the album has at least one document
    }
  deriving (Eq)

instance Show PushMessageContent where
  show PushMessageContentHidden
    { is_pinned = is_pinned_
    }
      = "PushMessageContentHidden"
        ++ I.cc
        [ "is_pinned" `I.p` is_pinned_
        ]
  show PushMessageContentAnimation
    { animation = animation_
    , caption   = caption_
    , is_pinned = is_pinned_
    }
      = "PushMessageContentAnimation"
        ++ I.cc
        [ "animation" `I.p` animation_
        , "caption"   `I.p` caption_
        , "is_pinned" `I.p` is_pinned_
        ]
  show PushMessageContentAudio
    { audio     = audio_
    , is_pinned = is_pinned_
    }
      = "PushMessageContentAudio"
        ++ I.cc
        [ "audio"     `I.p` audio_
        , "is_pinned" `I.p` is_pinned_
        ]
  show PushMessageContentContact
    { name      = name_
    , is_pinned = is_pinned_
    }
      = "PushMessageContentContact"
        ++ I.cc
        [ "name"      `I.p` name_
        , "is_pinned" `I.p` is_pinned_
        ]
  show PushMessageContentContactRegistered
      = "PushMessageContentContactRegistered"
  show PushMessageContentDocument
    { document  = document_
    , is_pinned = is_pinned_
    }
      = "PushMessageContentDocument"
        ++ I.cc
        [ "document"  `I.p` document_
        , "is_pinned" `I.p` is_pinned_
        ]
  show PushMessageContentGame
    { title     = title_
    , is_pinned = is_pinned_
    }
      = "PushMessageContentGame"
        ++ I.cc
        [ "title"     `I.p` title_
        , "is_pinned" `I.p` is_pinned_
        ]
  show PushMessageContentGameScore
    { title     = title_
    , score     = score_
    , is_pinned = is_pinned_
    }
      = "PushMessageContentGameScore"
        ++ I.cc
        [ "title"     `I.p` title_
        , "score"     `I.p` score_
        , "is_pinned" `I.p` is_pinned_
        ]
  show PushMessageContentInvoice
    { price     = price_
    , is_pinned = is_pinned_
    }
      = "PushMessageContentInvoice"
        ++ I.cc
        [ "price"     `I.p` price_
        , "is_pinned" `I.p` is_pinned_
        ]
  show PushMessageContentLocation
    { is_live   = is_live_
    , is_pinned = is_pinned_
    }
      = "PushMessageContentLocation"
        ++ I.cc
        [ "is_live"   `I.p` is_live_
        , "is_pinned" `I.p` is_pinned_
        ]
  show PushMessageContentPhoto
    { photo     = photo_
    , caption   = caption_
    , is_secret = is_secret_
    , is_pinned = is_pinned_
    }
      = "PushMessageContentPhoto"
        ++ I.cc
        [ "photo"     `I.p` photo_
        , "caption"   `I.p` caption_
        , "is_secret" `I.p` is_secret_
        , "is_pinned" `I.p` is_pinned_
        ]
  show PushMessageContentPoll
    { question   = question_
    , is_regular = is_regular_
    , is_pinned  = is_pinned_
    }
      = "PushMessageContentPoll"
        ++ I.cc
        [ "question"   `I.p` question_
        , "is_regular" `I.p` is_regular_
        , "is_pinned"  `I.p` is_pinned_
        ]
  show PushMessageContentScreenshotTaken
      = "PushMessageContentScreenshotTaken"
  show PushMessageContentSticker
    { sticker   = sticker_
    , emoji     = emoji_
    , is_pinned = is_pinned_
    }
      = "PushMessageContentSticker"
        ++ I.cc
        [ "sticker"   `I.p` sticker_
        , "emoji"     `I.p` emoji_
        , "is_pinned" `I.p` is_pinned_
        ]
  show PushMessageContentStory
    { is_pinned = is_pinned_
    }
      = "PushMessageContentStory"
        ++ I.cc
        [ "is_pinned" `I.p` is_pinned_
        ]
  show PushMessageContentText
    { text      = text_
    , is_pinned = is_pinned_
    }
      = "PushMessageContentText"
        ++ I.cc
        [ "text"      `I.p` text_
        , "is_pinned" `I.p` is_pinned_
        ]
  show PushMessageContentVideo
    { video     = video_
    , caption   = caption_
    , is_secret = is_secret_
    , is_pinned = is_pinned_
    }
      = "PushMessageContentVideo"
        ++ I.cc
        [ "video"     `I.p` video_
        , "caption"   `I.p` caption_
        , "is_secret" `I.p` is_secret_
        , "is_pinned" `I.p` is_pinned_
        ]
  show PushMessageContentVideoNote
    { video_note = video_note_
    , is_pinned  = is_pinned_
    }
      = "PushMessageContentVideoNote"
        ++ I.cc
        [ "video_note" `I.p` video_note_
        , "is_pinned"  `I.p` is_pinned_
        ]
  show PushMessageContentVoiceNote
    { voice_note = voice_note_
    , is_pinned  = is_pinned_
    }
      = "PushMessageContentVoiceNote"
        ++ I.cc
        [ "voice_note" `I.p` voice_note_
        , "is_pinned"  `I.p` is_pinned_
        ]
  show PushMessageContentBasicGroupChatCreate
      = "PushMessageContentBasicGroupChatCreate"
  show PushMessageContentChatAddMembers
    { member_name     = member_name_
    , is_current_user = is_current_user_
    , is_returned     = is_returned_
    }
      = "PushMessageContentChatAddMembers"
        ++ I.cc
        [ "member_name"     `I.p` member_name_
        , "is_current_user" `I.p` is_current_user_
        , "is_returned"     `I.p` is_returned_
        ]
  show PushMessageContentChatChangePhoto
      = "PushMessageContentChatChangePhoto"
  show PushMessageContentChatChangeTitle
    { title = title_
    }
      = "PushMessageContentChatChangeTitle"
        ++ I.cc
        [ "title" `I.p` title_
        ]
  show PushMessageContentChatSetBackground
    { is_same = is_same_
    }
      = "PushMessageContentChatSetBackground"
        ++ I.cc
        [ "is_same" `I.p` is_same_
        ]
  show PushMessageContentChatSetTheme
    { theme_name = theme_name_
    }
      = "PushMessageContentChatSetTheme"
        ++ I.cc
        [ "theme_name" `I.p` theme_name_
        ]
  show PushMessageContentChatDeleteMember
    { member_name     = member_name_
    , is_current_user = is_current_user_
    , is_left         = is_left_
    }
      = "PushMessageContentChatDeleteMember"
        ++ I.cc
        [ "member_name"     `I.p` member_name_
        , "is_current_user" `I.p` is_current_user_
        , "is_left"         `I.p` is_left_
        ]
  show PushMessageContentChatJoinByLink
      = "PushMessageContentChatJoinByLink"
  show PushMessageContentChatJoinByRequest
      = "PushMessageContentChatJoinByRequest"
  show PushMessageContentRecurringPayment
    { amount = amount_
    }
      = "PushMessageContentRecurringPayment"
        ++ I.cc
        [ "amount" `I.p` amount_
        ]
  show PushMessageContentSuggestProfilePhoto
      = "PushMessageContentSuggestProfilePhoto"
  show PushMessageContentMessageForwards
    { total_count = total_count_
    }
      = "PushMessageContentMessageForwards"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        ]
  show PushMessageContentMediaAlbum
    { total_count   = total_count_
    , has_photos    = has_photos_
    , has_videos    = has_videos_
    , has_audios    = has_audios_
    , has_documents = has_documents_
    }
      = "PushMessageContentMediaAlbum"
        ++ I.cc
        [ "total_count"   `I.p` total_count_
        , "has_photos"    `I.p` has_photos_
        , "has_videos"    `I.p` has_videos_
        , "has_audios"    `I.p` has_audios_
        , "has_documents" `I.p` has_documents_
        ]

instance AT.FromJSON PushMessageContent where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "pushMessageContentHidden"               -> parsePushMessageContentHidden v
      "pushMessageContentAnimation"            -> parsePushMessageContentAnimation v
      "pushMessageContentAudio"                -> parsePushMessageContentAudio v
      "pushMessageContentContact"              -> parsePushMessageContentContact v
      "pushMessageContentContactRegistered"    -> pure PushMessageContentContactRegistered
      "pushMessageContentDocument"             -> parsePushMessageContentDocument v
      "pushMessageContentGame"                 -> parsePushMessageContentGame v
      "pushMessageContentGameScore"            -> parsePushMessageContentGameScore v
      "pushMessageContentInvoice"              -> parsePushMessageContentInvoice v
      "pushMessageContentLocation"             -> parsePushMessageContentLocation v
      "pushMessageContentPhoto"                -> parsePushMessageContentPhoto v
      "pushMessageContentPoll"                 -> parsePushMessageContentPoll v
      "pushMessageContentScreenshotTaken"      -> pure PushMessageContentScreenshotTaken
      "pushMessageContentSticker"              -> parsePushMessageContentSticker v
      "pushMessageContentStory"                -> parsePushMessageContentStory v
      "pushMessageContentText"                 -> parsePushMessageContentText v
      "pushMessageContentVideo"                -> parsePushMessageContentVideo v
      "pushMessageContentVideoNote"            -> parsePushMessageContentVideoNote v
      "pushMessageContentVoiceNote"            -> parsePushMessageContentVoiceNote v
      "pushMessageContentBasicGroupChatCreate" -> pure PushMessageContentBasicGroupChatCreate
      "pushMessageContentChatAddMembers"       -> parsePushMessageContentChatAddMembers v
      "pushMessageContentChatChangePhoto"      -> pure PushMessageContentChatChangePhoto
      "pushMessageContentChatChangeTitle"      -> parsePushMessageContentChatChangeTitle v
      "pushMessageContentChatSetBackground"    -> parsePushMessageContentChatSetBackground v
      "pushMessageContentChatSetTheme"         -> parsePushMessageContentChatSetTheme v
      "pushMessageContentChatDeleteMember"     -> parsePushMessageContentChatDeleteMember v
      "pushMessageContentChatJoinByLink"       -> pure PushMessageContentChatJoinByLink
      "pushMessageContentChatJoinByRequest"    -> pure PushMessageContentChatJoinByRequest
      "pushMessageContentRecurringPayment"     -> parsePushMessageContentRecurringPayment v
      "pushMessageContentSuggestProfilePhoto"  -> pure PushMessageContentSuggestProfilePhoto
      "pushMessageContentMessageForwards"      -> parsePushMessageContentMessageForwards v
      "pushMessageContentMediaAlbum"           -> parsePushMessageContentMediaAlbum v
      _                                        -> mempty
    
    where
      parsePushMessageContentHidden :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentHidden = A.withObject "PushMessageContentHidden" $ \o -> do
        is_pinned_ <- o A..:?  "is_pinned"
        pure $ PushMessageContentHidden
          { is_pinned = is_pinned_
          }
      parsePushMessageContentAnimation :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentAnimation = A.withObject "PushMessageContentAnimation" $ \o -> do
        animation_ <- o A..:?  "animation"
        caption_   <- o A..:?  "caption"
        is_pinned_ <- o A..:?  "is_pinned"
        pure $ PushMessageContentAnimation
          { animation = animation_
          , caption   = caption_
          , is_pinned = is_pinned_
          }
      parsePushMessageContentAudio :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentAudio = A.withObject "PushMessageContentAudio" $ \o -> do
        audio_     <- o A..:?  "audio"
        is_pinned_ <- o A..:?  "is_pinned"
        pure $ PushMessageContentAudio
          { audio     = audio_
          , is_pinned = is_pinned_
          }
      parsePushMessageContentContact :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentContact = A.withObject "PushMessageContentContact" $ \o -> do
        name_      <- o A..:?  "name"
        is_pinned_ <- o A..:?  "is_pinned"
        pure $ PushMessageContentContact
          { name      = name_
          , is_pinned = is_pinned_
          }
      parsePushMessageContentDocument :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentDocument = A.withObject "PushMessageContentDocument" $ \o -> do
        document_  <- o A..:?  "document"
        is_pinned_ <- o A..:?  "is_pinned"
        pure $ PushMessageContentDocument
          { document  = document_
          , is_pinned = is_pinned_
          }
      parsePushMessageContentGame :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentGame = A.withObject "PushMessageContentGame" $ \o -> do
        title_     <- o A..:?  "title"
        is_pinned_ <- o A..:?  "is_pinned"
        pure $ PushMessageContentGame
          { title     = title_
          , is_pinned = is_pinned_
          }
      parsePushMessageContentGameScore :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentGameScore = A.withObject "PushMessageContentGameScore" $ \o -> do
        title_     <- o A..:?  "title"
        score_     <- o A..:?  "score"
        is_pinned_ <- o A..:?  "is_pinned"
        pure $ PushMessageContentGameScore
          { title     = title_
          , score     = score_
          , is_pinned = is_pinned_
          }
      parsePushMessageContentInvoice :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentInvoice = A.withObject "PushMessageContentInvoice" $ \o -> do
        price_     <- o A..:?  "price"
        is_pinned_ <- o A..:?  "is_pinned"
        pure $ PushMessageContentInvoice
          { price     = price_
          , is_pinned = is_pinned_
          }
      parsePushMessageContentLocation :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentLocation = A.withObject "PushMessageContentLocation" $ \o -> do
        is_live_   <- o A..:?  "is_live"
        is_pinned_ <- o A..:?  "is_pinned"
        pure $ PushMessageContentLocation
          { is_live   = is_live_
          , is_pinned = is_pinned_
          }
      parsePushMessageContentPhoto :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentPhoto = A.withObject "PushMessageContentPhoto" $ \o -> do
        photo_     <- o A..:?  "photo"
        caption_   <- o A..:?  "caption"
        is_secret_ <- o A..:?  "is_secret"
        is_pinned_ <- o A..:?  "is_pinned"
        pure $ PushMessageContentPhoto
          { photo     = photo_
          , caption   = caption_
          , is_secret = is_secret_
          , is_pinned = is_pinned_
          }
      parsePushMessageContentPoll :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentPoll = A.withObject "PushMessageContentPoll" $ \o -> do
        question_   <- o A..:?  "question"
        is_regular_ <- o A..:?  "is_regular"
        is_pinned_  <- o A..:?  "is_pinned"
        pure $ PushMessageContentPoll
          { question   = question_
          , is_regular = is_regular_
          , is_pinned  = is_pinned_
          }
      parsePushMessageContentSticker :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentSticker = A.withObject "PushMessageContentSticker" $ \o -> do
        sticker_   <- o A..:?  "sticker"
        emoji_     <- o A..:?  "emoji"
        is_pinned_ <- o A..:?  "is_pinned"
        pure $ PushMessageContentSticker
          { sticker   = sticker_
          , emoji     = emoji_
          , is_pinned = is_pinned_
          }
      parsePushMessageContentStory :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentStory = A.withObject "PushMessageContentStory" $ \o -> do
        is_pinned_ <- o A..:?  "is_pinned"
        pure $ PushMessageContentStory
          { is_pinned = is_pinned_
          }
      parsePushMessageContentText :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentText = A.withObject "PushMessageContentText" $ \o -> do
        text_      <- o A..:?  "text"
        is_pinned_ <- o A..:?  "is_pinned"
        pure $ PushMessageContentText
          { text      = text_
          , is_pinned = is_pinned_
          }
      parsePushMessageContentVideo :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentVideo = A.withObject "PushMessageContentVideo" $ \o -> do
        video_     <- o A..:?  "video"
        caption_   <- o A..:?  "caption"
        is_secret_ <- o A..:?  "is_secret"
        is_pinned_ <- o A..:?  "is_pinned"
        pure $ PushMessageContentVideo
          { video     = video_
          , caption   = caption_
          , is_secret = is_secret_
          , is_pinned = is_pinned_
          }
      parsePushMessageContentVideoNote :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentVideoNote = A.withObject "PushMessageContentVideoNote" $ \o -> do
        video_note_ <- o A..:?  "video_note"
        is_pinned_  <- o A..:?  "is_pinned"
        pure $ PushMessageContentVideoNote
          { video_note = video_note_
          , is_pinned  = is_pinned_
          }
      parsePushMessageContentVoiceNote :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentVoiceNote = A.withObject "PushMessageContentVoiceNote" $ \o -> do
        voice_note_ <- o A..:?  "voice_note"
        is_pinned_  <- o A..:?  "is_pinned"
        pure $ PushMessageContentVoiceNote
          { voice_note = voice_note_
          , is_pinned  = is_pinned_
          }
      parsePushMessageContentChatAddMembers :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentChatAddMembers = A.withObject "PushMessageContentChatAddMembers" $ \o -> do
        member_name_     <- o A..:?  "member_name"
        is_current_user_ <- o A..:?  "is_current_user"
        is_returned_     <- o A..:?  "is_returned"
        pure $ PushMessageContentChatAddMembers
          { member_name     = member_name_
          , is_current_user = is_current_user_
          , is_returned     = is_returned_
          }
      parsePushMessageContentChatChangeTitle :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentChatChangeTitle = A.withObject "PushMessageContentChatChangeTitle" $ \o -> do
        title_ <- o A..:?  "title"
        pure $ PushMessageContentChatChangeTitle
          { title = title_
          }
      parsePushMessageContentChatSetBackground :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentChatSetBackground = A.withObject "PushMessageContentChatSetBackground" $ \o -> do
        is_same_ <- o A..:?  "is_same"
        pure $ PushMessageContentChatSetBackground
          { is_same = is_same_
          }
      parsePushMessageContentChatSetTheme :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentChatSetTheme = A.withObject "PushMessageContentChatSetTheme" $ \o -> do
        theme_name_ <- o A..:?  "theme_name"
        pure $ PushMessageContentChatSetTheme
          { theme_name = theme_name_
          }
      parsePushMessageContentChatDeleteMember :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentChatDeleteMember = A.withObject "PushMessageContentChatDeleteMember" $ \o -> do
        member_name_     <- o A..:?  "member_name"
        is_current_user_ <- o A..:?  "is_current_user"
        is_left_         <- o A..:?  "is_left"
        pure $ PushMessageContentChatDeleteMember
          { member_name     = member_name_
          , is_current_user = is_current_user_
          , is_left         = is_left_
          }
      parsePushMessageContentRecurringPayment :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentRecurringPayment = A.withObject "PushMessageContentRecurringPayment" $ \o -> do
        amount_ <- o A..:?  "amount"
        pure $ PushMessageContentRecurringPayment
          { amount = amount_
          }
      parsePushMessageContentMessageForwards :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentMessageForwards = A.withObject "PushMessageContentMessageForwards" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        pure $ PushMessageContentMessageForwards
          { total_count = total_count_
          }
      parsePushMessageContentMediaAlbum :: A.Value -> AT.Parser PushMessageContent
      parsePushMessageContentMediaAlbum = A.withObject "PushMessageContentMediaAlbum" $ \o -> do
        total_count_   <- o A..:?  "total_count"
        has_photos_    <- o A..:?  "has_photos"
        has_videos_    <- o A..:?  "has_videos"
        has_audios_    <- o A..:?  "has_audios"
        has_documents_ <- o A..:?  "has_documents"
        pure $ PushMessageContentMediaAlbum
          { total_count   = total_count_
          , has_photos    = has_photos_
          , has_videos    = has_videos_
          , has_audios    = has_audios_
          , has_documents = has_documents_
          }
  parseJSON _ = mempty

instance AT.ToJSON PushMessageContent where
  toJSON PushMessageContentHidden
    { is_pinned = is_pinned_
    }
      = A.object
        [ "@type"     A..= AT.String "pushMessageContentHidden"
        , "is_pinned" A..= is_pinned_
        ]
  toJSON PushMessageContentAnimation
    { animation = animation_
    , caption   = caption_
    , is_pinned = is_pinned_
    }
      = A.object
        [ "@type"     A..= AT.String "pushMessageContentAnimation"
        , "animation" A..= animation_
        , "caption"   A..= caption_
        , "is_pinned" A..= is_pinned_
        ]
  toJSON PushMessageContentAudio
    { audio     = audio_
    , is_pinned = is_pinned_
    }
      = A.object
        [ "@type"     A..= AT.String "pushMessageContentAudio"
        , "audio"     A..= audio_
        , "is_pinned" A..= is_pinned_
        ]
  toJSON PushMessageContentContact
    { name      = name_
    , is_pinned = is_pinned_
    }
      = A.object
        [ "@type"     A..= AT.String "pushMessageContentContact"
        , "name"      A..= name_
        , "is_pinned" A..= is_pinned_
        ]
  toJSON PushMessageContentContactRegistered
      = A.object
        [ "@type" A..= AT.String "pushMessageContentContactRegistered"
        ]
  toJSON PushMessageContentDocument
    { document  = document_
    , is_pinned = is_pinned_
    }
      = A.object
        [ "@type"     A..= AT.String "pushMessageContentDocument"
        , "document"  A..= document_
        , "is_pinned" A..= is_pinned_
        ]
  toJSON PushMessageContentGame
    { title     = title_
    , is_pinned = is_pinned_
    }
      = A.object
        [ "@type"     A..= AT.String "pushMessageContentGame"
        , "title"     A..= title_
        , "is_pinned" A..= is_pinned_
        ]
  toJSON PushMessageContentGameScore
    { title     = title_
    , score     = score_
    , is_pinned = is_pinned_
    }
      = A.object
        [ "@type"     A..= AT.String "pushMessageContentGameScore"
        , "title"     A..= title_
        , "score"     A..= score_
        , "is_pinned" A..= is_pinned_
        ]
  toJSON PushMessageContentInvoice
    { price     = price_
    , is_pinned = is_pinned_
    }
      = A.object
        [ "@type"     A..= AT.String "pushMessageContentInvoice"
        , "price"     A..= price_
        , "is_pinned" A..= is_pinned_
        ]
  toJSON PushMessageContentLocation
    { is_live   = is_live_
    , is_pinned = is_pinned_
    }
      = A.object
        [ "@type"     A..= AT.String "pushMessageContentLocation"
        , "is_live"   A..= is_live_
        , "is_pinned" A..= is_pinned_
        ]
  toJSON PushMessageContentPhoto
    { photo     = photo_
    , caption   = caption_
    , is_secret = is_secret_
    , is_pinned = is_pinned_
    }
      = A.object
        [ "@type"     A..= AT.String "pushMessageContentPhoto"
        , "photo"     A..= photo_
        , "caption"   A..= caption_
        , "is_secret" A..= is_secret_
        , "is_pinned" A..= is_pinned_
        ]
  toJSON PushMessageContentPoll
    { question   = question_
    , is_regular = is_regular_
    , is_pinned  = is_pinned_
    }
      = A.object
        [ "@type"      A..= AT.String "pushMessageContentPoll"
        , "question"   A..= question_
        , "is_regular" A..= is_regular_
        , "is_pinned"  A..= is_pinned_
        ]
  toJSON PushMessageContentScreenshotTaken
      = A.object
        [ "@type" A..= AT.String "pushMessageContentScreenshotTaken"
        ]
  toJSON PushMessageContentSticker
    { sticker   = sticker_
    , emoji     = emoji_
    , is_pinned = is_pinned_
    }
      = A.object
        [ "@type"     A..= AT.String "pushMessageContentSticker"
        , "sticker"   A..= sticker_
        , "emoji"     A..= emoji_
        , "is_pinned" A..= is_pinned_
        ]
  toJSON PushMessageContentStory
    { is_pinned = is_pinned_
    }
      = A.object
        [ "@type"     A..= AT.String "pushMessageContentStory"
        , "is_pinned" A..= is_pinned_
        ]
  toJSON PushMessageContentText
    { text      = text_
    , is_pinned = is_pinned_
    }
      = A.object
        [ "@type"     A..= AT.String "pushMessageContentText"
        , "text"      A..= text_
        , "is_pinned" A..= is_pinned_
        ]
  toJSON PushMessageContentVideo
    { video     = video_
    , caption   = caption_
    , is_secret = is_secret_
    , is_pinned = is_pinned_
    }
      = A.object
        [ "@type"     A..= AT.String "pushMessageContentVideo"
        , "video"     A..= video_
        , "caption"   A..= caption_
        , "is_secret" A..= is_secret_
        , "is_pinned" A..= is_pinned_
        ]
  toJSON PushMessageContentVideoNote
    { video_note = video_note_
    , is_pinned  = is_pinned_
    }
      = A.object
        [ "@type"      A..= AT.String "pushMessageContentVideoNote"
        , "video_note" A..= video_note_
        , "is_pinned"  A..= is_pinned_
        ]
  toJSON PushMessageContentVoiceNote
    { voice_note = voice_note_
    , is_pinned  = is_pinned_
    }
      = A.object
        [ "@type"      A..= AT.String "pushMessageContentVoiceNote"
        , "voice_note" A..= voice_note_
        , "is_pinned"  A..= is_pinned_
        ]
  toJSON PushMessageContentBasicGroupChatCreate
      = A.object
        [ "@type" A..= AT.String "pushMessageContentBasicGroupChatCreate"
        ]
  toJSON PushMessageContentChatAddMembers
    { member_name     = member_name_
    , is_current_user = is_current_user_
    , is_returned     = is_returned_
    }
      = A.object
        [ "@type"           A..= AT.String "pushMessageContentChatAddMembers"
        , "member_name"     A..= member_name_
        , "is_current_user" A..= is_current_user_
        , "is_returned"     A..= is_returned_
        ]
  toJSON PushMessageContentChatChangePhoto
      = A.object
        [ "@type" A..= AT.String "pushMessageContentChatChangePhoto"
        ]
  toJSON PushMessageContentChatChangeTitle
    { title = title_
    }
      = A.object
        [ "@type" A..= AT.String "pushMessageContentChatChangeTitle"
        , "title" A..= title_
        ]
  toJSON PushMessageContentChatSetBackground
    { is_same = is_same_
    }
      = A.object
        [ "@type"   A..= AT.String "pushMessageContentChatSetBackground"
        , "is_same" A..= is_same_
        ]
  toJSON PushMessageContentChatSetTheme
    { theme_name = theme_name_
    }
      = A.object
        [ "@type"      A..= AT.String "pushMessageContentChatSetTheme"
        , "theme_name" A..= theme_name_
        ]
  toJSON PushMessageContentChatDeleteMember
    { member_name     = member_name_
    , is_current_user = is_current_user_
    , is_left         = is_left_
    }
      = A.object
        [ "@type"           A..= AT.String "pushMessageContentChatDeleteMember"
        , "member_name"     A..= member_name_
        , "is_current_user" A..= is_current_user_
        , "is_left"         A..= is_left_
        ]
  toJSON PushMessageContentChatJoinByLink
      = A.object
        [ "@type" A..= AT.String "pushMessageContentChatJoinByLink"
        ]
  toJSON PushMessageContentChatJoinByRequest
      = A.object
        [ "@type" A..= AT.String "pushMessageContentChatJoinByRequest"
        ]
  toJSON PushMessageContentRecurringPayment
    { amount = amount_
    }
      = A.object
        [ "@type"  A..= AT.String "pushMessageContentRecurringPayment"
        , "amount" A..= amount_
        ]
  toJSON PushMessageContentSuggestProfilePhoto
      = A.object
        [ "@type" A..= AT.String "pushMessageContentSuggestProfilePhoto"
        ]
  toJSON PushMessageContentMessageForwards
    { total_count = total_count_
    }
      = A.object
        [ "@type"       A..= AT.String "pushMessageContentMessageForwards"
        , "total_count" A..= total_count_
        ]
  toJSON PushMessageContentMediaAlbum
    { total_count   = total_count_
    , has_photos    = has_photos_
    , has_videos    = has_videos_
    , has_audios    = has_audios_
    , has_documents = has_documents_
    }
      = A.object
        [ "@type"         A..= AT.String "pushMessageContentMediaAlbum"
        , "total_count"   A..= total_count_
        , "has_photos"    A..= has_photos_
        , "has_videos"    A..= has_videos_
        , "has_audios"    A..= has_audios_
        , "has_documents" A..= has_documents_
        ]

defaultPushMessageContentHidden :: PushMessageContent
defaultPushMessageContentHidden =
  PushMessageContentHidden
    { is_pinned = Nothing
    }

defaultPushMessageContentAnimation :: PushMessageContent
defaultPushMessageContentAnimation =
  PushMessageContentAnimation
    { animation = Nothing
    , caption   = Nothing
    , is_pinned = Nothing
    }

defaultPushMessageContentAudio :: PushMessageContent
defaultPushMessageContentAudio =
  PushMessageContentAudio
    { audio     = Nothing
    , is_pinned = Nothing
    }

defaultPushMessageContentContact :: PushMessageContent
defaultPushMessageContentContact =
  PushMessageContentContact
    { name      = Nothing
    , is_pinned = Nothing
    }

defaultPushMessageContentDocument :: PushMessageContent
defaultPushMessageContentDocument =
  PushMessageContentDocument
    { document  = Nothing
    , is_pinned = Nothing
    }

defaultPushMessageContentGame :: PushMessageContent
defaultPushMessageContentGame =
  PushMessageContentGame
    { title     = Nothing
    , is_pinned = Nothing
    }

defaultPushMessageContentGameScore :: PushMessageContent
defaultPushMessageContentGameScore =
  PushMessageContentGameScore
    { title     = Nothing
    , score     = Nothing
    , is_pinned = Nothing
    }

defaultPushMessageContentInvoice :: PushMessageContent
defaultPushMessageContentInvoice =
  PushMessageContentInvoice
    { price     = Nothing
    , is_pinned = Nothing
    }

defaultPushMessageContentLocation :: PushMessageContent
defaultPushMessageContentLocation =
  PushMessageContentLocation
    { is_live   = Nothing
    , is_pinned = Nothing
    }

defaultPushMessageContentPhoto :: PushMessageContent
defaultPushMessageContentPhoto =
  PushMessageContentPhoto
    { photo     = Nothing
    , caption   = Nothing
    , is_secret = Nothing
    , is_pinned = Nothing
    }

defaultPushMessageContentPoll :: PushMessageContent
defaultPushMessageContentPoll =
  PushMessageContentPoll
    { question   = Nothing
    , is_regular = Nothing
    , is_pinned  = Nothing
    }

defaultPushMessageContentSticker :: PushMessageContent
defaultPushMessageContentSticker =
  PushMessageContentSticker
    { sticker   = Nothing
    , emoji     = Nothing
    , is_pinned = Nothing
    }

defaultPushMessageContentStory :: PushMessageContent
defaultPushMessageContentStory =
  PushMessageContentStory
    { is_pinned = Nothing
    }

defaultPushMessageContentText :: PushMessageContent
defaultPushMessageContentText =
  PushMessageContentText
    { text      = Nothing
    , is_pinned = Nothing
    }

defaultPushMessageContentVideo :: PushMessageContent
defaultPushMessageContentVideo =
  PushMessageContentVideo
    { video     = Nothing
    , caption   = Nothing
    , is_secret = Nothing
    , is_pinned = Nothing
    }

defaultPushMessageContentVideoNote :: PushMessageContent
defaultPushMessageContentVideoNote =
  PushMessageContentVideoNote
    { video_note = Nothing
    , is_pinned  = Nothing
    }

defaultPushMessageContentVoiceNote :: PushMessageContent
defaultPushMessageContentVoiceNote =
  PushMessageContentVoiceNote
    { voice_note = Nothing
    , is_pinned  = Nothing
    }

defaultPushMessageContentChatAddMembers :: PushMessageContent
defaultPushMessageContentChatAddMembers =
  PushMessageContentChatAddMembers
    { member_name     = Nothing
    , is_current_user = Nothing
    , is_returned     = Nothing
    }

defaultPushMessageContentChatChangeTitle :: PushMessageContent
defaultPushMessageContentChatChangeTitle =
  PushMessageContentChatChangeTitle
    { title = Nothing
    }

defaultPushMessageContentChatSetBackground :: PushMessageContent
defaultPushMessageContentChatSetBackground =
  PushMessageContentChatSetBackground
    { is_same = Nothing
    }

defaultPushMessageContentChatSetTheme :: PushMessageContent
defaultPushMessageContentChatSetTheme =
  PushMessageContentChatSetTheme
    { theme_name = Nothing
    }

defaultPushMessageContentChatDeleteMember :: PushMessageContent
defaultPushMessageContentChatDeleteMember =
  PushMessageContentChatDeleteMember
    { member_name     = Nothing
    , is_current_user = Nothing
    , is_left         = Nothing
    }

defaultPushMessageContentRecurringPayment :: PushMessageContent
defaultPushMessageContentRecurringPayment =
  PushMessageContentRecurringPayment
    { amount = Nothing
    }

defaultPushMessageContentMessageForwards :: PushMessageContent
defaultPushMessageContentMessageForwards =
  PushMessageContentMessageForwards
    { total_count = Nothing
    }

defaultPushMessageContentMediaAlbum :: PushMessageContent
defaultPushMessageContentMediaAlbum =
  PushMessageContentMediaAlbum
    { total_count   = Nothing
    , has_photos    = Nothing
    , has_videos    = Nothing
    , has_audios    = Nothing
    , has_documents = Nothing
    }

