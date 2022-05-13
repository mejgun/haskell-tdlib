{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.TextEntityType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Represents a part of the text which must be formatted differently
data TextEntityType
  = -- | A mention of a user by their username
    TextEntityTypeMention
  | -- | A hashtag text, beginning with "#"
    TextEntityTypeHashtag
  | -- | A cashtag text, beginning with "$" and consisting of capital English letters (e.g., "$USD")
    TextEntityTypeCashtag
  | -- | A bot command, beginning with "/"
    TextEntityTypeBotCommand
  | -- | An HTTP URL
    TextEntityTypeUrl
  | -- | An email address
    TextEntityTypeEmailAddress
  | -- | A phone number
    TextEntityTypePhoneNumber
  | -- | A bank card number. The getBankCardInfo method can be used to get information about the bank card
    TextEntityTypeBankCardNumber
  | -- | A bold text
    TextEntityTypeBold
  | -- | An italic text
    TextEntityTypeItalic
  | -- | An underlined text
    TextEntityTypeUnderline
  | -- | A strikethrough text
    TextEntityTypeStrikethrough
  | -- | A spoiler text. Not supported in secret chats
    TextEntityTypeSpoiler
  | -- | Text that must be formatted as if inside a code HTML tag
    TextEntityTypeCode
  | -- | Text that must be formatted as if inside a pre HTML tag
    TextEntityTypePre
  | -- | Text that must be formatted as if inside pre, and code HTML tags @language Programming language of the code; as defined by the sender
    TextEntityTypePreCode
      { -- |
        language :: Maybe String
      }
  | -- | A text description shown instead of a raw URL @url HTTP or tg:// URL to be opened when the link is clicked
    TextEntityTypeTextUrl
      { -- |
        url :: Maybe String
      }
  | -- | A text shows instead of a raw mention of the user (e.g., when the user has no username) @user_id Identifier of the mentioned user
    TextEntityTypeMentionName
      { -- |
        user_id :: Maybe Int
      }
  | -- | A media timestamp @media_timestamp Timestamp from which a video/audio/video note/voice note playing must start, in seconds. The media can be in the content or the web page preview of the current message, or in the same places in the replied message
    TextEntityTypeMediaTimestamp
      { -- |
        media_timestamp :: Maybe Int
      }
  deriving (Eq)

instance Show TextEntityType where
  show TextEntityTypeMention =
    "TextEntityTypeMention"
      ++ U.cc
        []
  show TextEntityTypeHashtag =
    "TextEntityTypeHashtag"
      ++ U.cc
        []
  show TextEntityTypeCashtag =
    "TextEntityTypeCashtag"
      ++ U.cc
        []
  show TextEntityTypeBotCommand =
    "TextEntityTypeBotCommand"
      ++ U.cc
        []
  show TextEntityTypeUrl =
    "TextEntityTypeUrl"
      ++ U.cc
        []
  show TextEntityTypeEmailAddress =
    "TextEntityTypeEmailAddress"
      ++ U.cc
        []
  show TextEntityTypePhoneNumber =
    "TextEntityTypePhoneNumber"
      ++ U.cc
        []
  show TextEntityTypeBankCardNumber =
    "TextEntityTypeBankCardNumber"
      ++ U.cc
        []
  show TextEntityTypeBold =
    "TextEntityTypeBold"
      ++ U.cc
        []
  show TextEntityTypeItalic =
    "TextEntityTypeItalic"
      ++ U.cc
        []
  show TextEntityTypeUnderline =
    "TextEntityTypeUnderline"
      ++ U.cc
        []
  show TextEntityTypeStrikethrough =
    "TextEntityTypeStrikethrough"
      ++ U.cc
        []
  show TextEntityTypeSpoiler =
    "TextEntityTypeSpoiler"
      ++ U.cc
        []
  show TextEntityTypeCode =
    "TextEntityTypeCode"
      ++ U.cc
        []
  show TextEntityTypePre =
    "TextEntityTypePre"
      ++ U.cc
        []
  show
    TextEntityTypePreCode
      { language = language_
      } =
      "TextEntityTypePreCode"
        ++ U.cc
          [ U.p "language" language_
          ]
  show
    TextEntityTypeTextUrl
      { url = url_
      } =
      "TextEntityTypeTextUrl"
        ++ U.cc
          [ U.p "url" url_
          ]
  show
    TextEntityTypeMentionName
      { user_id = user_id_
      } =
      "TextEntityTypeMentionName"
        ++ U.cc
          [ U.p "user_id" user_id_
          ]
  show
    TextEntityTypeMediaTimestamp
      { media_timestamp = media_timestamp_
      } =
      "TextEntityTypeMediaTimestamp"
        ++ U.cc
          [ U.p "media_timestamp" media_timestamp_
          ]

instance T.FromJSON TextEntityType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "textEntityTypeMention" -> parseTextEntityTypeMention v
      "textEntityTypeHashtag" -> parseTextEntityTypeHashtag v
      "textEntityTypeCashtag" -> parseTextEntityTypeCashtag v
      "textEntityTypeBotCommand" -> parseTextEntityTypeBotCommand v
      "textEntityTypeUrl" -> parseTextEntityTypeUrl v
      "textEntityTypeEmailAddress" -> parseTextEntityTypeEmailAddress v
      "textEntityTypePhoneNumber" -> parseTextEntityTypePhoneNumber v
      "textEntityTypeBankCardNumber" -> parseTextEntityTypeBankCardNumber v
      "textEntityTypeBold" -> parseTextEntityTypeBold v
      "textEntityTypeItalic" -> parseTextEntityTypeItalic v
      "textEntityTypeUnderline" -> parseTextEntityTypeUnderline v
      "textEntityTypeStrikethrough" -> parseTextEntityTypeStrikethrough v
      "textEntityTypeSpoiler" -> parseTextEntityTypeSpoiler v
      "textEntityTypeCode" -> parseTextEntityTypeCode v
      "textEntityTypePre" -> parseTextEntityTypePre v
      "textEntityTypePreCode" -> parseTextEntityTypePreCode v
      "textEntityTypeTextUrl" -> parseTextEntityTypeTextUrl v
      "textEntityTypeMentionName" -> parseTextEntityTypeMentionName v
      "textEntityTypeMediaTimestamp" -> parseTextEntityTypeMediaTimestamp v
      _ -> mempty
    where
      parseTextEntityTypeMention :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypeMention = A.withObject "TextEntityTypeMention" $ \_ -> return TextEntityTypeMention

      parseTextEntityTypeHashtag :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypeHashtag = A.withObject "TextEntityTypeHashtag" $ \_ -> return TextEntityTypeHashtag

      parseTextEntityTypeCashtag :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypeCashtag = A.withObject "TextEntityTypeCashtag" $ \_ -> return TextEntityTypeCashtag

      parseTextEntityTypeBotCommand :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypeBotCommand = A.withObject "TextEntityTypeBotCommand" $ \_ -> return TextEntityTypeBotCommand

      parseTextEntityTypeUrl :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypeUrl = A.withObject "TextEntityTypeUrl" $ \_ -> return TextEntityTypeUrl

      parseTextEntityTypeEmailAddress :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypeEmailAddress = A.withObject "TextEntityTypeEmailAddress" $ \_ -> return TextEntityTypeEmailAddress

      parseTextEntityTypePhoneNumber :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypePhoneNumber = A.withObject "TextEntityTypePhoneNumber" $ \_ -> return TextEntityTypePhoneNumber

      parseTextEntityTypeBankCardNumber :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypeBankCardNumber = A.withObject "TextEntityTypeBankCardNumber" $ \_ -> return TextEntityTypeBankCardNumber

      parseTextEntityTypeBold :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypeBold = A.withObject "TextEntityTypeBold" $ \_ -> return TextEntityTypeBold

      parseTextEntityTypeItalic :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypeItalic = A.withObject "TextEntityTypeItalic" $ \_ -> return TextEntityTypeItalic

      parseTextEntityTypeUnderline :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypeUnderline = A.withObject "TextEntityTypeUnderline" $ \_ -> return TextEntityTypeUnderline

      parseTextEntityTypeStrikethrough :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypeStrikethrough = A.withObject "TextEntityTypeStrikethrough" $ \_ -> return TextEntityTypeStrikethrough

      parseTextEntityTypeSpoiler :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypeSpoiler = A.withObject "TextEntityTypeSpoiler" $ \_ -> return TextEntityTypeSpoiler

      parseTextEntityTypeCode :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypeCode = A.withObject "TextEntityTypeCode" $ \_ -> return TextEntityTypeCode

      parseTextEntityTypePre :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypePre = A.withObject "TextEntityTypePre" $ \_ -> return TextEntityTypePre

      parseTextEntityTypePreCode :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypePreCode = A.withObject "TextEntityTypePreCode" $ \o -> do
        language_ <- o A..:? "language"
        return $ TextEntityTypePreCode {language = language_}

      parseTextEntityTypeTextUrl :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypeTextUrl = A.withObject "TextEntityTypeTextUrl" $ \o -> do
        url_ <- o A..:? "url"
        return $ TextEntityTypeTextUrl {url = url_}

      parseTextEntityTypeMentionName :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypeMentionName = A.withObject "TextEntityTypeMentionName" $ \o -> do
        user_id_ <- mconcat [o A..:? "user_id", U.rm <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ TextEntityTypeMentionName {user_id = user_id_}

      parseTextEntityTypeMediaTimestamp :: A.Value -> T.Parser TextEntityType
      parseTextEntityTypeMediaTimestamp = A.withObject "TextEntityTypeMediaTimestamp" $ \o -> do
        media_timestamp_ <- mconcat [o A..:? "media_timestamp", U.rm <$> (o A..: "media_timestamp" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ TextEntityTypeMediaTimestamp {media_timestamp = media_timestamp_}
  parseJSON _ = mempty

instance T.ToJSON TextEntityType where
  toJSON TextEntityTypeMention =
    A.object
      [ "@type" A..= T.String "textEntityTypeMention"
      ]
  toJSON TextEntityTypeHashtag =
    A.object
      [ "@type" A..= T.String "textEntityTypeHashtag"
      ]
  toJSON TextEntityTypeCashtag =
    A.object
      [ "@type" A..= T.String "textEntityTypeCashtag"
      ]
  toJSON TextEntityTypeBotCommand =
    A.object
      [ "@type" A..= T.String "textEntityTypeBotCommand"
      ]
  toJSON TextEntityTypeUrl =
    A.object
      [ "@type" A..= T.String "textEntityTypeUrl"
      ]
  toJSON TextEntityTypeEmailAddress =
    A.object
      [ "@type" A..= T.String "textEntityTypeEmailAddress"
      ]
  toJSON TextEntityTypePhoneNumber =
    A.object
      [ "@type" A..= T.String "textEntityTypePhoneNumber"
      ]
  toJSON TextEntityTypeBankCardNumber =
    A.object
      [ "@type" A..= T.String "textEntityTypeBankCardNumber"
      ]
  toJSON TextEntityTypeBold =
    A.object
      [ "@type" A..= T.String "textEntityTypeBold"
      ]
  toJSON TextEntityTypeItalic =
    A.object
      [ "@type" A..= T.String "textEntityTypeItalic"
      ]
  toJSON TextEntityTypeUnderline =
    A.object
      [ "@type" A..= T.String "textEntityTypeUnderline"
      ]
  toJSON TextEntityTypeStrikethrough =
    A.object
      [ "@type" A..= T.String "textEntityTypeStrikethrough"
      ]
  toJSON TextEntityTypeSpoiler =
    A.object
      [ "@type" A..= T.String "textEntityTypeSpoiler"
      ]
  toJSON TextEntityTypeCode =
    A.object
      [ "@type" A..= T.String "textEntityTypeCode"
      ]
  toJSON TextEntityTypePre =
    A.object
      [ "@type" A..= T.String "textEntityTypePre"
      ]
  toJSON
    TextEntityTypePreCode
      { language = language_
      } =
      A.object
        [ "@type" A..= T.String "textEntityTypePreCode",
          "language" A..= language_
        ]
  toJSON
    TextEntityTypeTextUrl
      { url = url_
      } =
      A.object
        [ "@type" A..= T.String "textEntityTypeTextUrl",
          "url" A..= url_
        ]
  toJSON
    TextEntityTypeMentionName
      { user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "textEntityTypeMentionName",
          "user_id" A..= user_id_
        ]
  toJSON
    TextEntityTypeMediaTimestamp
      { media_timestamp = media_timestamp_
      } =
      A.object
        [ "@type" A..= T.String "textEntityTypeMediaTimestamp",
          "media_timestamp" A..= media_timestamp_
        ]
