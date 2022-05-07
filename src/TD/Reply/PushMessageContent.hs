{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.PushMessageContent where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Animation as Animation
import qualified TD.Reply.Audio as Audio
import qualified TD.Reply.Document as Document
import qualified TD.Reply.Photo as Photo
import qualified TD.Reply.Sticker as Sticker
import qualified TD.Reply.Video as Video
import qualified TD.Reply.VideoNote as VideoNote
import qualified TD.Reply.VoiceNote as VoiceNote
import qualified Utils as U

-- | Contains content of a push message notification
data PushMessageContent
  = -- | A general message with hidden content @is_pinned True, if the message is a pinned message with the specified content
    PushMessageContentHidden
      { -- |
        is_pinned :: Maybe Bool
      }
  | -- | An animation message (GIF-style). @animation Message content; may be null @caption Animation caption @is_pinned True, if the message is a pinned message with the specified content
    PushMessageContentAnimation
      { -- |
        is_pinned :: Maybe Bool,
        -- |
        caption :: Maybe String,
        -- |
        animation :: Maybe Animation.Animation
      }
  | -- | An audio message @audio Message content; may be null @is_pinned True, if the message is a pinned message with the specified content
    PushMessageContentAudio
      { -- |
        is_pinned :: Maybe Bool,
        -- |
        audio :: Maybe Audio.Audio
      }
  | -- | A message with a user contact @name Contact's name @is_pinned True, if the message is a pinned message with the specified content
    PushMessageContentContact
      { -- |
        is_pinned :: Maybe Bool,
        -- |
        name :: Maybe String
      }
  | -- | A contact has registered with Telegram
    PushMessageContentContactRegistered
  | -- | A document message (a general file) @document Message content; may be null @is_pinned True, if the message is a pinned message with the specified content
    PushMessageContentDocument
      { -- |
        is_pinned :: Maybe Bool,
        -- |
        document :: Maybe Document.Document
      }
  | -- | A message with a game @title Game title, empty for pinned game message @is_pinned True, if the message is a pinned message with the specified content
    PushMessageContentGame
      { -- |
        is_pinned :: Maybe Bool,
        -- |
        title :: Maybe String
      }
  | -- | A new high score was achieved in a game @title Game title, empty for pinned message @score New score, 0 for pinned message @is_pinned True, if the message is a pinned message with the specified content
    PushMessageContentGameScore
      { -- |
        is_pinned :: Maybe Bool,
        -- |
        score :: Maybe Int,
        -- |
        title :: Maybe String
      }
  | -- | A message with an invoice from a bot @price Product price @is_pinned True, if the message is a pinned message with the specified content
    PushMessageContentInvoice
      { -- |
        is_pinned :: Maybe Bool,
        -- |
        price :: Maybe String
      }
  | -- | A message with a location @is_live True, if the location is live @is_pinned True, if the message is a pinned message with the specified content
    PushMessageContentLocation
      { -- |
        is_pinned :: Maybe Bool,
        -- |
        is_live :: Maybe Bool
      }
  | -- | A photo message @photo Message content; may be null @caption Photo caption @is_secret True, if the photo is secret @is_pinned True, if the message is a pinned message with the specified content
    PushMessageContentPhoto
      { -- |
        is_pinned :: Maybe Bool,
        -- |
        is_secret :: Maybe Bool,
        -- |
        caption :: Maybe String,
        -- |
        photo :: Maybe Photo.Photo
      }
  | -- | A message with a poll @question Poll question @is_regular True, if the poll is regular and not in quiz mode @is_pinned True, if the message is a pinned message with the specified content
    PushMessageContentPoll
      { -- |
        is_pinned :: Maybe Bool,
        -- |
        is_regular :: Maybe Bool,
        -- |
        question :: Maybe String
      }
  | -- | A screenshot of a message in the chat has been taken
    PushMessageContentScreenshotTaken
  | -- | A message with a sticker @sticker Message content; may be null @emoji Emoji corresponding to the sticker; may be empty @is_pinned True, if the message is a pinned message with the specified content
    PushMessageContentSticker
      { -- |
        is_pinned :: Maybe Bool,
        -- |
        emoji :: Maybe String,
        -- |
        sticker :: Maybe Sticker.Sticker
      }
  | -- | A text message @text Message text @is_pinned True, if the message is a pinned message with the specified content
    PushMessageContentText
      { -- |
        is_pinned :: Maybe Bool,
        -- |
        text :: Maybe String
      }
  | -- | A video message @video Message content; may be null @caption Video caption @is_secret True, if the video is secret @is_pinned True, if the message is a pinned message with the specified content
    PushMessageContentVideo
      { -- |
        is_pinned :: Maybe Bool,
        -- |
        is_secret :: Maybe Bool,
        -- |
        caption :: Maybe String,
        -- |
        video :: Maybe Video.Video
      }
  | -- | A video note message @video_note Message content; may be null @is_pinned True, if the message is a pinned message with the specified content
    PushMessageContentVideoNote
      { -- |
        is_pinned :: Maybe Bool,
        -- |
        video_note :: Maybe VideoNote.VideoNote
      }
  | -- | A voice note message @voice_note Message content; may be null @is_pinned True, if the message is a pinned message with the specified content
    PushMessageContentVoiceNote
      { -- |
        is_pinned :: Maybe Bool,
        -- |
        voice_note :: Maybe VoiceNote.VoiceNote
      }
  | -- | A newly created basic group
    PushMessageContentBasicGroupChatCreate
  | -- | New chat members were invited to a group @member_name Name of the added member @is_current_user True, if the current user was added to the group
    PushMessageContentChatAddMembers
      { -- | True, if the user has returned to the group themselves
        is_returned :: Maybe Bool,
        -- |
        is_current_user :: Maybe Bool,
        -- |
        member_name :: Maybe String
      }
  | -- | A chat photo was edited
    PushMessageContentChatChangePhoto
  | -- | A chat title was edited @title New chat title
    PushMessageContentChatChangeTitle
      { -- |
        title :: Maybe String
      }
  | -- | A chat theme was edited @theme_name If non-empty, name of a new theme, set for the chat. Otherwise chat theme was reset to the default one
    PushMessageContentChatSetTheme
      { -- |
        theme_name :: Maybe String
      }
  | -- | A chat member was deleted @member_name Name of the deleted member @is_current_user True, if the current user was deleted from the group
    PushMessageContentChatDeleteMember
      { -- | True, if the user has left the group themselves
        is_left :: Maybe Bool,
        -- |
        is_current_user :: Maybe Bool,
        -- |
        member_name :: Maybe String
      }
  | -- | A new member joined the chat via an invite link
    PushMessageContentChatJoinByLink
  | -- | A new member was accepted to the chat by an administrator
    PushMessageContentChatJoinByRequest
  | -- | A forwarded messages @total_count Number of forwarded messages
    PushMessageContentMessageForwards
      { -- |
        total_count :: Maybe Int
      }
  | -- | A media album @total_count Number of messages in the album @has_photos True, if the album has at least one photo @has_videos True, if the album has at least one video
    PushMessageContentMediaAlbum
      { -- |
        has_documents :: Maybe Bool,
        -- | True, if the album has at least one audio file @has_documents True, if the album has at least one document
        has_audios :: Maybe Bool,
        -- |
        has_videos :: Maybe Bool,
        -- |
        has_photos :: Maybe Bool,
        -- |
        total_count :: Maybe Int
      }
  deriving (Eq)

instance Show PushMessageContent where
  show
    PushMessageContentHidden
      { is_pinned = is_pinned
      } =
      "PushMessageContentHidden"
        ++ U.cc
          [ U.p "is_pinned" is_pinned
          ]
  show
    PushMessageContentAnimation
      { is_pinned = is_pinned,
        caption = caption,
        animation = animation
      } =
      "PushMessageContentAnimation"
        ++ U.cc
          [ U.p "is_pinned" is_pinned,
            U.p "caption" caption,
            U.p "animation" animation
          ]
  show
    PushMessageContentAudio
      { is_pinned = is_pinned,
        audio = audio
      } =
      "PushMessageContentAudio"
        ++ U.cc
          [ U.p "is_pinned" is_pinned,
            U.p "audio" audio
          ]
  show
    PushMessageContentContact
      { is_pinned = is_pinned,
        name = name
      } =
      "PushMessageContentContact"
        ++ U.cc
          [ U.p "is_pinned" is_pinned,
            U.p "name" name
          ]
  show PushMessageContentContactRegistered =
    "PushMessageContentContactRegistered"
      ++ U.cc
        []
  show
    PushMessageContentDocument
      { is_pinned = is_pinned,
        document = document
      } =
      "PushMessageContentDocument"
        ++ U.cc
          [ U.p "is_pinned" is_pinned,
            U.p "document" document
          ]
  show
    PushMessageContentGame
      { is_pinned = is_pinned,
        title = title
      } =
      "PushMessageContentGame"
        ++ U.cc
          [ U.p "is_pinned" is_pinned,
            U.p "title" title
          ]
  show
    PushMessageContentGameScore
      { is_pinned = is_pinned,
        score = score,
        title = title
      } =
      "PushMessageContentGameScore"
        ++ U.cc
          [ U.p "is_pinned" is_pinned,
            U.p "score" score,
            U.p "title" title
          ]
  show
    PushMessageContentInvoice
      { is_pinned = is_pinned,
        price = price
      } =
      "PushMessageContentInvoice"
        ++ U.cc
          [ U.p "is_pinned" is_pinned,
            U.p "price" price
          ]
  show
    PushMessageContentLocation
      { is_pinned = is_pinned,
        is_live = is_live
      } =
      "PushMessageContentLocation"
        ++ U.cc
          [ U.p "is_pinned" is_pinned,
            U.p "is_live" is_live
          ]
  show
    PushMessageContentPhoto
      { is_pinned = is_pinned,
        is_secret = is_secret,
        caption = caption,
        photo = photo
      } =
      "PushMessageContentPhoto"
        ++ U.cc
          [ U.p "is_pinned" is_pinned,
            U.p "is_secret" is_secret,
            U.p "caption" caption,
            U.p "photo" photo
          ]
  show
    PushMessageContentPoll
      { is_pinned = is_pinned,
        is_regular = is_regular,
        question = question
      } =
      "PushMessageContentPoll"
        ++ U.cc
          [ U.p "is_pinned" is_pinned,
            U.p "is_regular" is_regular,
            U.p "question" question
          ]
  show PushMessageContentScreenshotTaken =
    "PushMessageContentScreenshotTaken"
      ++ U.cc
        []
  show
    PushMessageContentSticker
      { is_pinned = is_pinned,
        emoji = emoji,
        sticker = sticker
      } =
      "PushMessageContentSticker"
        ++ U.cc
          [ U.p "is_pinned" is_pinned,
            U.p "emoji" emoji,
            U.p "sticker" sticker
          ]
  show
    PushMessageContentText
      { is_pinned = is_pinned,
        text = text
      } =
      "PushMessageContentText"
        ++ U.cc
          [ U.p "is_pinned" is_pinned,
            U.p "text" text
          ]
  show
    PushMessageContentVideo
      { is_pinned = is_pinned,
        is_secret = is_secret,
        caption = caption,
        video = video
      } =
      "PushMessageContentVideo"
        ++ U.cc
          [ U.p "is_pinned" is_pinned,
            U.p "is_secret" is_secret,
            U.p "caption" caption,
            U.p "video" video
          ]
  show
    PushMessageContentVideoNote
      { is_pinned = is_pinned,
        video_note = video_note
      } =
      "PushMessageContentVideoNote"
        ++ U.cc
          [ U.p "is_pinned" is_pinned,
            U.p "video_note" video_note
          ]
  show
    PushMessageContentVoiceNote
      { is_pinned = is_pinned,
        voice_note = voice_note
      } =
      "PushMessageContentVoiceNote"
        ++ U.cc
          [ U.p "is_pinned" is_pinned,
            U.p "voice_note" voice_note
          ]
  show PushMessageContentBasicGroupChatCreate =
    "PushMessageContentBasicGroupChatCreate"
      ++ U.cc
        []
  show
    PushMessageContentChatAddMembers
      { is_returned = is_returned,
        is_current_user = is_current_user,
        member_name = member_name
      } =
      "PushMessageContentChatAddMembers"
        ++ U.cc
          [ U.p "is_returned" is_returned,
            U.p "is_current_user" is_current_user,
            U.p "member_name" member_name
          ]
  show PushMessageContentChatChangePhoto =
    "PushMessageContentChatChangePhoto"
      ++ U.cc
        []
  show
    PushMessageContentChatChangeTitle
      { title = title
      } =
      "PushMessageContentChatChangeTitle"
        ++ U.cc
          [ U.p "title" title
          ]
  show
    PushMessageContentChatSetTheme
      { theme_name = theme_name
      } =
      "PushMessageContentChatSetTheme"
        ++ U.cc
          [ U.p "theme_name" theme_name
          ]
  show
    PushMessageContentChatDeleteMember
      { is_left = is_left,
        is_current_user = is_current_user,
        member_name = member_name
      } =
      "PushMessageContentChatDeleteMember"
        ++ U.cc
          [ U.p "is_left" is_left,
            U.p "is_current_user" is_current_user,
            U.p "member_name" member_name
          ]
  show PushMessageContentChatJoinByLink =
    "PushMessageContentChatJoinByLink"
      ++ U.cc
        []
  show PushMessageContentChatJoinByRequest =
    "PushMessageContentChatJoinByRequest"
      ++ U.cc
        []
  show
    PushMessageContentMessageForwards
      { total_count = total_count
      } =
      "PushMessageContentMessageForwards"
        ++ U.cc
          [ U.p "total_count" total_count
          ]
  show
    PushMessageContentMediaAlbum
      { has_documents = has_documents,
        has_audios = has_audios,
        has_videos = has_videos,
        has_photos = has_photos,
        total_count = total_count
      } =
      "PushMessageContentMediaAlbum"
        ++ U.cc
          [ U.p "has_documents" has_documents,
            U.p "has_audios" has_audios,
            U.p "has_videos" has_videos,
            U.p "has_photos" has_photos,
            U.p "total_count" total_count
          ]

instance T.FromJSON PushMessageContent where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "pushMessageContentHidden" -> parsePushMessageContentHidden v
      "pushMessageContentAnimation" -> parsePushMessageContentAnimation v
      "pushMessageContentAudio" -> parsePushMessageContentAudio v
      "pushMessageContentContact" -> parsePushMessageContentContact v
      "pushMessageContentContactRegistered" -> parsePushMessageContentContactRegistered v
      "pushMessageContentDocument" -> parsePushMessageContentDocument v
      "pushMessageContentGame" -> parsePushMessageContentGame v
      "pushMessageContentGameScore" -> parsePushMessageContentGameScore v
      "pushMessageContentInvoice" -> parsePushMessageContentInvoice v
      "pushMessageContentLocation" -> parsePushMessageContentLocation v
      "pushMessageContentPhoto" -> parsePushMessageContentPhoto v
      "pushMessageContentPoll" -> parsePushMessageContentPoll v
      "pushMessageContentScreenshotTaken" -> parsePushMessageContentScreenshotTaken v
      "pushMessageContentSticker" -> parsePushMessageContentSticker v
      "pushMessageContentText" -> parsePushMessageContentText v
      "pushMessageContentVideo" -> parsePushMessageContentVideo v
      "pushMessageContentVideoNote" -> parsePushMessageContentVideoNote v
      "pushMessageContentVoiceNote" -> parsePushMessageContentVoiceNote v
      "pushMessageContentBasicGroupChatCreate" -> parsePushMessageContentBasicGroupChatCreate v
      "pushMessageContentChatAddMembers" -> parsePushMessageContentChatAddMembers v
      "pushMessageContentChatChangePhoto" -> parsePushMessageContentChatChangePhoto v
      "pushMessageContentChatChangeTitle" -> parsePushMessageContentChatChangeTitle v
      "pushMessageContentChatSetTheme" -> parsePushMessageContentChatSetTheme v
      "pushMessageContentChatDeleteMember" -> parsePushMessageContentChatDeleteMember v
      "pushMessageContentChatJoinByLink" -> parsePushMessageContentChatJoinByLink v
      "pushMessageContentChatJoinByRequest" -> parsePushMessageContentChatJoinByRequest v
      "pushMessageContentMessageForwards" -> parsePushMessageContentMessageForwards v
      "pushMessageContentMediaAlbum" -> parsePushMessageContentMediaAlbum v
      _ -> fail ""
    where
      parsePushMessageContentHidden :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentHidden = A.withObject "PushMessageContentHidden" $ \o -> do
        is_pinned_ <- o A..:? "is_pinned"
        return $ PushMessageContentHidden {is_pinned = is_pinned_}

      parsePushMessageContentAnimation :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentAnimation = A.withObject "PushMessageContentAnimation" $ \o -> do
        is_pinned_ <- o A..:? "is_pinned"
        caption_ <- o A..:? "caption"
        animation_ <- o A..:? "animation"
        return $ PushMessageContentAnimation {is_pinned = is_pinned_, caption = caption_, animation = animation_}

      parsePushMessageContentAudio :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentAudio = A.withObject "PushMessageContentAudio" $ \o -> do
        is_pinned_ <- o A..:? "is_pinned"
        audio_ <- o A..:? "audio"
        return $ PushMessageContentAudio {is_pinned = is_pinned_, audio = audio_}

      parsePushMessageContentContact :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentContact = A.withObject "PushMessageContentContact" $ \o -> do
        is_pinned_ <- o A..:? "is_pinned"
        name_ <- o A..:? "name"
        return $ PushMessageContentContact {is_pinned = is_pinned_, name = name_}

      parsePushMessageContentContactRegistered :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentContactRegistered = A.withObject "PushMessageContentContactRegistered" $ \o -> do
        return $ PushMessageContentContactRegistered {}

      parsePushMessageContentDocument :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentDocument = A.withObject "PushMessageContentDocument" $ \o -> do
        is_pinned_ <- o A..:? "is_pinned"
        document_ <- o A..:? "document"
        return $ PushMessageContentDocument {is_pinned = is_pinned_, document = document_}

      parsePushMessageContentGame :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentGame = A.withObject "PushMessageContentGame" $ \o -> do
        is_pinned_ <- o A..:? "is_pinned"
        title_ <- o A..:? "title"
        return $ PushMessageContentGame {is_pinned = is_pinned_, title = title_}

      parsePushMessageContentGameScore :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentGameScore = A.withObject "PushMessageContentGameScore" $ \o -> do
        is_pinned_ <- o A..:? "is_pinned"
        score_ <- mconcat [o A..:? "score", U.rm <$> (o A..: "score" :: T.Parser String)] :: T.Parser (Maybe Int)
        title_ <- o A..:? "title"
        return $ PushMessageContentGameScore {is_pinned = is_pinned_, score = score_, title = title_}

      parsePushMessageContentInvoice :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentInvoice = A.withObject "PushMessageContentInvoice" $ \o -> do
        is_pinned_ <- o A..:? "is_pinned"
        price_ <- o A..:? "price"
        return $ PushMessageContentInvoice {is_pinned = is_pinned_, price = price_}

      parsePushMessageContentLocation :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentLocation = A.withObject "PushMessageContentLocation" $ \o -> do
        is_pinned_ <- o A..:? "is_pinned"
        is_live_ <- o A..:? "is_live"
        return $ PushMessageContentLocation {is_pinned = is_pinned_, is_live = is_live_}

      parsePushMessageContentPhoto :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentPhoto = A.withObject "PushMessageContentPhoto" $ \o -> do
        is_pinned_ <- o A..:? "is_pinned"
        is_secret_ <- o A..:? "is_secret"
        caption_ <- o A..:? "caption"
        photo_ <- o A..:? "photo"
        return $ PushMessageContentPhoto {is_pinned = is_pinned_, is_secret = is_secret_, caption = caption_, photo = photo_}

      parsePushMessageContentPoll :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentPoll = A.withObject "PushMessageContentPoll" $ \o -> do
        is_pinned_ <- o A..:? "is_pinned"
        is_regular_ <- o A..:? "is_regular"
        question_ <- o A..:? "question"
        return $ PushMessageContentPoll {is_pinned = is_pinned_, is_regular = is_regular_, question = question_}

      parsePushMessageContentScreenshotTaken :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentScreenshotTaken = A.withObject "PushMessageContentScreenshotTaken" $ \o -> do
        return $ PushMessageContentScreenshotTaken {}

      parsePushMessageContentSticker :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentSticker = A.withObject "PushMessageContentSticker" $ \o -> do
        is_pinned_ <- o A..:? "is_pinned"
        emoji_ <- o A..:? "emoji"
        sticker_ <- o A..:? "sticker"
        return $ PushMessageContentSticker {is_pinned = is_pinned_, emoji = emoji_, sticker = sticker_}

      parsePushMessageContentText :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentText = A.withObject "PushMessageContentText" $ \o -> do
        is_pinned_ <- o A..:? "is_pinned"
        text_ <- o A..:? "text"
        return $ PushMessageContentText {is_pinned = is_pinned_, text = text_}

      parsePushMessageContentVideo :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentVideo = A.withObject "PushMessageContentVideo" $ \o -> do
        is_pinned_ <- o A..:? "is_pinned"
        is_secret_ <- o A..:? "is_secret"
        caption_ <- o A..:? "caption"
        video_ <- o A..:? "video"
        return $ PushMessageContentVideo {is_pinned = is_pinned_, is_secret = is_secret_, caption = caption_, video = video_}

      parsePushMessageContentVideoNote :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentVideoNote = A.withObject "PushMessageContentVideoNote" $ \o -> do
        is_pinned_ <- o A..:? "is_pinned"
        video_note_ <- o A..:? "video_note"
        return $ PushMessageContentVideoNote {is_pinned = is_pinned_, video_note = video_note_}

      parsePushMessageContentVoiceNote :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentVoiceNote = A.withObject "PushMessageContentVoiceNote" $ \o -> do
        is_pinned_ <- o A..:? "is_pinned"
        voice_note_ <- o A..:? "voice_note"
        return $ PushMessageContentVoiceNote {is_pinned = is_pinned_, voice_note = voice_note_}

      parsePushMessageContentBasicGroupChatCreate :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentBasicGroupChatCreate = A.withObject "PushMessageContentBasicGroupChatCreate" $ \o -> do
        return $ PushMessageContentBasicGroupChatCreate {}

      parsePushMessageContentChatAddMembers :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentChatAddMembers = A.withObject "PushMessageContentChatAddMembers" $ \o -> do
        is_returned_ <- o A..:? "is_returned"
        is_current_user_ <- o A..:? "is_current_user"
        member_name_ <- o A..:? "member_name"
        return $ PushMessageContentChatAddMembers {is_returned = is_returned_, is_current_user = is_current_user_, member_name = member_name_}

      parsePushMessageContentChatChangePhoto :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentChatChangePhoto = A.withObject "PushMessageContentChatChangePhoto" $ \o -> do
        return $ PushMessageContentChatChangePhoto {}

      parsePushMessageContentChatChangeTitle :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentChatChangeTitle = A.withObject "PushMessageContentChatChangeTitle" $ \o -> do
        title_ <- o A..:? "title"
        return $ PushMessageContentChatChangeTitle {title = title_}

      parsePushMessageContentChatSetTheme :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentChatSetTheme = A.withObject "PushMessageContentChatSetTheme" $ \o -> do
        theme_name_ <- o A..:? "theme_name"
        return $ PushMessageContentChatSetTheme {theme_name = theme_name_}

      parsePushMessageContentChatDeleteMember :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentChatDeleteMember = A.withObject "PushMessageContentChatDeleteMember" $ \o -> do
        is_left_ <- o A..:? "is_left"
        is_current_user_ <- o A..:? "is_current_user"
        member_name_ <- o A..:? "member_name"
        return $ PushMessageContentChatDeleteMember {is_left = is_left_, is_current_user = is_current_user_, member_name = member_name_}

      parsePushMessageContentChatJoinByLink :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentChatJoinByLink = A.withObject "PushMessageContentChatJoinByLink" $ \o -> do
        return $ PushMessageContentChatJoinByLink {}

      parsePushMessageContentChatJoinByRequest :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentChatJoinByRequest = A.withObject "PushMessageContentChatJoinByRequest" $ \o -> do
        return $ PushMessageContentChatJoinByRequest {}

      parsePushMessageContentMessageForwards :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentMessageForwards = A.withObject "PushMessageContentMessageForwards" $ \o -> do
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ PushMessageContentMessageForwards {total_count = total_count_}

      parsePushMessageContentMediaAlbum :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentMediaAlbum = A.withObject "PushMessageContentMediaAlbum" $ \o -> do
        has_documents_ <- o A..:? "has_documents"
        has_audios_ <- o A..:? "has_audios"
        has_videos_ <- o A..:? "has_videos"
        has_photos_ <- o A..:? "has_photos"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ PushMessageContentMediaAlbum {has_documents = has_documents_, has_audios = has_audios_, has_videos = has_videos_, has_photos = has_photos_, total_count = total_count_}
  parseJSON _ = fail ""

instance T.ToJSON PushMessageContent where
  toJSON
    PushMessageContentHidden
      { is_pinned = is_pinned
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentHidden",
          "is_pinned" A..= is_pinned
        ]
  toJSON
    PushMessageContentAnimation
      { is_pinned = is_pinned,
        caption = caption,
        animation = animation
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentAnimation",
          "is_pinned" A..= is_pinned,
          "caption" A..= caption,
          "animation" A..= animation
        ]
  toJSON
    PushMessageContentAudio
      { is_pinned = is_pinned,
        audio = audio
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentAudio",
          "is_pinned" A..= is_pinned,
          "audio" A..= audio
        ]
  toJSON
    PushMessageContentContact
      { is_pinned = is_pinned,
        name = name
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentContact",
          "is_pinned" A..= is_pinned,
          "name" A..= name
        ]
  toJSON PushMessageContentContactRegistered =
    A.object
      [ "@type" A..= T.String "pushMessageContentContactRegistered"
      ]
  toJSON
    PushMessageContentDocument
      { is_pinned = is_pinned,
        document = document
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentDocument",
          "is_pinned" A..= is_pinned,
          "document" A..= document
        ]
  toJSON
    PushMessageContentGame
      { is_pinned = is_pinned,
        title = title
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentGame",
          "is_pinned" A..= is_pinned,
          "title" A..= title
        ]
  toJSON
    PushMessageContentGameScore
      { is_pinned = is_pinned,
        score = score,
        title = title
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentGameScore",
          "is_pinned" A..= is_pinned,
          "score" A..= score,
          "title" A..= title
        ]
  toJSON
    PushMessageContentInvoice
      { is_pinned = is_pinned,
        price = price
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentInvoice",
          "is_pinned" A..= is_pinned,
          "price" A..= price
        ]
  toJSON
    PushMessageContentLocation
      { is_pinned = is_pinned,
        is_live = is_live
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentLocation",
          "is_pinned" A..= is_pinned,
          "is_live" A..= is_live
        ]
  toJSON
    PushMessageContentPhoto
      { is_pinned = is_pinned,
        is_secret = is_secret,
        caption = caption,
        photo = photo
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentPhoto",
          "is_pinned" A..= is_pinned,
          "is_secret" A..= is_secret,
          "caption" A..= caption,
          "photo" A..= photo
        ]
  toJSON
    PushMessageContentPoll
      { is_pinned = is_pinned,
        is_regular = is_regular,
        question = question
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentPoll",
          "is_pinned" A..= is_pinned,
          "is_regular" A..= is_regular,
          "question" A..= question
        ]
  toJSON PushMessageContentScreenshotTaken =
    A.object
      [ "@type" A..= T.String "pushMessageContentScreenshotTaken"
      ]
  toJSON
    PushMessageContentSticker
      { is_pinned = is_pinned,
        emoji = emoji,
        sticker = sticker
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentSticker",
          "is_pinned" A..= is_pinned,
          "emoji" A..= emoji,
          "sticker" A..= sticker
        ]
  toJSON
    PushMessageContentText
      { is_pinned = is_pinned,
        text = text
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentText",
          "is_pinned" A..= is_pinned,
          "text" A..= text
        ]
  toJSON
    PushMessageContentVideo
      { is_pinned = is_pinned,
        is_secret = is_secret,
        caption = caption,
        video = video
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentVideo",
          "is_pinned" A..= is_pinned,
          "is_secret" A..= is_secret,
          "caption" A..= caption,
          "video" A..= video
        ]
  toJSON
    PushMessageContentVideoNote
      { is_pinned = is_pinned,
        video_note = video_note
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentVideoNote",
          "is_pinned" A..= is_pinned,
          "video_note" A..= video_note
        ]
  toJSON
    PushMessageContentVoiceNote
      { is_pinned = is_pinned,
        voice_note = voice_note
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentVoiceNote",
          "is_pinned" A..= is_pinned,
          "voice_note" A..= voice_note
        ]
  toJSON PushMessageContentBasicGroupChatCreate =
    A.object
      [ "@type" A..= T.String "pushMessageContentBasicGroupChatCreate"
      ]
  toJSON
    PushMessageContentChatAddMembers
      { is_returned = is_returned,
        is_current_user = is_current_user,
        member_name = member_name
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentChatAddMembers",
          "is_returned" A..= is_returned,
          "is_current_user" A..= is_current_user,
          "member_name" A..= member_name
        ]
  toJSON PushMessageContentChatChangePhoto =
    A.object
      [ "@type" A..= T.String "pushMessageContentChatChangePhoto"
      ]
  toJSON
    PushMessageContentChatChangeTitle
      { title = title
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentChatChangeTitle",
          "title" A..= title
        ]
  toJSON
    PushMessageContentChatSetTheme
      { theme_name = theme_name
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentChatSetTheme",
          "theme_name" A..= theme_name
        ]
  toJSON
    PushMessageContentChatDeleteMember
      { is_left = is_left,
        is_current_user = is_current_user,
        member_name = member_name
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentChatDeleteMember",
          "is_left" A..= is_left,
          "is_current_user" A..= is_current_user,
          "member_name" A..= member_name
        ]
  toJSON PushMessageContentChatJoinByLink =
    A.object
      [ "@type" A..= T.String "pushMessageContentChatJoinByLink"
      ]
  toJSON PushMessageContentChatJoinByRequest =
    A.object
      [ "@type" A..= T.String "pushMessageContentChatJoinByRequest"
      ]
  toJSON
    PushMessageContentMessageForwards
      { total_count = total_count
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentMessageForwards",
          "total_count" A..= total_count
        ]
  toJSON
    PushMessageContentMediaAlbum
      { has_documents = has_documents,
        has_audios = has_audios,
        has_videos = has_videos,
        has_photos = has_photos,
        total_count = total_count
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentMediaAlbum",
          "has_documents" A..= has_documents,
          "has_audios" A..= has_audios,
          "has_videos" A..= has_videos,
          "has_photos" A..= has_photos,
          "total_count" A..= total_count
        ]
