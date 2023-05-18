{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PushMessageContent where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Animation as Animation
import qualified TD.Data.Audio as Audio
import qualified TD.Data.Document as Document
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.Video as Video
import qualified TD.Data.VideoNote as VideoNote
import qualified TD.Data.VoiceNote as VoiceNote
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
  | -- | A photo message
    PushMessageContentPhoto
      { -- | True, if the message is a pinned message with the specified content
        is_pinned :: Maybe Bool,
        -- | True, if the photo is secret
        is_secret :: Maybe Bool,
        -- | Photo caption
        caption :: Maybe String,
        -- | Message content; may be null
        photo :: Maybe Photo.Photo
      }
  | -- | A message with a poll
    PushMessageContentPoll
      { -- | True, if the message is a pinned message with the specified content
        is_pinned :: Maybe Bool,
        -- | True, if the poll is regular and not in quiz mode
        is_regular :: Maybe Bool,
        -- | Poll question
        question :: Maybe String
      }
  | -- | A screenshot of a message in the chat has been taken
    PushMessageContentScreenshotTaken
  | -- | A message with a sticker
    PushMessageContentSticker
      { -- | True, if the message is a pinned message with the specified content
        is_pinned :: Maybe Bool,
        -- | Emoji corresponding to the sticker; may be empty
        emoji :: Maybe String,
        -- | Message content; may be null
        sticker :: Maybe Sticker.Sticker
      }
  | -- | A text message @text Message text @is_pinned True, if the message is a pinned message with the specified content
    PushMessageContentText
      { -- |
        is_pinned :: Maybe Bool,
        -- |
        text :: Maybe String
      }
  | -- | A video message
    PushMessageContentVideo
      { -- | True, if the message is a pinned message with the specified content
        is_pinned :: Maybe Bool,
        -- | True, if the video is secret
        is_secret :: Maybe Bool,
        -- | Video caption
        caption :: Maybe String,
        -- | Message content; may be null
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
  | -- | New chat members were invited to a group
    PushMessageContentChatAddMembers
      { -- | True, if the user has returned to the group themselves
        is_returned :: Maybe Bool,
        -- | True, if the current user was added to the group
        is_current_user :: Maybe Bool,
        -- | Name of the added member
        member_name :: Maybe String
      }
  | -- | A chat photo was edited
    PushMessageContentChatChangePhoto
  | -- | A chat title was edited @title New chat title
    PushMessageContentChatChangeTitle
      { -- |
        title :: Maybe String
      }
  | -- | A chat background was edited @is_same True, if the set background is the same as the background of the current user
    PushMessageContentChatSetBackground
      { -- |
        is_same :: Maybe Bool
      }
  | -- | A chat theme was edited @theme_name If non-empty, name of a new theme, set for the chat. Otherwise, the chat theme was reset to the default one
    PushMessageContentChatSetTheme
      { -- |
        theme_name :: Maybe String
      }
  | -- | A chat member was deleted
    PushMessageContentChatDeleteMember
      { -- | True, if the user has left the group themselves
        is_left :: Maybe Bool,
        -- | True, if the current user was deleted from the group
        is_current_user :: Maybe Bool,
        -- | Name of the deleted member
        member_name :: Maybe String
      }
  | -- | A new member joined the chat via an invite link
    PushMessageContentChatJoinByLink
  | -- | A new member was accepted to the chat by an administrator
    PushMessageContentChatJoinByRequest
  | -- | A new recurring payment was made by the current user @amount The paid amount
    PushMessageContentRecurringPayment
      { -- |
        amount :: Maybe String
      }
  | -- | A profile photo was suggested to the user
    PushMessageContentSuggestProfilePhoto
  | -- | A forwarded messages @total_count Number of forwarded messages
    PushMessageContentMessageForwards
      { -- |
        total_count :: Maybe Int
      }
  | -- | A media album
    PushMessageContentMediaAlbum
      { -- | True, if the album has at least one document
        has_documents :: Maybe Bool,
        -- | True, if the album has at least one audio file
        has_audios :: Maybe Bool,
        -- | True, if the album has at least one video file
        has_videos :: Maybe Bool,
        -- | True, if the album has at least one photo
        has_photos :: Maybe Bool,
        -- | Number of messages in the album
        total_count :: Maybe Int
      }
  deriving (Eq)

instance Show PushMessageContent where
  show
    PushMessageContentHidden
      { is_pinned = is_pinned_
      } =
      "PushMessageContentHidden"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_
          ]
  show
    PushMessageContentAnimation
      { is_pinned = is_pinned_,
        caption = caption_,
        animation = animation_
      } =
      "PushMessageContentAnimation"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "caption" caption_,
            U.p "animation" animation_
          ]
  show
    PushMessageContentAudio
      { is_pinned = is_pinned_,
        audio = audio_
      } =
      "PushMessageContentAudio"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "audio" audio_
          ]
  show
    PushMessageContentContact
      { is_pinned = is_pinned_,
        name = name_
      } =
      "PushMessageContentContact"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "name" name_
          ]
  show PushMessageContentContactRegistered =
    "PushMessageContentContactRegistered"
      ++ U.cc
        []
  show
    PushMessageContentDocument
      { is_pinned = is_pinned_,
        document = document_
      } =
      "PushMessageContentDocument"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "document" document_
          ]
  show
    PushMessageContentGame
      { is_pinned = is_pinned_,
        title = title_
      } =
      "PushMessageContentGame"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "title" title_
          ]
  show
    PushMessageContentGameScore
      { is_pinned = is_pinned_,
        score = score_,
        title = title_
      } =
      "PushMessageContentGameScore"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "score" score_,
            U.p "title" title_
          ]
  show
    PushMessageContentInvoice
      { is_pinned = is_pinned_,
        price = price_
      } =
      "PushMessageContentInvoice"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "price" price_
          ]
  show
    PushMessageContentLocation
      { is_pinned = is_pinned_,
        is_live = is_live_
      } =
      "PushMessageContentLocation"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "is_live" is_live_
          ]
  show
    PushMessageContentPhoto
      { is_pinned = is_pinned_,
        is_secret = is_secret_,
        caption = caption_,
        photo = photo_
      } =
      "PushMessageContentPhoto"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "is_secret" is_secret_,
            U.p "caption" caption_,
            U.p "photo" photo_
          ]
  show
    PushMessageContentPoll
      { is_pinned = is_pinned_,
        is_regular = is_regular_,
        question = question_
      } =
      "PushMessageContentPoll"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "is_regular" is_regular_,
            U.p "question" question_
          ]
  show PushMessageContentScreenshotTaken =
    "PushMessageContentScreenshotTaken"
      ++ U.cc
        []
  show
    PushMessageContentSticker
      { is_pinned = is_pinned_,
        emoji = emoji_,
        sticker = sticker_
      } =
      "PushMessageContentSticker"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "emoji" emoji_,
            U.p "sticker" sticker_
          ]
  show
    PushMessageContentText
      { is_pinned = is_pinned_,
        text = text_
      } =
      "PushMessageContentText"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "text" text_
          ]
  show
    PushMessageContentVideo
      { is_pinned = is_pinned_,
        is_secret = is_secret_,
        caption = caption_,
        video = video_
      } =
      "PushMessageContentVideo"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "is_secret" is_secret_,
            U.p "caption" caption_,
            U.p "video" video_
          ]
  show
    PushMessageContentVideoNote
      { is_pinned = is_pinned_,
        video_note = video_note_
      } =
      "PushMessageContentVideoNote"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "video_note" video_note_
          ]
  show
    PushMessageContentVoiceNote
      { is_pinned = is_pinned_,
        voice_note = voice_note_
      } =
      "PushMessageContentVoiceNote"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "voice_note" voice_note_
          ]
  show PushMessageContentBasicGroupChatCreate =
    "PushMessageContentBasicGroupChatCreate"
      ++ U.cc
        []
  show
    PushMessageContentChatAddMembers
      { is_returned = is_returned_,
        is_current_user = is_current_user_,
        member_name = member_name_
      } =
      "PushMessageContentChatAddMembers"
        ++ U.cc
          [ U.p "is_returned" is_returned_,
            U.p "is_current_user" is_current_user_,
            U.p "member_name" member_name_
          ]
  show PushMessageContentChatChangePhoto =
    "PushMessageContentChatChangePhoto"
      ++ U.cc
        []
  show
    PushMessageContentChatChangeTitle
      { title = title_
      } =
      "PushMessageContentChatChangeTitle"
        ++ U.cc
          [ U.p "title" title_
          ]
  show
    PushMessageContentChatSetBackground
      { is_same = is_same_
      } =
      "PushMessageContentChatSetBackground"
        ++ U.cc
          [ U.p "is_same" is_same_
          ]
  show
    PushMessageContentChatSetTheme
      { theme_name = theme_name_
      } =
      "PushMessageContentChatSetTheme"
        ++ U.cc
          [ U.p "theme_name" theme_name_
          ]
  show
    PushMessageContentChatDeleteMember
      { is_left = is_left_,
        is_current_user = is_current_user_,
        member_name = member_name_
      } =
      "PushMessageContentChatDeleteMember"
        ++ U.cc
          [ U.p "is_left" is_left_,
            U.p "is_current_user" is_current_user_,
            U.p "member_name" member_name_
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
    PushMessageContentRecurringPayment
      { amount = amount_
      } =
      "PushMessageContentRecurringPayment"
        ++ U.cc
          [ U.p "amount" amount_
          ]
  show PushMessageContentSuggestProfilePhoto =
    "PushMessageContentSuggestProfilePhoto"
      ++ U.cc
        []
  show
    PushMessageContentMessageForwards
      { total_count = total_count_
      } =
      "PushMessageContentMessageForwards"
        ++ U.cc
          [ U.p "total_count" total_count_
          ]
  show
    PushMessageContentMediaAlbum
      { has_documents = has_documents_,
        has_audios = has_audios_,
        has_videos = has_videos_,
        has_photos = has_photos_,
        total_count = total_count_
      } =
      "PushMessageContentMediaAlbum"
        ++ U.cc
          [ U.p "has_documents" has_documents_,
            U.p "has_audios" has_audios_,
            U.p "has_videos" has_videos_,
            U.p "has_photos" has_photos_,
            U.p "total_count" total_count_
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
      "pushMessageContentChatSetBackground" -> parsePushMessageContentChatSetBackground v
      "pushMessageContentChatSetTheme" -> parsePushMessageContentChatSetTheme v
      "pushMessageContentChatDeleteMember" -> parsePushMessageContentChatDeleteMember v
      "pushMessageContentChatJoinByLink" -> parsePushMessageContentChatJoinByLink v
      "pushMessageContentChatJoinByRequest" -> parsePushMessageContentChatJoinByRequest v
      "pushMessageContentRecurringPayment" -> parsePushMessageContentRecurringPayment v
      "pushMessageContentSuggestProfilePhoto" -> parsePushMessageContentSuggestProfilePhoto v
      "pushMessageContentMessageForwards" -> parsePushMessageContentMessageForwards v
      "pushMessageContentMediaAlbum" -> parsePushMessageContentMediaAlbum v
      _ -> mempty
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
      parsePushMessageContentContactRegistered = A.withObject "PushMessageContentContactRegistered" $ \_ -> return PushMessageContentContactRegistered

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
        score_ <- o A..:? "score"
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
      parsePushMessageContentScreenshotTaken = A.withObject "PushMessageContentScreenshotTaken" $ \_ -> return PushMessageContentScreenshotTaken

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
      parsePushMessageContentBasicGroupChatCreate = A.withObject "PushMessageContentBasicGroupChatCreate" $ \_ -> return PushMessageContentBasicGroupChatCreate

      parsePushMessageContentChatAddMembers :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentChatAddMembers = A.withObject "PushMessageContentChatAddMembers" $ \o -> do
        is_returned_ <- o A..:? "is_returned"
        is_current_user_ <- o A..:? "is_current_user"
        member_name_ <- o A..:? "member_name"
        return $ PushMessageContentChatAddMembers {is_returned = is_returned_, is_current_user = is_current_user_, member_name = member_name_}

      parsePushMessageContentChatChangePhoto :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentChatChangePhoto = A.withObject "PushMessageContentChatChangePhoto" $ \_ -> return PushMessageContentChatChangePhoto

      parsePushMessageContentChatChangeTitle :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentChatChangeTitle = A.withObject "PushMessageContentChatChangeTitle" $ \o -> do
        title_ <- o A..:? "title"
        return $ PushMessageContentChatChangeTitle {title = title_}

      parsePushMessageContentChatSetBackground :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentChatSetBackground = A.withObject "PushMessageContentChatSetBackground" $ \o -> do
        is_same_ <- o A..:? "is_same"
        return $ PushMessageContentChatSetBackground {is_same = is_same_}

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
      parsePushMessageContentChatJoinByLink = A.withObject "PushMessageContentChatJoinByLink" $ \_ -> return PushMessageContentChatJoinByLink

      parsePushMessageContentChatJoinByRequest :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentChatJoinByRequest = A.withObject "PushMessageContentChatJoinByRequest" $ \_ -> return PushMessageContentChatJoinByRequest

      parsePushMessageContentRecurringPayment :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentRecurringPayment = A.withObject "PushMessageContentRecurringPayment" $ \o -> do
        amount_ <- o A..:? "amount"
        return $ PushMessageContentRecurringPayment {amount = amount_}

      parsePushMessageContentSuggestProfilePhoto :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentSuggestProfilePhoto = A.withObject "PushMessageContentSuggestProfilePhoto" $ \_ -> return PushMessageContentSuggestProfilePhoto

      parsePushMessageContentMessageForwards :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentMessageForwards = A.withObject "PushMessageContentMessageForwards" $ \o -> do
        total_count_ <- o A..:? "total_count"
        return $ PushMessageContentMessageForwards {total_count = total_count_}

      parsePushMessageContentMediaAlbum :: A.Value -> T.Parser PushMessageContent
      parsePushMessageContentMediaAlbum = A.withObject "PushMessageContentMediaAlbum" $ \o -> do
        has_documents_ <- o A..:? "has_documents"
        has_audios_ <- o A..:? "has_audios"
        has_videos_ <- o A..:? "has_videos"
        has_photos_ <- o A..:? "has_photos"
        total_count_ <- o A..:? "total_count"
        return $ PushMessageContentMediaAlbum {has_documents = has_documents_, has_audios = has_audios_, has_videos = has_videos_, has_photos = has_photos_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON PushMessageContent where
  toJSON
    PushMessageContentHidden
      { is_pinned = is_pinned_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentHidden",
          "is_pinned" A..= is_pinned_
        ]
  toJSON
    PushMessageContentAnimation
      { is_pinned = is_pinned_,
        caption = caption_,
        animation = animation_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentAnimation",
          "is_pinned" A..= is_pinned_,
          "caption" A..= caption_,
          "animation" A..= animation_
        ]
  toJSON
    PushMessageContentAudio
      { is_pinned = is_pinned_,
        audio = audio_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentAudio",
          "is_pinned" A..= is_pinned_,
          "audio" A..= audio_
        ]
  toJSON
    PushMessageContentContact
      { is_pinned = is_pinned_,
        name = name_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentContact",
          "is_pinned" A..= is_pinned_,
          "name" A..= name_
        ]
  toJSON PushMessageContentContactRegistered =
    A.object
      [ "@type" A..= T.String "pushMessageContentContactRegistered"
      ]
  toJSON
    PushMessageContentDocument
      { is_pinned = is_pinned_,
        document = document_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentDocument",
          "is_pinned" A..= is_pinned_,
          "document" A..= document_
        ]
  toJSON
    PushMessageContentGame
      { is_pinned = is_pinned_,
        title = title_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentGame",
          "is_pinned" A..= is_pinned_,
          "title" A..= title_
        ]
  toJSON
    PushMessageContentGameScore
      { is_pinned = is_pinned_,
        score = score_,
        title = title_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentGameScore",
          "is_pinned" A..= is_pinned_,
          "score" A..= score_,
          "title" A..= title_
        ]
  toJSON
    PushMessageContentInvoice
      { is_pinned = is_pinned_,
        price = price_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentInvoice",
          "is_pinned" A..= is_pinned_,
          "price" A..= price_
        ]
  toJSON
    PushMessageContentLocation
      { is_pinned = is_pinned_,
        is_live = is_live_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentLocation",
          "is_pinned" A..= is_pinned_,
          "is_live" A..= is_live_
        ]
  toJSON
    PushMessageContentPhoto
      { is_pinned = is_pinned_,
        is_secret = is_secret_,
        caption = caption_,
        photo = photo_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentPhoto",
          "is_pinned" A..= is_pinned_,
          "is_secret" A..= is_secret_,
          "caption" A..= caption_,
          "photo" A..= photo_
        ]
  toJSON
    PushMessageContentPoll
      { is_pinned = is_pinned_,
        is_regular = is_regular_,
        question = question_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentPoll",
          "is_pinned" A..= is_pinned_,
          "is_regular" A..= is_regular_,
          "question" A..= question_
        ]
  toJSON PushMessageContentScreenshotTaken =
    A.object
      [ "@type" A..= T.String "pushMessageContentScreenshotTaken"
      ]
  toJSON
    PushMessageContentSticker
      { is_pinned = is_pinned_,
        emoji = emoji_,
        sticker = sticker_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentSticker",
          "is_pinned" A..= is_pinned_,
          "emoji" A..= emoji_,
          "sticker" A..= sticker_
        ]
  toJSON
    PushMessageContentText
      { is_pinned = is_pinned_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentText",
          "is_pinned" A..= is_pinned_,
          "text" A..= text_
        ]
  toJSON
    PushMessageContentVideo
      { is_pinned = is_pinned_,
        is_secret = is_secret_,
        caption = caption_,
        video = video_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentVideo",
          "is_pinned" A..= is_pinned_,
          "is_secret" A..= is_secret_,
          "caption" A..= caption_,
          "video" A..= video_
        ]
  toJSON
    PushMessageContentVideoNote
      { is_pinned = is_pinned_,
        video_note = video_note_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentVideoNote",
          "is_pinned" A..= is_pinned_,
          "video_note" A..= video_note_
        ]
  toJSON
    PushMessageContentVoiceNote
      { is_pinned = is_pinned_,
        voice_note = voice_note_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentVoiceNote",
          "is_pinned" A..= is_pinned_,
          "voice_note" A..= voice_note_
        ]
  toJSON PushMessageContentBasicGroupChatCreate =
    A.object
      [ "@type" A..= T.String "pushMessageContentBasicGroupChatCreate"
      ]
  toJSON
    PushMessageContentChatAddMembers
      { is_returned = is_returned_,
        is_current_user = is_current_user_,
        member_name = member_name_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentChatAddMembers",
          "is_returned" A..= is_returned_,
          "is_current_user" A..= is_current_user_,
          "member_name" A..= member_name_
        ]
  toJSON PushMessageContentChatChangePhoto =
    A.object
      [ "@type" A..= T.String "pushMessageContentChatChangePhoto"
      ]
  toJSON
    PushMessageContentChatChangeTitle
      { title = title_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentChatChangeTitle",
          "title" A..= title_
        ]
  toJSON
    PushMessageContentChatSetBackground
      { is_same = is_same_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentChatSetBackground",
          "is_same" A..= is_same_
        ]
  toJSON
    PushMessageContentChatSetTheme
      { theme_name = theme_name_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentChatSetTheme",
          "theme_name" A..= theme_name_
        ]
  toJSON
    PushMessageContentChatDeleteMember
      { is_left = is_left_,
        is_current_user = is_current_user_,
        member_name = member_name_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentChatDeleteMember",
          "is_left" A..= is_left_,
          "is_current_user" A..= is_current_user_,
          "member_name" A..= member_name_
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
    PushMessageContentRecurringPayment
      { amount = amount_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentRecurringPayment",
          "amount" A..= amount_
        ]
  toJSON PushMessageContentSuggestProfilePhoto =
    A.object
      [ "@type" A..= T.String "pushMessageContentSuggestProfilePhoto"
      ]
  toJSON
    PushMessageContentMessageForwards
      { total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentMessageForwards",
          "total_count" A..= total_count_
        ]
  toJSON
    PushMessageContentMediaAlbum
      { has_documents = has_documents_,
        has_audios = has_audios_,
        has_videos = has_videos_,
        has_photos = has_photos_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "pushMessageContentMediaAlbum",
          "has_documents" A..= has_documents_,
          "has_audios" A..= has_audios_,
          "has_videos" A..= has_videos_,
          "has_photos" A..= has_photos_,
          "total_count" A..= total_count_
        ]
