module TD.Data.InputInlineQueryResult
  (InputInlineQueryResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.InputMessageContent as InputMessageContent
import qualified TD.Data.Contact as Contact
import qualified TD.Data.Location as Location
import qualified TD.Data.Venue as Venue

-- | Represents a single result of an inline query; for bots only
data InputInlineQueryResult
  = InputInlineQueryResultAnimation -- ^ Represents a link to an animated GIF or an animated (i.e., without sound) H.264/MPEG-4 AVC video
    { _id                   :: Maybe T.Text                                  -- ^ Unique identifier of the query result
    , title                 :: Maybe T.Text                                  -- ^ Title of the query result
    , thumbnail_url         :: Maybe T.Text                                  -- ^ URL of the result thumbnail (JPEG, GIF, or MPEG4), if it exists
    , thumbnail_mime_type   :: Maybe T.Text                                  -- ^ MIME type of the video thumbnail. If non-empty, must be one of "image/jpeg", "image/gif" and "video/mp4"
    , video_url             :: Maybe T.Text                                  -- ^ The URL of the video file (file size must not exceed 1MB)
    , video_mime_type       :: Maybe T.Text                                  -- ^ MIME type of the video file. Must be one of "image/gif" and "video/mp4"
    , video_duration        :: Maybe Int                                     -- ^ Duration of the video, in seconds
    , video_width           :: Maybe Int                                     -- ^ Width of the video
    , video_height          :: Maybe Int                                     -- ^ Height of the video
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAnimation, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
    }
  | InputInlineQueryResultArticle -- ^ Represents a link to an article or web page
    { _id                   :: Maybe T.Text                                  -- ^ Unique identifier of the query result
    , url                   :: Maybe T.Text                                  -- ^ URL of the result, if it exists
    , hide_url              :: Maybe Bool                                    -- ^ True, if the URL must be not shown
    , title                 :: Maybe T.Text                                  -- ^ Title of the result
    , description           :: Maybe T.Text                                  -- ^ A short description of the result
    , thumbnail_url         :: Maybe T.Text                                  -- ^ URL of the result thumbnail, if it exists
    , thumbnail_width       :: Maybe Int                                     -- ^ Thumbnail width, if known
    , thumbnail_height      :: Maybe Int                                     -- ^ Thumbnail height, if known
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
    }
  | InputInlineQueryResultAudio -- ^ Represents a link to an MP3 audio file
    { _id                   :: Maybe T.Text                                  -- ^ Unique identifier of the query result
    , title                 :: Maybe T.Text                                  -- ^ Title of the audio file
    , performer             :: Maybe T.Text                                  -- ^ Performer of the audio file
    , audio_url             :: Maybe T.Text                                  -- ^ The URL of the audio file
    , audio_duration        :: Maybe Int                                     -- ^ Audio file duration, in seconds
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAudio, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
    }
  | InputInlineQueryResultContact -- ^ Represents a user contact
    { _id                   :: Maybe T.Text                                  -- ^ Unique identifier of the query result
    , contact               :: Maybe Contact.Contact                         -- ^ User contact
    , thumbnail_url         :: Maybe T.Text                                  -- ^ URL of the result thumbnail, if it exists
    , thumbnail_width       :: Maybe Int                                     -- ^ Thumbnail width, if known
    , thumbnail_height      :: Maybe Int                                     -- ^ Thumbnail height, if known
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
    }
  | InputInlineQueryResultDocument -- ^ Represents a link to a file
    { _id                   :: Maybe T.Text                                  -- ^ Unique identifier of the query result
    , title                 :: Maybe T.Text                                  -- ^ Title of the resulting file
    , description           :: Maybe T.Text                                  -- ^ Short description of the result, if known
    , document_url          :: Maybe T.Text                                  -- ^ URL of the file
    , mime_type             :: Maybe T.Text                                  -- ^ MIME type of the file content; only "application/pdf" and "application/zip" are currently allowed
    , thumbnail_url         :: Maybe T.Text                                  -- ^ The URL of the file thumbnail, if it exists
    , thumbnail_width       :: Maybe Int                                     -- ^ Width of the thumbnail
    , thumbnail_height      :: Maybe Int                                     -- ^ Height of the thumbnail
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageDocument, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
    }
  | InputInlineQueryResultGame -- ^ Represents a game
    { _id             :: Maybe T.Text                  -- ^ Unique identifier of the query result
    , game_short_name :: Maybe T.Text                  -- ^ Short name of the game
    , reply_markup    :: Maybe ReplyMarkup.ReplyMarkup -- ^ The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
    }
  | InputInlineQueryResultLocation -- ^ Represents a point on the map
    { _id                   :: Maybe T.Text                                  -- ^ Unique identifier of the query result
    , location              :: Maybe Location.Location                       -- ^ Location result
    , live_period           :: Maybe Int                                     -- ^ Amount of time relative to the message sent time until the location can be updated, in seconds
    , title                 :: Maybe T.Text                                  -- ^ Title of the result
    , thumbnail_url         :: Maybe T.Text                                  -- ^ URL of the result thumbnail, if it exists
    , thumbnail_width       :: Maybe Int                                     -- ^ Thumbnail width, if known
    , thumbnail_height      :: Maybe Int                                     -- ^ Thumbnail height, if known
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
    }
  | InputInlineQueryResultPhoto -- ^ Represents link to a JPEG image
    { _id                   :: Maybe T.Text                                  -- ^ Unique identifier of the query result
    , title                 :: Maybe T.Text                                  -- ^ Title of the result, if known
    , description           :: Maybe T.Text                                  -- ^ A short description of the result, if known
    , thumbnail_url         :: Maybe T.Text                                  -- ^ URL of the photo thumbnail, if it exists
    , photo_url             :: Maybe T.Text                                  -- ^ The URL of the JPEG photo (photo size must not exceed 5MB)
    , photo_width           :: Maybe Int                                     -- ^ Width of the photo
    , photo_height          :: Maybe Int                                     -- ^ Height of the photo
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessagePhoto, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
    }
  | InputInlineQueryResultSticker -- ^ Represents a link to a WEBP, TGS, or WEBM sticker
    { _id                   :: Maybe T.Text                                  -- ^ Unique identifier of the query result
    , thumbnail_url         :: Maybe T.Text                                  -- ^ URL of the sticker thumbnail, if it exists
    , sticker_url           :: Maybe T.Text                                  -- ^ The URL of the WEBP, TGS, or WEBM sticker (sticker file size must not exceed 5MB)
    , sticker_width         :: Maybe Int                                     -- ^ Width of the sticker
    , sticker_height        :: Maybe Int                                     -- ^ Height of the sticker
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageSticker, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
    }
  | InputInlineQueryResultVenue -- ^ Represents information about a venue
    { _id                   :: Maybe T.Text                                  -- ^ Unique identifier of the query result
    , venue                 :: Maybe Venue.Venue                             -- ^ Venue result
    , thumbnail_url         :: Maybe T.Text                                  -- ^ URL of the result thumbnail, if it exists
    , thumbnail_width       :: Maybe Int                                     -- ^ Thumbnail width, if known
    , thumbnail_height      :: Maybe Int                                     -- ^ Thumbnail height, if known
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
    }
  | InputInlineQueryResultVideo -- ^ Represents a link to a page containing an embedded video player or a video file
    { _id                   :: Maybe T.Text                                  -- ^ Unique identifier of the query result
    , title                 :: Maybe T.Text                                  -- ^ Title of the result
    , description           :: Maybe T.Text                                  -- ^ A short description of the result, if known
    , thumbnail_url         :: Maybe T.Text                                  -- ^ The URL of the video thumbnail (JPEG), if it exists
    , video_url             :: Maybe T.Text                                  -- ^ URL of the embedded video player or video file
    , mime_type             :: Maybe T.Text                                  -- ^ MIME type of the content of the video URL, only "text/html" or "video/mp4" are currently supported
    , video_width           :: Maybe Int                                     -- ^ Width of the video
    , video_height          :: Maybe Int                                     -- ^ Height of the video
    , video_duration        :: Maybe Int                                     -- ^ Video duration, in seconds
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageVideo, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
    }
  | InputInlineQueryResultVoiceNote -- ^ Represents a link to an opus-encoded audio file within an OGG container, single channel audio
    { _id                   :: Maybe T.Text                                  -- ^ Unique identifier of the query result
    , title                 :: Maybe T.Text                                  -- ^ Title of the voice note
    , voice_note_url        :: Maybe T.Text                                  -- ^ The URL of the voice note file
    , voice_note_duration   :: Maybe Int                                     -- ^ Duration of the voice note, in seconds
    , reply_markup          :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ The message reply markup; pass null if none. Must be of type replyMarkupInlineKeyboard or null
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageVoiceNote, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
    }
  deriving (Eq, Show)

instance I.ShortShow InputInlineQueryResult where
  shortShow InputInlineQueryResultAnimation
    { _id                   = _id_
    , title                 = title_
    , thumbnail_url         = thumbnail_url_
    , thumbnail_mime_type   = thumbnail_mime_type_
    , video_url             = video_url_
    , video_mime_type       = video_mime_type_
    , video_duration        = video_duration_
    , video_width           = video_width_
    , video_height          = video_height_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = "InputInlineQueryResultAnimation"
        ++ I.cc
        [ "_id"                   `I.p` _id_
        , "title"                 `I.p` title_
        , "thumbnail_url"         `I.p` thumbnail_url_
        , "thumbnail_mime_type"   `I.p` thumbnail_mime_type_
        , "video_url"             `I.p` video_url_
        , "video_mime_type"       `I.p` video_mime_type_
        , "video_duration"        `I.p` video_duration_
        , "video_width"           `I.p` video_width_
        , "video_height"          `I.p` video_height_
        , "reply_markup"          `I.p` reply_markup_
        , "input_message_content" `I.p` input_message_content_
        ]
  shortShow InputInlineQueryResultArticle
    { _id                   = _id_
    , url                   = url_
    , hide_url              = hide_url_
    , title                 = title_
    , description           = description_
    , thumbnail_url         = thumbnail_url_
    , thumbnail_width       = thumbnail_width_
    , thumbnail_height      = thumbnail_height_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = "InputInlineQueryResultArticle"
        ++ I.cc
        [ "_id"                   `I.p` _id_
        , "url"                   `I.p` url_
        , "hide_url"              `I.p` hide_url_
        , "title"                 `I.p` title_
        , "description"           `I.p` description_
        , "thumbnail_url"         `I.p` thumbnail_url_
        , "thumbnail_width"       `I.p` thumbnail_width_
        , "thumbnail_height"      `I.p` thumbnail_height_
        , "reply_markup"          `I.p` reply_markup_
        , "input_message_content" `I.p` input_message_content_
        ]
  shortShow InputInlineQueryResultAudio
    { _id                   = _id_
    , title                 = title_
    , performer             = performer_
    , audio_url             = audio_url_
    , audio_duration        = audio_duration_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = "InputInlineQueryResultAudio"
        ++ I.cc
        [ "_id"                   `I.p` _id_
        , "title"                 `I.p` title_
        , "performer"             `I.p` performer_
        , "audio_url"             `I.p` audio_url_
        , "audio_duration"        `I.p` audio_duration_
        , "reply_markup"          `I.p` reply_markup_
        , "input_message_content" `I.p` input_message_content_
        ]
  shortShow InputInlineQueryResultContact
    { _id                   = _id_
    , contact               = contact_
    , thumbnail_url         = thumbnail_url_
    , thumbnail_width       = thumbnail_width_
    , thumbnail_height      = thumbnail_height_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = "InputInlineQueryResultContact"
        ++ I.cc
        [ "_id"                   `I.p` _id_
        , "contact"               `I.p` contact_
        , "thumbnail_url"         `I.p` thumbnail_url_
        , "thumbnail_width"       `I.p` thumbnail_width_
        , "thumbnail_height"      `I.p` thumbnail_height_
        , "reply_markup"          `I.p` reply_markup_
        , "input_message_content" `I.p` input_message_content_
        ]
  shortShow InputInlineQueryResultDocument
    { _id                   = _id_
    , title                 = title_
    , description           = description_
    , document_url          = document_url_
    , mime_type             = mime_type_
    , thumbnail_url         = thumbnail_url_
    , thumbnail_width       = thumbnail_width_
    , thumbnail_height      = thumbnail_height_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = "InputInlineQueryResultDocument"
        ++ I.cc
        [ "_id"                   `I.p` _id_
        , "title"                 `I.p` title_
        , "description"           `I.p` description_
        , "document_url"          `I.p` document_url_
        , "mime_type"             `I.p` mime_type_
        , "thumbnail_url"         `I.p` thumbnail_url_
        , "thumbnail_width"       `I.p` thumbnail_width_
        , "thumbnail_height"      `I.p` thumbnail_height_
        , "reply_markup"          `I.p` reply_markup_
        , "input_message_content" `I.p` input_message_content_
        ]
  shortShow InputInlineQueryResultGame
    { _id             = _id_
    , game_short_name = game_short_name_
    , reply_markup    = reply_markup_
    }
      = "InputInlineQueryResultGame"
        ++ I.cc
        [ "_id"             `I.p` _id_
        , "game_short_name" `I.p` game_short_name_
        , "reply_markup"    `I.p` reply_markup_
        ]
  shortShow InputInlineQueryResultLocation
    { _id                   = _id_
    , location              = location_
    , live_period           = live_period_
    , title                 = title_
    , thumbnail_url         = thumbnail_url_
    , thumbnail_width       = thumbnail_width_
    , thumbnail_height      = thumbnail_height_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = "InputInlineQueryResultLocation"
        ++ I.cc
        [ "_id"                   `I.p` _id_
        , "location"              `I.p` location_
        , "live_period"           `I.p` live_period_
        , "title"                 `I.p` title_
        , "thumbnail_url"         `I.p` thumbnail_url_
        , "thumbnail_width"       `I.p` thumbnail_width_
        , "thumbnail_height"      `I.p` thumbnail_height_
        , "reply_markup"          `I.p` reply_markup_
        , "input_message_content" `I.p` input_message_content_
        ]
  shortShow InputInlineQueryResultPhoto
    { _id                   = _id_
    , title                 = title_
    , description           = description_
    , thumbnail_url         = thumbnail_url_
    , photo_url             = photo_url_
    , photo_width           = photo_width_
    , photo_height          = photo_height_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = "InputInlineQueryResultPhoto"
        ++ I.cc
        [ "_id"                   `I.p` _id_
        , "title"                 `I.p` title_
        , "description"           `I.p` description_
        , "thumbnail_url"         `I.p` thumbnail_url_
        , "photo_url"             `I.p` photo_url_
        , "photo_width"           `I.p` photo_width_
        , "photo_height"          `I.p` photo_height_
        , "reply_markup"          `I.p` reply_markup_
        , "input_message_content" `I.p` input_message_content_
        ]
  shortShow InputInlineQueryResultSticker
    { _id                   = _id_
    , thumbnail_url         = thumbnail_url_
    , sticker_url           = sticker_url_
    , sticker_width         = sticker_width_
    , sticker_height        = sticker_height_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = "InputInlineQueryResultSticker"
        ++ I.cc
        [ "_id"                   `I.p` _id_
        , "thumbnail_url"         `I.p` thumbnail_url_
        , "sticker_url"           `I.p` sticker_url_
        , "sticker_width"         `I.p` sticker_width_
        , "sticker_height"        `I.p` sticker_height_
        , "reply_markup"          `I.p` reply_markup_
        , "input_message_content" `I.p` input_message_content_
        ]
  shortShow InputInlineQueryResultVenue
    { _id                   = _id_
    , venue                 = venue_
    , thumbnail_url         = thumbnail_url_
    , thumbnail_width       = thumbnail_width_
    , thumbnail_height      = thumbnail_height_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = "InputInlineQueryResultVenue"
        ++ I.cc
        [ "_id"                   `I.p` _id_
        , "venue"                 `I.p` venue_
        , "thumbnail_url"         `I.p` thumbnail_url_
        , "thumbnail_width"       `I.p` thumbnail_width_
        , "thumbnail_height"      `I.p` thumbnail_height_
        , "reply_markup"          `I.p` reply_markup_
        , "input_message_content" `I.p` input_message_content_
        ]
  shortShow InputInlineQueryResultVideo
    { _id                   = _id_
    , title                 = title_
    , description           = description_
    , thumbnail_url         = thumbnail_url_
    , video_url             = video_url_
    , mime_type             = mime_type_
    , video_width           = video_width_
    , video_height          = video_height_
    , video_duration        = video_duration_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = "InputInlineQueryResultVideo"
        ++ I.cc
        [ "_id"                   `I.p` _id_
        , "title"                 `I.p` title_
        , "description"           `I.p` description_
        , "thumbnail_url"         `I.p` thumbnail_url_
        , "video_url"             `I.p` video_url_
        , "mime_type"             `I.p` mime_type_
        , "video_width"           `I.p` video_width_
        , "video_height"          `I.p` video_height_
        , "video_duration"        `I.p` video_duration_
        , "reply_markup"          `I.p` reply_markup_
        , "input_message_content" `I.p` input_message_content_
        ]
  shortShow InputInlineQueryResultVoiceNote
    { _id                   = _id_
    , title                 = title_
    , voice_note_url        = voice_note_url_
    , voice_note_duration   = voice_note_duration_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = "InputInlineQueryResultVoiceNote"
        ++ I.cc
        [ "_id"                   `I.p` _id_
        , "title"                 `I.p` title_
        , "voice_note_url"        `I.p` voice_note_url_
        , "voice_note_duration"   `I.p` voice_note_duration_
        , "reply_markup"          `I.p` reply_markup_
        , "input_message_content" `I.p` input_message_content_
        ]

instance AT.FromJSON InputInlineQueryResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputInlineQueryResultAnimation" -> parseInputInlineQueryResultAnimation v
      "inputInlineQueryResultArticle"   -> parseInputInlineQueryResultArticle v
      "inputInlineQueryResultAudio"     -> parseInputInlineQueryResultAudio v
      "inputInlineQueryResultContact"   -> parseInputInlineQueryResultContact v
      "inputInlineQueryResultDocument"  -> parseInputInlineQueryResultDocument v
      "inputInlineQueryResultGame"      -> parseInputInlineQueryResultGame v
      "inputInlineQueryResultLocation"  -> parseInputInlineQueryResultLocation v
      "inputInlineQueryResultPhoto"     -> parseInputInlineQueryResultPhoto v
      "inputInlineQueryResultSticker"   -> parseInputInlineQueryResultSticker v
      "inputInlineQueryResultVenue"     -> parseInputInlineQueryResultVenue v
      "inputInlineQueryResultVideo"     -> parseInputInlineQueryResultVideo v
      "inputInlineQueryResultVoiceNote" -> parseInputInlineQueryResultVoiceNote v
      _                                 -> mempty
    
    where
      parseInputInlineQueryResultAnimation :: A.Value -> AT.Parser InputInlineQueryResult
      parseInputInlineQueryResultAnimation = A.withObject "InputInlineQueryResultAnimation" $ \o -> do
        _id_                   <- o A..:?  "id"
        title_                 <- o A..:?  "title"
        thumbnail_url_         <- o A..:?  "thumbnail_url"
        thumbnail_mime_type_   <- o A..:?  "thumbnail_mime_type"
        video_url_             <- o A..:?  "video_url"
        video_mime_type_       <- o A..:?  "video_mime_type"
        video_duration_        <- o A..:?  "video_duration"
        video_width_           <- o A..:?  "video_width"
        video_height_          <- o A..:?  "video_height"
        reply_markup_          <- o A..:?  "reply_markup"
        input_message_content_ <- o A..:?  "input_message_content"
        pure $ InputInlineQueryResultAnimation
          { _id                   = _id_
          , title                 = title_
          , thumbnail_url         = thumbnail_url_
          , thumbnail_mime_type   = thumbnail_mime_type_
          , video_url             = video_url_
          , video_mime_type       = video_mime_type_
          , video_duration        = video_duration_
          , video_width           = video_width_
          , video_height          = video_height_
          , reply_markup          = reply_markup_
          , input_message_content = input_message_content_
          }
      parseInputInlineQueryResultArticle :: A.Value -> AT.Parser InputInlineQueryResult
      parseInputInlineQueryResultArticle = A.withObject "InputInlineQueryResultArticle" $ \o -> do
        _id_                   <- o A..:?  "id"
        url_                   <- o A..:?  "url"
        hide_url_              <- o A..:?  "hide_url"
        title_                 <- o A..:?  "title"
        description_           <- o A..:?  "description"
        thumbnail_url_         <- o A..:?  "thumbnail_url"
        thumbnail_width_       <- o A..:?  "thumbnail_width"
        thumbnail_height_      <- o A..:?  "thumbnail_height"
        reply_markup_          <- o A..:?  "reply_markup"
        input_message_content_ <- o A..:?  "input_message_content"
        pure $ InputInlineQueryResultArticle
          { _id                   = _id_
          , url                   = url_
          , hide_url              = hide_url_
          , title                 = title_
          , description           = description_
          , thumbnail_url         = thumbnail_url_
          , thumbnail_width       = thumbnail_width_
          , thumbnail_height      = thumbnail_height_
          , reply_markup          = reply_markup_
          , input_message_content = input_message_content_
          }
      parseInputInlineQueryResultAudio :: A.Value -> AT.Parser InputInlineQueryResult
      parseInputInlineQueryResultAudio = A.withObject "InputInlineQueryResultAudio" $ \o -> do
        _id_                   <- o A..:?  "id"
        title_                 <- o A..:?  "title"
        performer_             <- o A..:?  "performer"
        audio_url_             <- o A..:?  "audio_url"
        audio_duration_        <- o A..:?  "audio_duration"
        reply_markup_          <- o A..:?  "reply_markup"
        input_message_content_ <- o A..:?  "input_message_content"
        pure $ InputInlineQueryResultAudio
          { _id                   = _id_
          , title                 = title_
          , performer             = performer_
          , audio_url             = audio_url_
          , audio_duration        = audio_duration_
          , reply_markup          = reply_markup_
          , input_message_content = input_message_content_
          }
      parseInputInlineQueryResultContact :: A.Value -> AT.Parser InputInlineQueryResult
      parseInputInlineQueryResultContact = A.withObject "InputInlineQueryResultContact" $ \o -> do
        _id_                   <- o A..:?  "id"
        contact_               <- o A..:?  "contact"
        thumbnail_url_         <- o A..:?  "thumbnail_url"
        thumbnail_width_       <- o A..:?  "thumbnail_width"
        thumbnail_height_      <- o A..:?  "thumbnail_height"
        reply_markup_          <- o A..:?  "reply_markup"
        input_message_content_ <- o A..:?  "input_message_content"
        pure $ InputInlineQueryResultContact
          { _id                   = _id_
          , contact               = contact_
          , thumbnail_url         = thumbnail_url_
          , thumbnail_width       = thumbnail_width_
          , thumbnail_height      = thumbnail_height_
          , reply_markup          = reply_markup_
          , input_message_content = input_message_content_
          }
      parseInputInlineQueryResultDocument :: A.Value -> AT.Parser InputInlineQueryResult
      parseInputInlineQueryResultDocument = A.withObject "InputInlineQueryResultDocument" $ \o -> do
        _id_                   <- o A..:?  "id"
        title_                 <- o A..:?  "title"
        description_           <- o A..:?  "description"
        document_url_          <- o A..:?  "document_url"
        mime_type_             <- o A..:?  "mime_type"
        thumbnail_url_         <- o A..:?  "thumbnail_url"
        thumbnail_width_       <- o A..:?  "thumbnail_width"
        thumbnail_height_      <- o A..:?  "thumbnail_height"
        reply_markup_          <- o A..:?  "reply_markup"
        input_message_content_ <- o A..:?  "input_message_content"
        pure $ InputInlineQueryResultDocument
          { _id                   = _id_
          , title                 = title_
          , description           = description_
          , document_url          = document_url_
          , mime_type             = mime_type_
          , thumbnail_url         = thumbnail_url_
          , thumbnail_width       = thumbnail_width_
          , thumbnail_height      = thumbnail_height_
          , reply_markup          = reply_markup_
          , input_message_content = input_message_content_
          }
      parseInputInlineQueryResultGame :: A.Value -> AT.Parser InputInlineQueryResult
      parseInputInlineQueryResultGame = A.withObject "InputInlineQueryResultGame" $ \o -> do
        _id_             <- o A..:?  "id"
        game_short_name_ <- o A..:?  "game_short_name"
        reply_markup_    <- o A..:?  "reply_markup"
        pure $ InputInlineQueryResultGame
          { _id             = _id_
          , game_short_name = game_short_name_
          , reply_markup    = reply_markup_
          }
      parseInputInlineQueryResultLocation :: A.Value -> AT.Parser InputInlineQueryResult
      parseInputInlineQueryResultLocation = A.withObject "InputInlineQueryResultLocation" $ \o -> do
        _id_                   <- o A..:?  "id"
        location_              <- o A..:?  "location"
        live_period_           <- o A..:?  "live_period"
        title_                 <- o A..:?  "title"
        thumbnail_url_         <- o A..:?  "thumbnail_url"
        thumbnail_width_       <- o A..:?  "thumbnail_width"
        thumbnail_height_      <- o A..:?  "thumbnail_height"
        reply_markup_          <- o A..:?  "reply_markup"
        input_message_content_ <- o A..:?  "input_message_content"
        pure $ InputInlineQueryResultLocation
          { _id                   = _id_
          , location              = location_
          , live_period           = live_period_
          , title                 = title_
          , thumbnail_url         = thumbnail_url_
          , thumbnail_width       = thumbnail_width_
          , thumbnail_height      = thumbnail_height_
          , reply_markup          = reply_markup_
          , input_message_content = input_message_content_
          }
      parseInputInlineQueryResultPhoto :: A.Value -> AT.Parser InputInlineQueryResult
      parseInputInlineQueryResultPhoto = A.withObject "InputInlineQueryResultPhoto" $ \o -> do
        _id_                   <- o A..:?  "id"
        title_                 <- o A..:?  "title"
        description_           <- o A..:?  "description"
        thumbnail_url_         <- o A..:?  "thumbnail_url"
        photo_url_             <- o A..:?  "photo_url"
        photo_width_           <- o A..:?  "photo_width"
        photo_height_          <- o A..:?  "photo_height"
        reply_markup_          <- o A..:?  "reply_markup"
        input_message_content_ <- o A..:?  "input_message_content"
        pure $ InputInlineQueryResultPhoto
          { _id                   = _id_
          , title                 = title_
          , description           = description_
          , thumbnail_url         = thumbnail_url_
          , photo_url             = photo_url_
          , photo_width           = photo_width_
          , photo_height          = photo_height_
          , reply_markup          = reply_markup_
          , input_message_content = input_message_content_
          }
      parseInputInlineQueryResultSticker :: A.Value -> AT.Parser InputInlineQueryResult
      parseInputInlineQueryResultSticker = A.withObject "InputInlineQueryResultSticker" $ \o -> do
        _id_                   <- o A..:?  "id"
        thumbnail_url_         <- o A..:?  "thumbnail_url"
        sticker_url_           <- o A..:?  "sticker_url"
        sticker_width_         <- o A..:?  "sticker_width"
        sticker_height_        <- o A..:?  "sticker_height"
        reply_markup_          <- o A..:?  "reply_markup"
        input_message_content_ <- o A..:?  "input_message_content"
        pure $ InputInlineQueryResultSticker
          { _id                   = _id_
          , thumbnail_url         = thumbnail_url_
          , sticker_url           = sticker_url_
          , sticker_width         = sticker_width_
          , sticker_height        = sticker_height_
          , reply_markup          = reply_markup_
          , input_message_content = input_message_content_
          }
      parseInputInlineQueryResultVenue :: A.Value -> AT.Parser InputInlineQueryResult
      parseInputInlineQueryResultVenue = A.withObject "InputInlineQueryResultVenue" $ \o -> do
        _id_                   <- o A..:?  "id"
        venue_                 <- o A..:?  "venue"
        thumbnail_url_         <- o A..:?  "thumbnail_url"
        thumbnail_width_       <- o A..:?  "thumbnail_width"
        thumbnail_height_      <- o A..:?  "thumbnail_height"
        reply_markup_          <- o A..:?  "reply_markup"
        input_message_content_ <- o A..:?  "input_message_content"
        pure $ InputInlineQueryResultVenue
          { _id                   = _id_
          , venue                 = venue_
          , thumbnail_url         = thumbnail_url_
          , thumbnail_width       = thumbnail_width_
          , thumbnail_height      = thumbnail_height_
          , reply_markup          = reply_markup_
          , input_message_content = input_message_content_
          }
      parseInputInlineQueryResultVideo :: A.Value -> AT.Parser InputInlineQueryResult
      parseInputInlineQueryResultVideo = A.withObject "InputInlineQueryResultVideo" $ \o -> do
        _id_                   <- o A..:?  "id"
        title_                 <- o A..:?  "title"
        description_           <- o A..:?  "description"
        thumbnail_url_         <- o A..:?  "thumbnail_url"
        video_url_             <- o A..:?  "video_url"
        mime_type_             <- o A..:?  "mime_type"
        video_width_           <- o A..:?  "video_width"
        video_height_          <- o A..:?  "video_height"
        video_duration_        <- o A..:?  "video_duration"
        reply_markup_          <- o A..:?  "reply_markup"
        input_message_content_ <- o A..:?  "input_message_content"
        pure $ InputInlineQueryResultVideo
          { _id                   = _id_
          , title                 = title_
          , description           = description_
          , thumbnail_url         = thumbnail_url_
          , video_url             = video_url_
          , mime_type             = mime_type_
          , video_width           = video_width_
          , video_height          = video_height_
          , video_duration        = video_duration_
          , reply_markup          = reply_markup_
          , input_message_content = input_message_content_
          }
      parseInputInlineQueryResultVoiceNote :: A.Value -> AT.Parser InputInlineQueryResult
      parseInputInlineQueryResultVoiceNote = A.withObject "InputInlineQueryResultVoiceNote" $ \o -> do
        _id_                   <- o A..:?  "id"
        title_                 <- o A..:?  "title"
        voice_note_url_        <- o A..:?  "voice_note_url"
        voice_note_duration_   <- o A..:?  "voice_note_duration"
        reply_markup_          <- o A..:?  "reply_markup"
        input_message_content_ <- o A..:?  "input_message_content"
        pure $ InputInlineQueryResultVoiceNote
          { _id                   = _id_
          , title                 = title_
          , voice_note_url        = voice_note_url_
          , voice_note_duration   = voice_note_duration_
          , reply_markup          = reply_markup_
          , input_message_content = input_message_content_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputInlineQueryResult where
  toJSON InputInlineQueryResultAnimation
    { _id                   = _id_
    , title                 = title_
    , thumbnail_url         = thumbnail_url_
    , thumbnail_mime_type   = thumbnail_mime_type_
    , video_url             = video_url_
    , video_mime_type       = video_mime_type_
    , video_duration        = video_duration_
    , video_width           = video_width_
    , video_height          = video_height_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = A.object
        [ "@type"                 A..= AT.String "inputInlineQueryResultAnimation"
        , "id"                    A..= _id_
        , "title"                 A..= title_
        , "thumbnail_url"         A..= thumbnail_url_
        , "thumbnail_mime_type"   A..= thumbnail_mime_type_
        , "video_url"             A..= video_url_
        , "video_mime_type"       A..= video_mime_type_
        , "video_duration"        A..= video_duration_
        , "video_width"           A..= video_width_
        , "video_height"          A..= video_height_
        , "reply_markup"          A..= reply_markup_
        , "input_message_content" A..= input_message_content_
        ]
  toJSON InputInlineQueryResultArticle
    { _id                   = _id_
    , url                   = url_
    , hide_url              = hide_url_
    , title                 = title_
    , description           = description_
    , thumbnail_url         = thumbnail_url_
    , thumbnail_width       = thumbnail_width_
    , thumbnail_height      = thumbnail_height_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = A.object
        [ "@type"                 A..= AT.String "inputInlineQueryResultArticle"
        , "id"                    A..= _id_
        , "url"                   A..= url_
        , "hide_url"              A..= hide_url_
        , "title"                 A..= title_
        , "description"           A..= description_
        , "thumbnail_url"         A..= thumbnail_url_
        , "thumbnail_width"       A..= thumbnail_width_
        , "thumbnail_height"      A..= thumbnail_height_
        , "reply_markup"          A..= reply_markup_
        , "input_message_content" A..= input_message_content_
        ]
  toJSON InputInlineQueryResultAudio
    { _id                   = _id_
    , title                 = title_
    , performer             = performer_
    , audio_url             = audio_url_
    , audio_duration        = audio_duration_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = A.object
        [ "@type"                 A..= AT.String "inputInlineQueryResultAudio"
        , "id"                    A..= _id_
        , "title"                 A..= title_
        , "performer"             A..= performer_
        , "audio_url"             A..= audio_url_
        , "audio_duration"        A..= audio_duration_
        , "reply_markup"          A..= reply_markup_
        , "input_message_content" A..= input_message_content_
        ]
  toJSON InputInlineQueryResultContact
    { _id                   = _id_
    , contact               = contact_
    , thumbnail_url         = thumbnail_url_
    , thumbnail_width       = thumbnail_width_
    , thumbnail_height      = thumbnail_height_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = A.object
        [ "@type"                 A..= AT.String "inputInlineQueryResultContact"
        , "id"                    A..= _id_
        , "contact"               A..= contact_
        , "thumbnail_url"         A..= thumbnail_url_
        , "thumbnail_width"       A..= thumbnail_width_
        , "thumbnail_height"      A..= thumbnail_height_
        , "reply_markup"          A..= reply_markup_
        , "input_message_content" A..= input_message_content_
        ]
  toJSON InputInlineQueryResultDocument
    { _id                   = _id_
    , title                 = title_
    , description           = description_
    , document_url          = document_url_
    , mime_type             = mime_type_
    , thumbnail_url         = thumbnail_url_
    , thumbnail_width       = thumbnail_width_
    , thumbnail_height      = thumbnail_height_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = A.object
        [ "@type"                 A..= AT.String "inputInlineQueryResultDocument"
        , "id"                    A..= _id_
        , "title"                 A..= title_
        , "description"           A..= description_
        , "document_url"          A..= document_url_
        , "mime_type"             A..= mime_type_
        , "thumbnail_url"         A..= thumbnail_url_
        , "thumbnail_width"       A..= thumbnail_width_
        , "thumbnail_height"      A..= thumbnail_height_
        , "reply_markup"          A..= reply_markup_
        , "input_message_content" A..= input_message_content_
        ]
  toJSON InputInlineQueryResultGame
    { _id             = _id_
    , game_short_name = game_short_name_
    , reply_markup    = reply_markup_
    }
      = A.object
        [ "@type"           A..= AT.String "inputInlineQueryResultGame"
        , "id"              A..= _id_
        , "game_short_name" A..= game_short_name_
        , "reply_markup"    A..= reply_markup_
        ]
  toJSON InputInlineQueryResultLocation
    { _id                   = _id_
    , location              = location_
    , live_period           = live_period_
    , title                 = title_
    , thumbnail_url         = thumbnail_url_
    , thumbnail_width       = thumbnail_width_
    , thumbnail_height      = thumbnail_height_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = A.object
        [ "@type"                 A..= AT.String "inputInlineQueryResultLocation"
        , "id"                    A..= _id_
        , "location"              A..= location_
        , "live_period"           A..= live_period_
        , "title"                 A..= title_
        , "thumbnail_url"         A..= thumbnail_url_
        , "thumbnail_width"       A..= thumbnail_width_
        , "thumbnail_height"      A..= thumbnail_height_
        , "reply_markup"          A..= reply_markup_
        , "input_message_content" A..= input_message_content_
        ]
  toJSON InputInlineQueryResultPhoto
    { _id                   = _id_
    , title                 = title_
    , description           = description_
    , thumbnail_url         = thumbnail_url_
    , photo_url             = photo_url_
    , photo_width           = photo_width_
    , photo_height          = photo_height_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = A.object
        [ "@type"                 A..= AT.String "inputInlineQueryResultPhoto"
        , "id"                    A..= _id_
        , "title"                 A..= title_
        , "description"           A..= description_
        , "thumbnail_url"         A..= thumbnail_url_
        , "photo_url"             A..= photo_url_
        , "photo_width"           A..= photo_width_
        , "photo_height"          A..= photo_height_
        , "reply_markup"          A..= reply_markup_
        , "input_message_content" A..= input_message_content_
        ]
  toJSON InputInlineQueryResultSticker
    { _id                   = _id_
    , thumbnail_url         = thumbnail_url_
    , sticker_url           = sticker_url_
    , sticker_width         = sticker_width_
    , sticker_height        = sticker_height_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = A.object
        [ "@type"                 A..= AT.String "inputInlineQueryResultSticker"
        , "id"                    A..= _id_
        , "thumbnail_url"         A..= thumbnail_url_
        , "sticker_url"           A..= sticker_url_
        , "sticker_width"         A..= sticker_width_
        , "sticker_height"        A..= sticker_height_
        , "reply_markup"          A..= reply_markup_
        , "input_message_content" A..= input_message_content_
        ]
  toJSON InputInlineQueryResultVenue
    { _id                   = _id_
    , venue                 = venue_
    , thumbnail_url         = thumbnail_url_
    , thumbnail_width       = thumbnail_width_
    , thumbnail_height      = thumbnail_height_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = A.object
        [ "@type"                 A..= AT.String "inputInlineQueryResultVenue"
        , "id"                    A..= _id_
        , "venue"                 A..= venue_
        , "thumbnail_url"         A..= thumbnail_url_
        , "thumbnail_width"       A..= thumbnail_width_
        , "thumbnail_height"      A..= thumbnail_height_
        , "reply_markup"          A..= reply_markup_
        , "input_message_content" A..= input_message_content_
        ]
  toJSON InputInlineQueryResultVideo
    { _id                   = _id_
    , title                 = title_
    , description           = description_
    , thumbnail_url         = thumbnail_url_
    , video_url             = video_url_
    , mime_type             = mime_type_
    , video_width           = video_width_
    , video_height          = video_height_
    , video_duration        = video_duration_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = A.object
        [ "@type"                 A..= AT.String "inputInlineQueryResultVideo"
        , "id"                    A..= _id_
        , "title"                 A..= title_
        , "description"           A..= description_
        , "thumbnail_url"         A..= thumbnail_url_
        , "video_url"             A..= video_url_
        , "mime_type"             A..= mime_type_
        , "video_width"           A..= video_width_
        , "video_height"          A..= video_height_
        , "video_duration"        A..= video_duration_
        , "reply_markup"          A..= reply_markup_
        , "input_message_content" A..= input_message_content_
        ]
  toJSON InputInlineQueryResultVoiceNote
    { _id                   = _id_
    , title                 = title_
    , voice_note_url        = voice_note_url_
    , voice_note_duration   = voice_note_duration_
    , reply_markup          = reply_markup_
    , input_message_content = input_message_content_
    }
      = A.object
        [ "@type"                 A..= AT.String "inputInlineQueryResultVoiceNote"
        , "id"                    A..= _id_
        , "title"                 A..= title_
        , "voice_note_url"        A..= voice_note_url_
        , "voice_note_duration"   A..= voice_note_duration_
        , "reply_markup"          A..= reply_markup_
        , "input_message_content" A..= input_message_content_
        ]

