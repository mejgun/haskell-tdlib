module TD.Data.TextEntityType
  (TextEntityType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Represents a part of the text which must be formatted differently
data TextEntityType
  = TextEntityTypeMention -- ^ A mention of a user, a supergroup, or a channel by their username
  | TextEntityTypeHashtag -- ^ A hashtag text, beginning with "#" and optionally containing a chat username at the end
  | TextEntityTypeCashtag -- ^ A cashtag text, beginning with "$", consisting of capital English letters (e.g., "$USD"), and optionally containing a chat username at the end
  | TextEntityTypeBotCommand -- ^ A bot command, beginning with "/"
  | TextEntityTypeUrl -- ^ An HTTP URL
  | TextEntityTypeEmailAddress -- ^ An email address
  | TextEntityTypePhoneNumber -- ^ A phone number
  | TextEntityTypeBankCardNumber -- ^ A bank card number. The getBankCardInfo method can be used to get information about the bank card
  | TextEntityTypeBold -- ^ A bold text
  | TextEntityTypeItalic -- ^ An italic text
  | TextEntityTypeUnderline -- ^ An underlined text
  | TextEntityTypeStrikethrough -- ^ A strikethrough text
  | TextEntityTypeSpoiler -- ^ A spoiler text
  | TextEntityTypeCode -- ^ Text that must be formatted as if inside a code HTML tag
  | TextEntityTypePre -- ^ Text that must be formatted as if inside a pre HTML tag
  | TextEntityTypePreCode -- ^ Text that must be formatted as if inside pre, and code HTML tags
    { language :: Maybe T.Text -- ^ Programming language of the code; as defined by the sender
    }
  | TextEntityTypeBlockQuote -- ^ Text that must be formatted as if inside a blockquote HTML tag; not supported in secret chats
  | TextEntityTypeExpandableBlockQuote -- ^ Text that must be formatted as if inside a blockquote HTML tag and collapsed by default to 3 lines with the ability to show full text; not supported in secret chats
  | TextEntityTypeTextUrl -- ^ A text description shown instead of a raw URL
    { url :: Maybe T.Text -- ^ HTTP or tg:// URL to be opened when the link is clicked
    }
  | TextEntityTypeMentionName -- ^ A text shows instead of a raw mention of the user (e.g., when the user has no username)
    { user_id :: Maybe Int -- ^ Identifier of the mentioned user
    }
  | TextEntityTypeCustomEmoji -- ^ A custom emoji. The text behind a custom emoji must be an emoji. Only premium users can use premium custom emoji
    { custom_emoji_id :: Maybe Int -- ^ Unique identifier of the custom emoji
    }
  | TextEntityTypeMediaTimestamp -- ^ A media timestamp
    { media_timestamp :: Maybe Int -- ^ Timestamp from which a video/audio/video note/voice note/story playing must start, in seconds. The media can be in the content or the link preview of the current message, or in the same places in the replied message
    }
  deriving (Eq, Show)

instance I.ShortShow TextEntityType where
  shortShow TextEntityTypeMention
      = "TextEntityTypeMention"
  shortShow TextEntityTypeHashtag
      = "TextEntityTypeHashtag"
  shortShow TextEntityTypeCashtag
      = "TextEntityTypeCashtag"
  shortShow TextEntityTypeBotCommand
      = "TextEntityTypeBotCommand"
  shortShow TextEntityTypeUrl
      = "TextEntityTypeUrl"
  shortShow TextEntityTypeEmailAddress
      = "TextEntityTypeEmailAddress"
  shortShow TextEntityTypePhoneNumber
      = "TextEntityTypePhoneNumber"
  shortShow TextEntityTypeBankCardNumber
      = "TextEntityTypeBankCardNumber"
  shortShow TextEntityTypeBold
      = "TextEntityTypeBold"
  shortShow TextEntityTypeItalic
      = "TextEntityTypeItalic"
  shortShow TextEntityTypeUnderline
      = "TextEntityTypeUnderline"
  shortShow TextEntityTypeStrikethrough
      = "TextEntityTypeStrikethrough"
  shortShow TextEntityTypeSpoiler
      = "TextEntityTypeSpoiler"
  shortShow TextEntityTypeCode
      = "TextEntityTypeCode"
  shortShow TextEntityTypePre
      = "TextEntityTypePre"
  shortShow TextEntityTypePreCode
    { language = language_
    }
      = "TextEntityTypePreCode"
        ++ I.cc
        [ "language" `I.p` language_
        ]
  shortShow TextEntityTypeBlockQuote
      = "TextEntityTypeBlockQuote"
  shortShow TextEntityTypeExpandableBlockQuote
      = "TextEntityTypeExpandableBlockQuote"
  shortShow TextEntityTypeTextUrl
    { url = url_
    }
      = "TextEntityTypeTextUrl"
        ++ I.cc
        [ "url" `I.p` url_
        ]
  shortShow TextEntityTypeMentionName
    { user_id = user_id_
    }
      = "TextEntityTypeMentionName"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        ]
  shortShow TextEntityTypeCustomEmoji
    { custom_emoji_id = custom_emoji_id_
    }
      = "TextEntityTypeCustomEmoji"
        ++ I.cc
        [ "custom_emoji_id" `I.p` custom_emoji_id_
        ]
  shortShow TextEntityTypeMediaTimestamp
    { media_timestamp = media_timestamp_
    }
      = "TextEntityTypeMediaTimestamp"
        ++ I.cc
        [ "media_timestamp" `I.p` media_timestamp_
        ]

instance AT.FromJSON TextEntityType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "textEntityTypeMention"              -> pure TextEntityTypeMention
      "textEntityTypeHashtag"              -> pure TextEntityTypeHashtag
      "textEntityTypeCashtag"              -> pure TextEntityTypeCashtag
      "textEntityTypeBotCommand"           -> pure TextEntityTypeBotCommand
      "textEntityTypeUrl"                  -> pure TextEntityTypeUrl
      "textEntityTypeEmailAddress"         -> pure TextEntityTypeEmailAddress
      "textEntityTypePhoneNumber"          -> pure TextEntityTypePhoneNumber
      "textEntityTypeBankCardNumber"       -> pure TextEntityTypeBankCardNumber
      "textEntityTypeBold"                 -> pure TextEntityTypeBold
      "textEntityTypeItalic"               -> pure TextEntityTypeItalic
      "textEntityTypeUnderline"            -> pure TextEntityTypeUnderline
      "textEntityTypeStrikethrough"        -> pure TextEntityTypeStrikethrough
      "textEntityTypeSpoiler"              -> pure TextEntityTypeSpoiler
      "textEntityTypeCode"                 -> pure TextEntityTypeCode
      "textEntityTypePre"                  -> pure TextEntityTypePre
      "textEntityTypePreCode"              -> parseTextEntityTypePreCode v
      "textEntityTypeBlockQuote"           -> pure TextEntityTypeBlockQuote
      "textEntityTypeExpandableBlockQuote" -> pure TextEntityTypeExpandableBlockQuote
      "textEntityTypeTextUrl"              -> parseTextEntityTypeTextUrl v
      "textEntityTypeMentionName"          -> parseTextEntityTypeMentionName v
      "textEntityTypeCustomEmoji"          -> parseTextEntityTypeCustomEmoji v
      "textEntityTypeMediaTimestamp"       -> parseTextEntityTypeMediaTimestamp v
      _                                    -> mempty
    
    where
      parseTextEntityTypePreCode :: A.Value -> AT.Parser TextEntityType
      parseTextEntityTypePreCode = A.withObject "TextEntityTypePreCode" $ \o -> do
        language_ <- o A..:?  "language"
        pure $ TextEntityTypePreCode
          { language = language_
          }
      parseTextEntityTypeTextUrl :: A.Value -> AT.Parser TextEntityType
      parseTextEntityTypeTextUrl = A.withObject "TextEntityTypeTextUrl" $ \o -> do
        url_ <- o A..:?  "url"
        pure $ TextEntityTypeTextUrl
          { url = url_
          }
      parseTextEntityTypeMentionName :: A.Value -> AT.Parser TextEntityType
      parseTextEntityTypeMentionName = A.withObject "TextEntityTypeMentionName" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        pure $ TextEntityTypeMentionName
          { user_id = user_id_
          }
      parseTextEntityTypeCustomEmoji :: A.Value -> AT.Parser TextEntityType
      parseTextEntityTypeCustomEmoji = A.withObject "TextEntityTypeCustomEmoji" $ \o -> do
        custom_emoji_id_ <- fmap I.readInt64 <$> o A..:?  "custom_emoji_id"
        pure $ TextEntityTypeCustomEmoji
          { custom_emoji_id = custom_emoji_id_
          }
      parseTextEntityTypeMediaTimestamp :: A.Value -> AT.Parser TextEntityType
      parseTextEntityTypeMediaTimestamp = A.withObject "TextEntityTypeMediaTimestamp" $ \o -> do
        media_timestamp_ <- o A..:?  "media_timestamp"
        pure $ TextEntityTypeMediaTimestamp
          { media_timestamp = media_timestamp_
          }
  parseJSON _ = mempty

instance AT.ToJSON TextEntityType where
  toJSON TextEntityTypeMention
      = A.object
        [ "@type" A..= AT.String "textEntityTypeMention"
        ]
  toJSON TextEntityTypeHashtag
      = A.object
        [ "@type" A..= AT.String "textEntityTypeHashtag"
        ]
  toJSON TextEntityTypeCashtag
      = A.object
        [ "@type" A..= AT.String "textEntityTypeCashtag"
        ]
  toJSON TextEntityTypeBotCommand
      = A.object
        [ "@type" A..= AT.String "textEntityTypeBotCommand"
        ]
  toJSON TextEntityTypeUrl
      = A.object
        [ "@type" A..= AT.String "textEntityTypeUrl"
        ]
  toJSON TextEntityTypeEmailAddress
      = A.object
        [ "@type" A..= AT.String "textEntityTypeEmailAddress"
        ]
  toJSON TextEntityTypePhoneNumber
      = A.object
        [ "@type" A..= AT.String "textEntityTypePhoneNumber"
        ]
  toJSON TextEntityTypeBankCardNumber
      = A.object
        [ "@type" A..= AT.String "textEntityTypeBankCardNumber"
        ]
  toJSON TextEntityTypeBold
      = A.object
        [ "@type" A..= AT.String "textEntityTypeBold"
        ]
  toJSON TextEntityTypeItalic
      = A.object
        [ "@type" A..= AT.String "textEntityTypeItalic"
        ]
  toJSON TextEntityTypeUnderline
      = A.object
        [ "@type" A..= AT.String "textEntityTypeUnderline"
        ]
  toJSON TextEntityTypeStrikethrough
      = A.object
        [ "@type" A..= AT.String "textEntityTypeStrikethrough"
        ]
  toJSON TextEntityTypeSpoiler
      = A.object
        [ "@type" A..= AT.String "textEntityTypeSpoiler"
        ]
  toJSON TextEntityTypeCode
      = A.object
        [ "@type" A..= AT.String "textEntityTypeCode"
        ]
  toJSON TextEntityTypePre
      = A.object
        [ "@type" A..= AT.String "textEntityTypePre"
        ]
  toJSON TextEntityTypePreCode
    { language = language_
    }
      = A.object
        [ "@type"    A..= AT.String "textEntityTypePreCode"
        , "language" A..= language_
        ]
  toJSON TextEntityTypeBlockQuote
      = A.object
        [ "@type" A..= AT.String "textEntityTypeBlockQuote"
        ]
  toJSON TextEntityTypeExpandableBlockQuote
      = A.object
        [ "@type" A..= AT.String "textEntityTypeExpandableBlockQuote"
        ]
  toJSON TextEntityTypeTextUrl
    { url = url_
    }
      = A.object
        [ "@type" A..= AT.String "textEntityTypeTextUrl"
        , "url"   A..= url_
        ]
  toJSON TextEntityTypeMentionName
    { user_id = user_id_
    }
      = A.object
        [ "@type"   A..= AT.String "textEntityTypeMentionName"
        , "user_id" A..= user_id_
        ]
  toJSON TextEntityTypeCustomEmoji
    { custom_emoji_id = custom_emoji_id_
    }
      = A.object
        [ "@type"           A..= AT.String "textEntityTypeCustomEmoji"
        , "custom_emoji_id" A..= fmap I.writeInt64  custom_emoji_id_
        ]
  toJSON TextEntityTypeMediaTimestamp
    { media_timestamp = media_timestamp_
    }
      = A.object
        [ "@type"           A..= AT.String "textEntityTypeMediaTimestamp"
        , "media_timestamp" A..= media_timestamp_
        ]

