module TD.Data.RichText
  (RichText(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.DateTimeFormattingType as DateTimeFormattingType
import qualified TD.Data.Document as Document
import {-# SOURCE #-} qualified TD.Data.InlineButton as InlineButton

-- | Describes a formatted text object
data RichText
  = RichTextPlain -- ^ A plain text
    { text :: Maybe T.Text -- ^ Text
    }
  | RichTextBold -- ^ A bold rich text
    { _text :: Maybe RichText -- ^ Text
    }
  | RichTextItalic -- ^ An italicized rich text
    { _text :: Maybe RichText -- ^ Text
    }
  | RichTextUnderline -- ^ An underlined rich text
    { _text :: Maybe RichText -- ^ Text
    }
  | RichTextStrikethrough -- ^ A strikethrough rich text
    { _text :: Maybe RichText -- ^ Text
    }
  | RichTextSpoiler -- ^ A spoilered rich text
    { _text :: Maybe RichText -- ^ Text
    }
  | RichTextSubscript -- ^ A subscript rich text
    { _text :: Maybe RichText -- ^ Text
    }
  | RichTextSuperscript -- ^ A superscript rich text
    { _text :: Maybe RichText -- ^ Text
    }
  | RichTextMarked -- ^ A marked rich text
    { _text :: Maybe RichText -- ^ Text
    }
  | RichTextDateTime -- ^ A date and time
    { _text           :: Maybe RichText                                      -- ^ Original text
    , unix_time       :: Maybe Int                                           -- ^ Point in time (Unix timestamp) representing the date and time
    , formatting_type :: Maybe DateTimeFormattingType.DateTimeFormattingType -- ^ Date and time formatting type; may be null if none and the original text must not be changed
    }
  | RichTextMention -- ^ A mention of a Telegram user or chat by a username
    { _text    :: Maybe RichText -- ^ Text
    , username :: Maybe T.Text   -- ^ The username
    }
  | RichTextHashtag -- ^ A hashtag
    { _text   :: Maybe RichText -- ^ Text
    , hashtag :: Maybe T.Text   -- ^ The hashtag
    }
  | RichTextCashtag -- ^ A cashtag
    { _text   :: Maybe RichText -- ^ Text
    , cashtag :: Maybe T.Text   -- ^ The cashtag
    }
  | RichTextBankCardNumber -- ^ A bank card number
    { _text            :: Maybe RichText -- ^ Text
    , bank_card_number :: Maybe T.Text   -- ^ The number of the bank card
    }
  | RichTextTonAddress -- ^ An address in the TON blockchain
    { _text   :: Maybe RichText -- ^ Text
    , address :: Maybe T.Text   -- ^ The address
    }
  | RichTextBotCommand -- ^ A bot command
    { _text       :: Maybe RichText -- ^ Text
    , bot_command :: Maybe T.Text   -- ^ The bot command
    }
  | RichTextFixed -- ^ A fixed-width rich text
    { _text :: Maybe RichText -- ^ Text
    }
  | RichTextMentionName -- ^ A rich text that serves as a mention of a user
    { _text   :: Maybe RichText -- ^ Text
    , user_id :: Maybe Int      -- ^ Identifier of the mentioned user
    }
  | RichTextUrl -- ^ A rich text URL link
    { _text     :: Maybe RichText -- ^ Text
    , url       :: Maybe T.Text   -- ^ URL
    , is_cached :: Maybe Bool     -- ^ True, if the URL has cached instant view server-side; instant view only
    }
  | RichTextEmailAddress -- ^ A rich text email address
    { _text         :: Maybe RichText -- ^ Text
    , email_address :: Maybe T.Text   -- ^ Email address
    }
  | RichTextPhoneNumber -- ^ A rich text phone number
    { _text        :: Maybe RichText -- ^ Text
    , phone_number :: Maybe T.Text   -- ^ Phone number
    }
  | RichTextCustomEmoji -- ^ A custom emoji
    { custom_emoji_id  :: Maybe Int    -- ^ Unique identifier of the custom emoji
    , alternative_text :: Maybe T.Text -- ^ Alternative text for the custom emoji
    }
  | RichTextIcon -- ^ A small image inside the text; instant view only
    { document :: Maybe Document.Document -- ^ The image represented as a document. The image can be in GIF, JPEG, or PNG format
    , width    :: Maybe Int               -- ^ Width of a bounding box in which the image must be shown; 0 if unknown
    , height   :: Maybe Int               -- ^ Height of a bounding box in which the image must be shown; 0 if unknown
    }
  | RichTextMathematicalExpression -- ^ A mathematical expression
    { expression :: Maybe T.Text -- ^ The expression in LaTeX format
    }
  | RichTextButton -- ^ A button
    { button :: Maybe InlineButton.InlineButton -- ^ The button
    }
  | RichTextDiff -- ^ A rich text replacing another rich text; not supported in inputRichMessage
    { _text    :: Maybe RichText -- ^ Text
    , old_text :: Maybe RichText -- ^ The old text
    }
  | RichTextReference -- ^ A reference
    { name  :: Maybe T.Text   -- ^ Reference name
    , _text :: Maybe RichText -- ^ Text of the reference
    }
  | RichTextReferenceLink -- ^ A link to a reference on the same page
    { _text          :: Maybe RichText -- ^ The link text
    , reference_name :: Maybe T.Text   -- ^ The reference name
    , url            :: Maybe T.Text   -- ^ An HTTP URL that opens the reference
    }
  | RichTextAnchor -- ^ An anchor
    { name :: Maybe T.Text -- ^ Anchor name
    }
  | RichTextAnchorLink -- ^ A link to an anchor on the same page
    { _text       :: Maybe RichText -- ^ The link text
    , anchor_name :: Maybe T.Text   -- ^ The anchor name. If the name is empty, the link must bring back to top
    , url         :: Maybe T.Text   -- ^ An HTTP URL that opens the anchor
    }
  | RichTexts -- ^ A concatenation of rich texts
    { texts :: Maybe [RichText] -- ^ Texts
    }
  deriving (Eq, Show)

instance I.ShortShow RichText where
  shortShow RichTextPlain
    { text = text_
    }
      = "RichTextPlain"
        ++ I.cc
        [ "text" `I.p` text_
        ]
  shortShow RichTextBold
    { _text = _text_
    }
      = "RichTextBold"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  shortShow RichTextItalic
    { _text = _text_
    }
      = "RichTextItalic"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  shortShow RichTextUnderline
    { _text = _text_
    }
      = "RichTextUnderline"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  shortShow RichTextStrikethrough
    { _text = _text_
    }
      = "RichTextStrikethrough"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  shortShow RichTextSpoiler
    { _text = _text_
    }
      = "RichTextSpoiler"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  shortShow RichTextSubscript
    { _text = _text_
    }
      = "RichTextSubscript"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  shortShow RichTextSuperscript
    { _text = _text_
    }
      = "RichTextSuperscript"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  shortShow RichTextMarked
    { _text = _text_
    }
      = "RichTextMarked"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  shortShow RichTextDateTime
    { _text           = _text_
    , unix_time       = unix_time_
    , formatting_type = formatting_type_
    }
      = "RichTextDateTime"
        ++ I.cc
        [ "_text"           `I.p` _text_
        , "unix_time"       `I.p` unix_time_
        , "formatting_type" `I.p` formatting_type_
        ]
  shortShow RichTextMention
    { _text    = _text_
    , username = username_
    }
      = "RichTextMention"
        ++ I.cc
        [ "_text"    `I.p` _text_
        , "username" `I.p` username_
        ]
  shortShow RichTextHashtag
    { _text   = _text_
    , hashtag = hashtag_
    }
      = "RichTextHashtag"
        ++ I.cc
        [ "_text"   `I.p` _text_
        , "hashtag" `I.p` hashtag_
        ]
  shortShow RichTextCashtag
    { _text   = _text_
    , cashtag = cashtag_
    }
      = "RichTextCashtag"
        ++ I.cc
        [ "_text"   `I.p` _text_
        , "cashtag" `I.p` cashtag_
        ]
  shortShow RichTextBankCardNumber
    { _text            = _text_
    , bank_card_number = bank_card_number_
    }
      = "RichTextBankCardNumber"
        ++ I.cc
        [ "_text"            `I.p` _text_
        , "bank_card_number" `I.p` bank_card_number_
        ]
  shortShow RichTextTonAddress
    { _text   = _text_
    , address = address_
    }
      = "RichTextTonAddress"
        ++ I.cc
        [ "_text"   `I.p` _text_
        , "address" `I.p` address_
        ]
  shortShow RichTextBotCommand
    { _text       = _text_
    , bot_command = bot_command_
    }
      = "RichTextBotCommand"
        ++ I.cc
        [ "_text"       `I.p` _text_
        , "bot_command" `I.p` bot_command_
        ]
  shortShow RichTextFixed
    { _text = _text_
    }
      = "RichTextFixed"
        ++ I.cc
        [ "_text" `I.p` _text_
        ]
  shortShow RichTextMentionName
    { _text   = _text_
    , user_id = user_id_
    }
      = "RichTextMentionName"
        ++ I.cc
        [ "_text"   `I.p` _text_
        , "user_id" `I.p` user_id_
        ]
  shortShow RichTextUrl
    { _text     = _text_
    , url       = url_
    , is_cached = is_cached_
    }
      = "RichTextUrl"
        ++ I.cc
        [ "_text"     `I.p` _text_
        , "url"       `I.p` url_
        , "is_cached" `I.p` is_cached_
        ]
  shortShow RichTextEmailAddress
    { _text         = _text_
    , email_address = email_address_
    }
      = "RichTextEmailAddress"
        ++ I.cc
        [ "_text"         `I.p` _text_
        , "email_address" `I.p` email_address_
        ]
  shortShow RichTextPhoneNumber
    { _text        = _text_
    , phone_number = phone_number_
    }
      = "RichTextPhoneNumber"
        ++ I.cc
        [ "_text"        `I.p` _text_
        , "phone_number" `I.p` phone_number_
        ]
  shortShow RichTextCustomEmoji
    { custom_emoji_id  = custom_emoji_id_
    , alternative_text = alternative_text_
    }
      = "RichTextCustomEmoji"
        ++ I.cc
        [ "custom_emoji_id"  `I.p` custom_emoji_id_
        , "alternative_text" `I.p` alternative_text_
        ]
  shortShow RichTextIcon
    { document = document_
    , width    = width_
    , height   = height_
    }
      = "RichTextIcon"
        ++ I.cc
        [ "document" `I.p` document_
        , "width"    `I.p` width_
        , "height"   `I.p` height_
        ]
  shortShow RichTextMathematicalExpression
    { expression = expression_
    }
      = "RichTextMathematicalExpression"
        ++ I.cc
        [ "expression" `I.p` expression_
        ]
  shortShow RichTextButton
    { button = button_
    }
      = "RichTextButton"
        ++ I.cc
        [ "button" `I.p` button_
        ]
  shortShow RichTextDiff
    { _text    = _text_
    , old_text = old_text_
    }
      = "RichTextDiff"
        ++ I.cc
        [ "_text"    `I.p` _text_
        , "old_text" `I.p` old_text_
        ]
  shortShow RichTextReference
    { name  = name_
    , _text = _text_
    }
      = "RichTextReference"
        ++ I.cc
        [ "name"  `I.p` name_
        , "_text" `I.p` _text_
        ]
  shortShow RichTextReferenceLink
    { _text          = _text_
    , reference_name = reference_name_
    , url            = url_
    }
      = "RichTextReferenceLink"
        ++ I.cc
        [ "_text"          `I.p` _text_
        , "reference_name" `I.p` reference_name_
        , "url"            `I.p` url_
        ]
  shortShow RichTextAnchor
    { name = name_
    }
      = "RichTextAnchor"
        ++ I.cc
        [ "name" `I.p` name_
        ]
  shortShow RichTextAnchorLink
    { _text       = _text_
    , anchor_name = anchor_name_
    , url         = url_
    }
      = "RichTextAnchorLink"
        ++ I.cc
        [ "_text"       `I.p` _text_
        , "anchor_name" `I.p` anchor_name_
        , "url"         `I.p` url_
        ]
  shortShow RichTexts
    { texts = texts_
    }
      = "RichTexts"
        ++ I.cc
        [ "texts" `I.p` texts_
        ]

instance AT.FromJSON RichText where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "richTextPlain"                  -> parseRichTextPlain v
      "richTextBold"                   -> parseRichTextBold v
      "richTextItalic"                 -> parseRichTextItalic v
      "richTextUnderline"              -> parseRichTextUnderline v
      "richTextStrikethrough"          -> parseRichTextStrikethrough v
      "richTextSpoiler"                -> parseRichTextSpoiler v
      "richTextSubscript"              -> parseRichTextSubscript v
      "richTextSuperscript"            -> parseRichTextSuperscript v
      "richTextMarked"                 -> parseRichTextMarked v
      "richTextDateTime"               -> parseRichTextDateTime v
      "richTextMention"                -> parseRichTextMention v
      "richTextHashtag"                -> parseRichTextHashtag v
      "richTextCashtag"                -> parseRichTextCashtag v
      "richTextBankCardNumber"         -> parseRichTextBankCardNumber v
      "richTextTonAddress"             -> parseRichTextTonAddress v
      "richTextBotCommand"             -> parseRichTextBotCommand v
      "richTextFixed"                  -> parseRichTextFixed v
      "richTextMentionName"            -> parseRichTextMentionName v
      "richTextUrl"                    -> parseRichTextUrl v
      "richTextEmailAddress"           -> parseRichTextEmailAddress v
      "richTextPhoneNumber"            -> parseRichTextPhoneNumber v
      "richTextCustomEmoji"            -> parseRichTextCustomEmoji v
      "richTextIcon"                   -> parseRichTextIcon v
      "richTextMathematicalExpression" -> parseRichTextMathematicalExpression v
      "richTextButton"                 -> parseRichTextButton v
      "richTextDiff"                   -> parseRichTextDiff v
      "richTextReference"              -> parseRichTextReference v
      "richTextReferenceLink"          -> parseRichTextReferenceLink v
      "richTextAnchor"                 -> parseRichTextAnchor v
      "richTextAnchorLink"             -> parseRichTextAnchorLink v
      "richTexts"                      -> parseRichTexts v
      _                                -> mempty
    
    where
      parseRichTextPlain :: A.Value -> AT.Parser RichText
      parseRichTextPlain = A.withObject "RichTextPlain" $ \o -> do
        text_ <- o A..:?  "text"
        pure $ RichTextPlain
          { text = text_
          }
      parseRichTextBold :: A.Value -> AT.Parser RichText
      parseRichTextBold = A.withObject "RichTextBold" $ \o -> do
        _text_ <- o A..:?  "text"
        pure $ RichTextBold
          { _text = _text_
          }
      parseRichTextItalic :: A.Value -> AT.Parser RichText
      parseRichTextItalic = A.withObject "RichTextItalic" $ \o -> do
        _text_ <- o A..:?  "text"
        pure $ RichTextItalic
          { _text = _text_
          }
      parseRichTextUnderline :: A.Value -> AT.Parser RichText
      parseRichTextUnderline = A.withObject "RichTextUnderline" $ \o -> do
        _text_ <- o A..:?  "text"
        pure $ RichTextUnderline
          { _text = _text_
          }
      parseRichTextStrikethrough :: A.Value -> AT.Parser RichText
      parseRichTextStrikethrough = A.withObject "RichTextStrikethrough" $ \o -> do
        _text_ <- o A..:?  "text"
        pure $ RichTextStrikethrough
          { _text = _text_
          }
      parseRichTextSpoiler :: A.Value -> AT.Parser RichText
      parseRichTextSpoiler = A.withObject "RichTextSpoiler" $ \o -> do
        _text_ <- o A..:?  "text"
        pure $ RichTextSpoiler
          { _text = _text_
          }
      parseRichTextSubscript :: A.Value -> AT.Parser RichText
      parseRichTextSubscript = A.withObject "RichTextSubscript" $ \o -> do
        _text_ <- o A..:?  "text"
        pure $ RichTextSubscript
          { _text = _text_
          }
      parseRichTextSuperscript :: A.Value -> AT.Parser RichText
      parseRichTextSuperscript = A.withObject "RichTextSuperscript" $ \o -> do
        _text_ <- o A..:?  "text"
        pure $ RichTextSuperscript
          { _text = _text_
          }
      parseRichTextMarked :: A.Value -> AT.Parser RichText
      parseRichTextMarked = A.withObject "RichTextMarked" $ \o -> do
        _text_ <- o A..:?  "text"
        pure $ RichTextMarked
          { _text = _text_
          }
      parseRichTextDateTime :: A.Value -> AT.Parser RichText
      parseRichTextDateTime = A.withObject "RichTextDateTime" $ \o -> do
        _text_           <- o A..:?  "text"
        unix_time_       <- o A..:?  "unix_time"
        formatting_type_ <- o A..:?  "formatting_type"
        pure $ RichTextDateTime
          { _text           = _text_
          , unix_time       = unix_time_
          , formatting_type = formatting_type_
          }
      parseRichTextMention :: A.Value -> AT.Parser RichText
      parseRichTextMention = A.withObject "RichTextMention" $ \o -> do
        _text_    <- o A..:?  "text"
        username_ <- o A..:?  "username"
        pure $ RichTextMention
          { _text    = _text_
          , username = username_
          }
      parseRichTextHashtag :: A.Value -> AT.Parser RichText
      parseRichTextHashtag = A.withObject "RichTextHashtag" $ \o -> do
        _text_   <- o A..:?  "text"
        hashtag_ <- o A..:?  "hashtag"
        pure $ RichTextHashtag
          { _text   = _text_
          , hashtag = hashtag_
          }
      parseRichTextCashtag :: A.Value -> AT.Parser RichText
      parseRichTextCashtag = A.withObject "RichTextCashtag" $ \o -> do
        _text_   <- o A..:?  "text"
        cashtag_ <- o A..:?  "cashtag"
        pure $ RichTextCashtag
          { _text   = _text_
          , cashtag = cashtag_
          }
      parseRichTextBankCardNumber :: A.Value -> AT.Parser RichText
      parseRichTextBankCardNumber = A.withObject "RichTextBankCardNumber" $ \o -> do
        _text_            <- o A..:?  "text"
        bank_card_number_ <- o A..:?  "bank_card_number"
        pure $ RichTextBankCardNumber
          { _text            = _text_
          , bank_card_number = bank_card_number_
          }
      parseRichTextTonAddress :: A.Value -> AT.Parser RichText
      parseRichTextTonAddress = A.withObject "RichTextTonAddress" $ \o -> do
        _text_   <- o A..:?  "text"
        address_ <- o A..:?  "address"
        pure $ RichTextTonAddress
          { _text   = _text_
          , address = address_
          }
      parseRichTextBotCommand :: A.Value -> AT.Parser RichText
      parseRichTextBotCommand = A.withObject "RichTextBotCommand" $ \o -> do
        _text_       <- o A..:?  "text"
        bot_command_ <- o A..:?  "bot_command"
        pure $ RichTextBotCommand
          { _text       = _text_
          , bot_command = bot_command_
          }
      parseRichTextFixed :: A.Value -> AT.Parser RichText
      parseRichTextFixed = A.withObject "RichTextFixed" $ \o -> do
        _text_ <- o A..:?  "text"
        pure $ RichTextFixed
          { _text = _text_
          }
      parseRichTextMentionName :: A.Value -> AT.Parser RichText
      parseRichTextMentionName = A.withObject "RichTextMentionName" $ \o -> do
        _text_   <- o A..:?  "text"
        user_id_ <- o A..:?  "user_id"
        pure $ RichTextMentionName
          { _text   = _text_
          , user_id = user_id_
          }
      parseRichTextUrl :: A.Value -> AT.Parser RichText
      parseRichTextUrl = A.withObject "RichTextUrl" $ \o -> do
        _text_     <- o A..:?  "text"
        url_       <- o A..:?  "url"
        is_cached_ <- o A..:?  "is_cached"
        pure $ RichTextUrl
          { _text     = _text_
          , url       = url_
          , is_cached = is_cached_
          }
      parseRichTextEmailAddress :: A.Value -> AT.Parser RichText
      parseRichTextEmailAddress = A.withObject "RichTextEmailAddress" $ \o -> do
        _text_         <- o A..:?  "text"
        email_address_ <- o A..:?  "email_address"
        pure $ RichTextEmailAddress
          { _text         = _text_
          , email_address = email_address_
          }
      parseRichTextPhoneNumber :: A.Value -> AT.Parser RichText
      parseRichTextPhoneNumber = A.withObject "RichTextPhoneNumber" $ \o -> do
        _text_        <- o A..:?  "text"
        phone_number_ <- o A..:?  "phone_number"
        pure $ RichTextPhoneNumber
          { _text        = _text_
          , phone_number = phone_number_
          }
      parseRichTextCustomEmoji :: A.Value -> AT.Parser RichText
      parseRichTextCustomEmoji = A.withObject "RichTextCustomEmoji" $ \o -> do
        custom_emoji_id_  <- fmap I.readInt64 <$> o A..:?  "custom_emoji_id"
        alternative_text_ <- o A..:?                       "alternative_text"
        pure $ RichTextCustomEmoji
          { custom_emoji_id  = custom_emoji_id_
          , alternative_text = alternative_text_
          }
      parseRichTextIcon :: A.Value -> AT.Parser RichText
      parseRichTextIcon = A.withObject "RichTextIcon" $ \o -> do
        document_ <- o A..:?  "document"
        width_    <- o A..:?  "width"
        height_   <- o A..:?  "height"
        pure $ RichTextIcon
          { document = document_
          , width    = width_
          , height   = height_
          }
      parseRichTextMathematicalExpression :: A.Value -> AT.Parser RichText
      parseRichTextMathematicalExpression = A.withObject "RichTextMathematicalExpression" $ \o -> do
        expression_ <- o A..:?  "expression"
        pure $ RichTextMathematicalExpression
          { expression = expression_
          }
      parseRichTextButton :: A.Value -> AT.Parser RichText
      parseRichTextButton = A.withObject "RichTextButton" $ \o -> do
        button_ <- o A..:?  "button"
        pure $ RichTextButton
          { button = button_
          }
      parseRichTextDiff :: A.Value -> AT.Parser RichText
      parseRichTextDiff = A.withObject "RichTextDiff" $ \o -> do
        _text_    <- o A..:?  "text"
        old_text_ <- o A..:?  "old_text"
        pure $ RichTextDiff
          { _text    = _text_
          , old_text = old_text_
          }
      parseRichTextReference :: A.Value -> AT.Parser RichText
      parseRichTextReference = A.withObject "RichTextReference" $ \o -> do
        name_  <- o A..:?  "name"
        _text_ <- o A..:?  "text"
        pure $ RichTextReference
          { name  = name_
          , _text = _text_
          }
      parseRichTextReferenceLink :: A.Value -> AT.Parser RichText
      parseRichTextReferenceLink = A.withObject "RichTextReferenceLink" $ \o -> do
        _text_          <- o A..:?  "text"
        reference_name_ <- o A..:?  "reference_name"
        url_            <- o A..:?  "url"
        pure $ RichTextReferenceLink
          { _text          = _text_
          , reference_name = reference_name_
          , url            = url_
          }
      parseRichTextAnchor :: A.Value -> AT.Parser RichText
      parseRichTextAnchor = A.withObject "RichTextAnchor" $ \o -> do
        name_ <- o A..:?  "name"
        pure $ RichTextAnchor
          { name = name_
          }
      parseRichTextAnchorLink :: A.Value -> AT.Parser RichText
      parseRichTextAnchorLink = A.withObject "RichTextAnchorLink" $ \o -> do
        _text_       <- o A..:?  "text"
        anchor_name_ <- o A..:?  "anchor_name"
        url_         <- o A..:?  "url"
        pure $ RichTextAnchorLink
          { _text       = _text_
          , anchor_name = anchor_name_
          , url         = url_
          }
      parseRichTexts :: A.Value -> AT.Parser RichText
      parseRichTexts = A.withObject "RichTexts" $ \o -> do
        texts_ <- o A..:?  "texts"
        pure $ RichTexts
          { texts = texts_
          }
  parseJSON _ = mempty

instance AT.ToJSON RichText where
  toJSON RichTextPlain
    { text = text_
    }
      = A.object
        [ "@type" A..= AT.String "richTextPlain"
        , "text"  A..= text_
        ]
  toJSON RichTextBold
    { _text = _text_
    }
      = A.object
        [ "@type" A..= AT.String "richTextBold"
        , "text"  A..= _text_
        ]
  toJSON RichTextItalic
    { _text = _text_
    }
      = A.object
        [ "@type" A..= AT.String "richTextItalic"
        , "text"  A..= _text_
        ]
  toJSON RichTextUnderline
    { _text = _text_
    }
      = A.object
        [ "@type" A..= AT.String "richTextUnderline"
        , "text"  A..= _text_
        ]
  toJSON RichTextStrikethrough
    { _text = _text_
    }
      = A.object
        [ "@type" A..= AT.String "richTextStrikethrough"
        , "text"  A..= _text_
        ]
  toJSON RichTextSpoiler
    { _text = _text_
    }
      = A.object
        [ "@type" A..= AT.String "richTextSpoiler"
        , "text"  A..= _text_
        ]
  toJSON RichTextSubscript
    { _text = _text_
    }
      = A.object
        [ "@type" A..= AT.String "richTextSubscript"
        , "text"  A..= _text_
        ]
  toJSON RichTextSuperscript
    { _text = _text_
    }
      = A.object
        [ "@type" A..= AT.String "richTextSuperscript"
        , "text"  A..= _text_
        ]
  toJSON RichTextMarked
    { _text = _text_
    }
      = A.object
        [ "@type" A..= AT.String "richTextMarked"
        , "text"  A..= _text_
        ]
  toJSON RichTextDateTime
    { _text           = _text_
    , unix_time       = unix_time_
    , formatting_type = formatting_type_
    }
      = A.object
        [ "@type"           A..= AT.String "richTextDateTime"
        , "text"            A..= _text_
        , "unix_time"       A..= unix_time_
        , "formatting_type" A..= formatting_type_
        ]
  toJSON RichTextMention
    { _text    = _text_
    , username = username_
    }
      = A.object
        [ "@type"    A..= AT.String "richTextMention"
        , "text"     A..= _text_
        , "username" A..= username_
        ]
  toJSON RichTextHashtag
    { _text   = _text_
    , hashtag = hashtag_
    }
      = A.object
        [ "@type"   A..= AT.String "richTextHashtag"
        , "text"    A..= _text_
        , "hashtag" A..= hashtag_
        ]
  toJSON RichTextCashtag
    { _text   = _text_
    , cashtag = cashtag_
    }
      = A.object
        [ "@type"   A..= AT.String "richTextCashtag"
        , "text"    A..= _text_
        , "cashtag" A..= cashtag_
        ]
  toJSON RichTextBankCardNumber
    { _text            = _text_
    , bank_card_number = bank_card_number_
    }
      = A.object
        [ "@type"            A..= AT.String "richTextBankCardNumber"
        , "text"             A..= _text_
        , "bank_card_number" A..= bank_card_number_
        ]
  toJSON RichTextTonAddress
    { _text   = _text_
    , address = address_
    }
      = A.object
        [ "@type"   A..= AT.String "richTextTonAddress"
        , "text"    A..= _text_
        , "address" A..= address_
        ]
  toJSON RichTextBotCommand
    { _text       = _text_
    , bot_command = bot_command_
    }
      = A.object
        [ "@type"       A..= AT.String "richTextBotCommand"
        , "text"        A..= _text_
        , "bot_command" A..= bot_command_
        ]
  toJSON RichTextFixed
    { _text = _text_
    }
      = A.object
        [ "@type" A..= AT.String "richTextFixed"
        , "text"  A..= _text_
        ]
  toJSON RichTextMentionName
    { _text   = _text_
    , user_id = user_id_
    }
      = A.object
        [ "@type"   A..= AT.String "richTextMentionName"
        , "text"    A..= _text_
        , "user_id" A..= user_id_
        ]
  toJSON RichTextUrl
    { _text     = _text_
    , url       = url_
    , is_cached = is_cached_
    }
      = A.object
        [ "@type"     A..= AT.String "richTextUrl"
        , "text"      A..= _text_
        , "url"       A..= url_
        , "is_cached" A..= is_cached_
        ]
  toJSON RichTextEmailAddress
    { _text         = _text_
    , email_address = email_address_
    }
      = A.object
        [ "@type"         A..= AT.String "richTextEmailAddress"
        , "text"          A..= _text_
        , "email_address" A..= email_address_
        ]
  toJSON RichTextPhoneNumber
    { _text        = _text_
    , phone_number = phone_number_
    }
      = A.object
        [ "@type"        A..= AT.String "richTextPhoneNumber"
        , "text"         A..= _text_
        , "phone_number" A..= phone_number_
        ]
  toJSON RichTextCustomEmoji
    { custom_emoji_id  = custom_emoji_id_
    , alternative_text = alternative_text_
    }
      = A.object
        [ "@type"            A..= AT.String "richTextCustomEmoji"
        , "custom_emoji_id"  A..= fmap I.writeInt64  custom_emoji_id_
        , "alternative_text" A..= alternative_text_
        ]
  toJSON RichTextIcon
    { document = document_
    , width    = width_
    , height   = height_
    }
      = A.object
        [ "@type"    A..= AT.String "richTextIcon"
        , "document" A..= document_
        , "width"    A..= width_
        , "height"   A..= height_
        ]
  toJSON RichTextMathematicalExpression
    { expression = expression_
    }
      = A.object
        [ "@type"      A..= AT.String "richTextMathematicalExpression"
        , "expression" A..= expression_
        ]
  toJSON RichTextButton
    { button = button_
    }
      = A.object
        [ "@type"  A..= AT.String "richTextButton"
        , "button" A..= button_
        ]
  toJSON RichTextDiff
    { _text    = _text_
    , old_text = old_text_
    }
      = A.object
        [ "@type"    A..= AT.String "richTextDiff"
        , "text"     A..= _text_
        , "old_text" A..= old_text_
        ]
  toJSON RichTextReference
    { name  = name_
    , _text = _text_
    }
      = A.object
        [ "@type" A..= AT.String "richTextReference"
        , "name"  A..= name_
        , "text"  A..= _text_
        ]
  toJSON RichTextReferenceLink
    { _text          = _text_
    , reference_name = reference_name_
    , url            = url_
    }
      = A.object
        [ "@type"          A..= AT.String "richTextReferenceLink"
        , "text"           A..= _text_
        , "reference_name" A..= reference_name_
        , "url"            A..= url_
        ]
  toJSON RichTextAnchor
    { name = name_
    }
      = A.object
        [ "@type" A..= AT.String "richTextAnchor"
        , "name"  A..= name_
        ]
  toJSON RichTextAnchorLink
    { _text       = _text_
    , anchor_name = anchor_name_
    , url         = url_
    }
      = A.object
        [ "@type"       A..= AT.String "richTextAnchorLink"
        , "text"        A..= _text_
        , "anchor_name" A..= anchor_name_
        , "url"         A..= url_
        ]
  toJSON RichTexts
    { texts = texts_
    }
      = A.object
        [ "@type" A..= AT.String "richTexts"
        , "texts" A..= texts_
        ]

